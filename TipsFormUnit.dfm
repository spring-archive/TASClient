object TipsForm: TTipsForm
  Left = 512
  Top = 149
  Width = 377
  Height = 344
  Caption = 'Tips'
  Color = clBtnFace
  Constraints.MaxHeight = 1000
  Constraints.MaxWidth = 1680
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpTBXTitleBar1: TSpTBXTitleBar
    Left = 0
    Top = 0
    Width = 369
    Height = 317
    Caption = 'Tips'
    Active = False
    FixedSize = True
    Options.Maximize = False
    object btNextTip: TSpTBXButton
      Left = 240
      Top = 279
      Width = 113
      Height = 25
      Caption = 'Next tip'
      TabOrder = 1
      OnClick = btNextTipClick
    end
    object chkShowTips: TSpTBXCheckBox
      Left = 16
      Top = 279
      Width = 64
      Height = 15
      Caption = 'Show tips'
      TabOrder = 2
      Checked = True
      State = cbChecked
    end
    object SpTBXPanel1: TSpTBXPanel
      Left = 16
      Top = 32
      Width = 337
      Height = 241
      Caption = 'SpTBXPanel1'
      TabOrder = 3
      TBXStyleBackground = True
      DesignSize = (
        337
        241)
      object Panel1: TPanel
        Left = 8
        Top = 8
        Width = 321
        Height = 225
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        Color = clInfoBk
        TabOrder = 0
        DesignSize = (
          321
          225)
        object Label1: TLabel
          Left = 72
          Top = 24
          Width = 170
          Height = 28
          Caption = 'Did you know ...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Image1: TImage
          Left = 16
          Top = 8
          Width = 49
          Height = 49
          Picture.Data = {
            07544269746D6170A60C0000424DA60C00000000000036040000280000002D00
            00002D000000010008000000000070080000130B0000130B0000000100000001
            000056897900FFFFFF00A3D5CB0076958C009BCAC100CCDCD90094C8BD00F1F0
            F00084C2B500C2D5D1004177660092C3B900FAFCFC005DB1A00060B6A500CCD9
            D600D7D7D70072A49A005AAA9A00EAEAEA009FD3C900C6CACA00DEDFDF006FAD
            A1009DADAA00B3DCD400ABCCC500FAFAFA0064A69800C5E2DC008AA49F00E0E0
            E000BBCAC700F4F4F40062A19400DADADA00A6B6B200D5D4D40069BBAA00FCFC
            FC006CB6A80092CDC200BED4D000F8F8F800B4D1CB00668B7600D3EBE600BAD2
            CD00DAEEEA00D8D8D8006C9B910074ABA00064BAA900BEC6C50065B8A7006DBC
            AD00DBE2DE00ADD9D1006AAEA00089A9A3008BC5BA0071BDAE0089C9BC00EAEE
            ED00B8DDD600F5FAF90079C1B300ABD2CA00EDF6F400E1F1ED0065A99B008CC1
            B70082BCB000E8E6E600152F230065B8A800BCD1CC00D8DADA006EA59A00C9CE
            CD005AA69700DCDEDD007B9C9500B0BAB800D1DAD800E5F3F0006FA89D00DCDC
            DC00E7E5E50079BAAD00EDEEEE007EBEB100BCBBBB006DB0A2005FA5970086A8
            A100E5EBEA00D7EDE800659D910079A9A000DADEDD00D9DCDB0066B6A70094CE
            C30089B1A900ADB9B60066B9A8006CB5A60081A9A1007DBBAF0070B8A9007BA2
            9A00F2F1F10067B5A500E5E3E300DCE1E000D5DBDA00D4D7D60098CFC400A6BD
            B80098B7B00076B8AB0092ADA700E2E9E7006BA99D005BAD9D00BEC4C3009CB0
            AD0064B6A6006AB0A20063B8A70062B7A60061B7A60062B8A70063B7A60063B9
            A800E9E9E900EDEDED00ECECEC00EFEFEF00E7E7E700E2E2E200D0D0D000B3C2
            BF00EEEEEE00E3E3E30062B8A600E8E8E800E4E4E400E4E5E500E6E6E60062B6
            A500D6D5D50063B7A700F0EFEF0061B5A400CCCECE00E5E5E500D4D3D3007BAC
            A200D3D2D200D5D8D700E6E7E700E1E2E20076C0B100B2BDBB0069B2A400F3F3
            F30065B5A5007BC3B400F9FCFB0057A39300CFD0D00071B2A600C0DBD500A3C8
            C100A2CCC300EEEFEF00E3E2E300E2E4E300ADCFC800B5D7D0006DB3A4009BAB
            A800AAB5B30094ACA8008FA5A100D0E9E400C8E5DF0071AD8B00B9C0BE006EAC
            9F00E8EAEA00A8CEC600D1D4D30070AB9F00E1E1E100C3C4C40092A6A200F8FB
            FB006CA9920064B9A700F1F1F10074BBAD0098C6BD004F8F8200B5BDBB00B5BF
            BD008EAAA5006A9D8000BBE0D800DBE1E000DAE7E400DBE6E300DDE5E000BAC2
            C00020403300BCC2C100305B4600A9D8CE005CAE9E008CBFB50069AD9F007EAF
            A500828D8700819E9800F7F7F700D4DFDD005FB3A200D4E2DF0078BCAF0063B8
            A6007DA79F00C3C8C700A7CAC300A3CCC40082A19B0064B5A600CBCBCB00BAD6
            D0007CC3B50070857A0083C6B900729B9300E8E9E900E5E4E400D1E4E00072B7
            A900EFEEEE007CA89F00C8D7D400C7CCCB00D5ECE7005FB6A400E9F5F200FFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B15526275FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF217E5222593D1E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A69F31C0840602C3A15
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFA31832DE061D3F700764086F21FFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF27A1C662B676F6B1708B9089B24C6B
            53FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF2B
            FBEC227943D407078B898A88968D510611F4FFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFCABE525E5BB57B0707908913939D8D1657910F
            CB18FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF88B8324647
            AE60079A908A138C94C4162310108C8DC17C4DFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFF16B7323A06053F078B898A8896911F572398258E35FA8C
            74081E0CFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFF27C21E62ADB0E55A07F8
            8913939D8D162331989E9C8F681CDE0F582C3A15FFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFE2E9E1225943D58B07908A138C94C416231098A015779F5E12E40EDD
            95513C6F21FFFFFFFFFFFFFFFFFFFF000000FF1BBA1C48EF7B079A898A889691
            1F572398258E357856507D9B828285A82F49092853FFFFFFFFFFFFFFFFFFFF00
            0000FFD9C8EFC0078B8913939D8D162331989E9C8F681C500D83828282828684
            59D3C4041188FFFFFFFFFFFFFFFFFF000000CA03BDD69A8A138C94C416231098
            A015779F5E12E48382828682828282820EAF8C54E618FFFFFFFFFFFFFFFFFF00
            0000CE00D1381396911F572398258E357856507D9B8282828282828282828283
            92280FF5B47C23FFFFFFFFFFFFFFFF000000030A2D648D162331989E9C8F681C
            500D8382828282828282828282828282820E479D65081E0CFFFFFFFFFFFFFF00
            000000DA2D23231098A015779F5E12E483828286828282828282828282828282
            8385A82F582F5D15FFFFFFFFFFFFFF0000000AD8F110258E35785650DC9B8282
            828282828282828282828282828282828286846D731F066F21FFFFFFFFFFFF00
            00000A4AE0AC8F681C500D838282828282828282838484838282828282828282
            82828597EA49FAF753FFFFFFFFFFFF00000000D803DF5E12E485828299828282
            828282848342F2828382828282828282828286926E0572EB1188FFFFFFFFFF00
            0000B7CDABDC0E828282828282828282828383A919FE55428482828282828282
            828282820E0B95545B18FFFFFFFFFF000000CA3BC98282828282828282828282
            828384390101014082838282828282828282828385662AF52C7C4DFFFFFFFF00
            0000FFA2633483828282828282828282828284A4550C61763683828282828282
            8282828299846D73643C1E0CFFFFFF000000FFFF751734838282828282828282
            82828583296726FD266A83828282828282828282998597EA58095D15FFFFFF00
            0000FFFFFF35A68783828282828282828282828384843776BB760E8282828282
            828282828286926E54C4046F21FFFF000000FFFFFFFF24668283828282828282
            82828282833D2E0C0145420E83838282828282828282820E0B940F7953FFFF00
            0000FFFFFFFF2B7A6A8286828282828282828282836A190C0101306737830E83
            8382828282828385662A72C111B1FF000000FFFFFFFFFF5A6C34828282828282
            8282828282836A025501010C45D2293D8483828282828282844873741821FF00
            0000FFFFFFFFFFFF16333483828282828282828282828384A4022E4101010C45
            146A83828282828285971A585CFFFF000000FFFFFFFFFFFFFF4F5D8783828282
            8282828282828283840E263EBC0C01010CDB3683828282828684F7E35C1BFF00
            0000FFFFFFFFFFFFFFFFA5718283828282828282828282828282830E6A390C01
            014442848282828282820ECCEE93FF000000FFFFFFFFFFFFFFFF0C7F36828382
            8282828282828282828282828326610101AA3E0E82828282828685282025FF00
            0000FFFFFFFFFFFFFFFFFFA73B878282828282828282828282828282834BBB01
            01444284828282828282828448C5FF000000FFFFFFFFFFFFFFFFFFFFA2633483
            828282828282828283840E0E260241012739368382828282828282853618FF00
            0000FFFFFFFFFFFFFFFFFFFFFF75173483828282828285843DF03EDBFC0C0141
            402683828282828282828286874E4D000000FFFFFFFFFFFFFFFFFFFFFFFF7EA6
            87838282828292847644AA01010C61676A838282828282828282828282E7EC00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFF24668283828282828337FCC7551D293784
            838282828282828282838287347156000000FFFFFFFFFFFFFFFFFFFFFFFFFF2B
            7A6A82868282828283A93E3D820E838282828282828283828734EDC3D0351300
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF5A6C3482828282828284848383828282
            8282828382873480BF3BD7F4FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF1633348382828282828282828282828382873486175FCF95FFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F5D878382828282828282838287
            34823A5F53A327FFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFA57182838282828382C934363A6C691627FFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF277F3682838282348281E82465
            1BFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFA73B87878681F924752BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB36317B99C21FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
          Transparent = True
        end
        object mmTip: TTntMemo
          Left = 16
          Top = 64
          Width = 289
          Height = 145
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
end
