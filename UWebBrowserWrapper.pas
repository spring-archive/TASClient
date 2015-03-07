{
 * ***** BEGIN LICENSE BLOCK *****
 * 
 * Version: MPL 1.1
 * 
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with the
 * License. You may obtain a copy of the License at http://www.mozilla.org/MPL/
 * 
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 * the specific language governing rights and limitations under the License.
 * 
 * The Original Code is "TWebBrowser IO Wrapper Class".
 * 
 * The Initial Developer of the Original Code is Peter Johnson
 * (http://www.delphidabbler.com/).
 * 
 * Portions created by the Initial Developer are Copyright (C) 2004 Peter
 * Johnson. All Rights Reserved.
 * 
 * Contributor(s):
 * 
 * ***** END LICENSE BLOCK *****
}


{
  IMPORTANT NOTE
  --------------

  The code presented here accompanies the article "How to load and save
  documents in TWebBrowser in a Delphi-like way" which can be found at
  http://www.delphidabbler.com/articles.php?article=14.

  The code is presented for demonstration purposes only. It should not be used
  in a production environment without thoroughly testing it first. No guarantee
  or warranty as to the suitability of this code is provided and it is used at
  your own risk.
}


{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}

unit UWebBrowserWrapper;

interface

uses
  // Delphi
  Classes, SHDocVw, UContainer;

type
  // Save "style" used in TWebBrowserWrapper.Save*** methods
  TWebBrowserSaveStyle = (wbsAll, wbsBodyHTML, wbsBodyText);

  // Wrapper class
  TWebBrowserWrapper = class(TWebBrowser)
  protected // "Helper" methods
    Fwb : TWBContainer;
    procedure InternalLoadDocumentFromStream(const Stream: TStream);
    procedure InternalSaveBodyHTMLToStream(const Stream: TStream);
    procedure InternalSaveBodyTextToStream(const Stream: TStream);
    procedure InternalSaveDocumentToStream(const Stream: TStream);
    function GetUrl: string;
    procedure SetUrl(URL: string);
    function GetUseCustomCtxMenu:boolean;
    procedure SetUseCustomCtxMenu(b: boolean);
    function GetShow3DBorder:boolean;
    procedure SetShow3DBorder(b: boolean);
    function GetShowScrollBars:boolean;
    procedure SetShowScrollBars(b: boolean);
    function GetAllowTextSelection:boolean;
    procedure SetAllowTextSelection(b: boolean);
    procedure CreateContainer;
  public
    constructor Create(Owner: TComponent);
    procedure LoadFromFile(const FileName: string);
    procedure LoadFromStream(const Stream: TStream);
    procedure LoadFromString(const HTML: string);
    function NavigateToLocalFile(const FileName: string): Boolean;
    procedure NavigateToResource(const Module: HMODULE; const ResName: PChar;
      const ResType: PChar = nil); overload;
    procedure NavigateToResource(const ModuleName: string; const ResName: PChar;
      const ResType: PChar = nil); overload;
    procedure NavigateToURL(const URL: string);
    function SaveToString(const Style: TWebBrowserSaveStyle = wbsAll): string;
    procedure SaveToStream(const Stream: TStream;
      const Style: TWebBrowserSaveStyle = wbsAll);
    procedure SaveToFile(const FileName: string;
      const Style: TWebBrowserSaveStyle = wbsAll);
  published
    property URL: string read GetURL write SetUrl;
    property UseCustomCtxMenu: Boolean read GetUseCustomCtxMenu write SetUseCustomCtxMenu;
    property Show3DBorder: Boolean read GetShow3DBorder write SetShow3DBorder;
    property ShowScrollBars: Boolean read GetShowScrollBars write SetShowScrollBars;
    property AllowTextSelection: Boolean read GetAllowTextSelection write SetAllowTextSelection;
  end;

implementation

uses
  // Delphi
  SysUtils, StrUtils, Windows, ActiveX, Forms, MSHTML;


{ Help routines }

{ 
  Following function from DelphiDabbler CodeSnippets database at
  http://www.delphidabbler.com/codensip.php
}

function URLEncode(const S: string): string;
var
  Idx: Integer; // loops thru characters in string
begin
  Result := '';
  for Idx := 1 to Length(S) do
  begin
    case S[Idx] of
      'A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.': Result := Result + S[Idx];
      ' ': Result := Result + '+';
      else Result := Result + '%' + SysUtils.IntToHex(Ord(S[Idx]), 2);
    end;
  end;
end;

{
  Following 2 functions from DelphiDabbler article "How to create and use HTML
  resource files" at http://www.delphidabbler.com/articles.php?article=10
}

function MakeResourceURL(const ModuleName: string; const ResName: PChar;
  const ResType: PChar = nil): string; overload;
  // ---------------------------------------------------------------------------
  function ResNameOrTypeToString(R: PChar): string;
  begin
    if HiWord(LongWord(R)) = 0 then
      // high word = 0 => numeric resource id
      // numeric value is stored in low word
      Result := Format('#%d', [LoWord(LongWord(R))])
    else
      // high word <> 0 => string value
      // PChar is implicitly converted to string
      Result := R;
  end;
  // ---------------------------------------------------------------------------
begin
  Assert(ModuleName <> '');
  Assert(Assigned(ResName));
  Result := 'res://' + URLEncode(ModuleName);
  if Assigned(ResType) then
    Result := Result + '/' + URLEncode(ResNameOrTypeToString(ResType));
  Result := Result + '/' + URLEncode(ResNameOrTypeToString(ResName));
end;

function MakeResourceURL(const Module: HMODULE; const ResName: PChar;
  const ResType: PChar = nil): string; overload;
begin
  Result := MakeResourceURL(GetModuleName(Module), ResName, ResType);
end;


{ TWebBrowserWrapper }


procedure TWebBrowserWrapper.InternalLoadDocumentFromStream(
  const Stream: TStream);
var
  PersistStreamInit: IPersistStreamInit;
  StreamAdapter: IStream;
begin
  Assert(Assigned(Document));
  // Get IPersistStreamInit interface on document object
  if Document.QueryInterface(
    IPersistStreamInit, PersistStreamInit
  ) = S_OK then
  begin
    // Clear document
    if PersistStreamInit.InitNew = S_OK then
    begin
      // Get IStream interface on stream
      StreamAdapter:= TStreamAdapter.Create(Stream);
      // Load data from Stream into WebBrowser
      PersistStreamInit.Load(StreamAdapter);
    end;
  end;
end;

procedure TWebBrowserWrapper.InternalSaveBodyHTMLToStream(
  const Stream: TStream);
var
  HTMLStr: string;
  Doc: IHTMLDocument2;
  BodyElement: IHTMLElement;
begin
  Assert(Assigned(Document));
  if Document.QueryInterface(IHTMLDocument2, Doc) = S_OK then
  begin
    BodyElement := Doc.body;
    if Assigned(BodyElement) then
    begin
      HTMLStr := BodyElement.innerHTML;
      Stream.WriteBuffer(HTMLStr[1], Length(HTMLStr));
    end;
  end;
end;

procedure TWebBrowserWrapper.InternalSaveBodyTextToStream(
  const Stream: TStream);
var
  TextStr: string;
  Doc: IHTMLDocument2;
  BodyElement: IHTMLElement;
begin
  Assert(Assigned(Document));
  if Document.QueryInterface(IHTMLDocument2, Doc) = S_OK then
  begin
    BodyElement := Doc.body;
    if Assigned(BodyElement) then
    begin
      TextStr := BodyElement.innerText;
      Stream.WriteBuffer(TextStr[1], Length(TextStr));
    end;
  end;
end;

procedure TWebBrowserWrapper.InternalSaveDocumentToStream(
  const Stream: TStream);
var
  StreamAdapter: IStream;
  PersistStreamInit: IPersistStreamInit;
begin
  Assert(Assigned(Document));
  if Document.QueryInterface(
    IPersistStreamInit, PersistStreamInit
  ) = S_OK then
  begin
    StreamAdapter := TStreamAdapter.Create(Stream);
    PersistStreamInit.Save(StreamAdapter, True);
  end;
end;

procedure TWebBrowserWrapper.LoadFromFile(const FileName: string);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    LoadFromStream(FileStream);
  finally
    FileStream.Free;
  end;
end;

procedure TWebBrowserWrapper.LoadFromStream(const Stream: TStream);
begin
  NavigateToURL('about:blank');
  InternalLoadDocumentFromStream(Stream);
end;

procedure TWebBrowserWrapper.LoadFromString(const HTML: string);
var
  StringStream: TStringStream;
begin
  StringStream := TStringStream.Create(HTML);
  try
    LoadFromStream(StringStream);
  finally
    StringStream.Free;
  end;
end;

function TWebBrowserWrapper.NavigateToLocalFile(const FileName: string): Boolean;
begin
  Result := FileExists(FileName);
  if Result then
    NavigateToURL('file://' + FileName)
end;

procedure TWebBrowserWrapper.NavigateToResource(const Module: HMODULE;
  const ResName, ResType: PChar);
begin
  NavigateToURL(MakeResourceURL(Module, ResName, ResType));
end;

procedure TWebBrowserWrapper.NavigateToResource(const ModuleName: string;
  const ResName, ResType: PChar);
begin
  NavigateToURL(MakeResourceURL(ModuleName, ResName, ResType));
end;

procedure TWebBrowserWrapper.NavigateToURL(const URL: string);
var
  Flags: OleVariant;  // flags that determine action
begin
  // Don't record in history
  Flags := navNoHistory;
  if AnsiStartsText('res://', URL) or AnsiStartsText('file://', URL)
    or AnsiStartsText('about:', URL) or AnsiStartsText('javascript:', URL)
    or AnsiStartsText('mailto:', URL) then
    // don't use cache for local files
    Flags := Flags or navNoReadFromCache or navNoWriteToCache;
  // Do the navigation and wait for it to complete
  Navigate(WideString(URL), Flags);
  while ReadyState <> READYSTATE_COMPLETE do
  begin
    Forms.Application.ProcessMessages;
    Sleep(0);
  end;
end;

procedure TWebBrowserWrapper.SaveToFile(const FileName: string;
  const Style: TWebBrowserSaveStyle);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(FileStream, Style);
  finally
    FileStream.Free;
  end;
end;

procedure TWebBrowserWrapper.SaveToStream(const Stream: TStream;
  const Style: TWebBrowserSaveStyle);
begin
  if Assigned(Document) then
  begin
    case Style of
      wbsAll:      InternalSaveDocumentToStream(Stream);
      wbsBodyHTML: InternalSaveBodyHTMLToStream(Stream);
      wbsBodyText: InternalSaveBodyTextToStream(Stream);
    end;
  end;
end;

function TWebBrowserWrapper.SaveToString(
  const Style: TWebBrowserSaveStyle): string;
var
  StringStream: TStringStream;
begin
  // For BodyHTML and BodyText this has unnecessary string->stream-string
  // conversion that we live with for the sake of clarity of coding
  StringStream := TStringStream.Create('');
  try
    SaveToStream(StringStream, Style);
    Result := StringStream.DataString;
  finally
    StringStream.Free;
  end;
end;

function TWebBrowserWrapper.GetUrl: string;
begin
  Result := LocationURL;
end;

procedure TWebBrowserWrapper.SetUrl(URL: string);
begin
  Self.NavigateToURL(URL);
end;

constructor TWebBrowserWrapper.Create(Owner: TComponent);
begin
  inherited;

  Fwb := TWBContainer.Create(Self);
end;

function TWebBrowserWrapper.GetUseCustomCtxMenu:boolean;
begin
  CreateContainer;
  Result := Fwb.UseCustomCtxMenu;
end;
procedure TWebBrowserWrapper.SetUseCustomCtxMenu(b: boolean);
begin
  CreateContainer;
  Fwb.UseCustomCtxMenu := b;
end;
function TWebBrowserWrapper.GetShow3DBorder:boolean;
begin
  CreateContainer;
  Result := Fwb.Show3DBorder;
end;
procedure TWebBrowserWrapper.SetShow3DBorder(b: boolean);
begin
  CreateContainer;
  Fwb.Show3DBorder := b;
end;
function TWebBrowserWrapper.GetShowScrollBars:boolean;
begin
  CreateContainer;
  Result := Fwb.ShowScrollBars;
end;
procedure TWebBrowserWrapper.SetShowScrollBars(b: boolean);
begin
  CreateContainer;
  Fwb.ShowScrollBars := b;
end;
function TWebBrowserWrapper.GetAllowTextSelection:boolean;
begin
  CreateContainer;
  Result := Fwb.AllowTextSelection;
end;
procedure TWebBrowserWrapper.SetAllowTextSelection(b: boolean);
begin
  CreateContainer;
  Fwb.AllowTextSelection := b;
end;
procedure TWebBrowserWrapper.CreateContainer;
begin
  if Fwb = nil then
    Fwb := TWBContainer.Create(Self);
end;
end.
