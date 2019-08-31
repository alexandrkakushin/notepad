object fmMain: TfmMain
  Left = 429
  Top = 189
  Width = 594
  Height = 496
  Caption = #1041#1077#1079#1099#1084#1103#1085#1085#1099#1081' - '#1041#1083#1086#1082#1085#1086#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object sbPosition: TStatusBar
    Left = 0
    Top = 426
    Width = 586
    Height = 19
    Panels = <
      item
        Width = 550
      end
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object MContainer: TMemo
    Left = 0
    Top = 0
    Width = 586
    Height = 426
    Align = alClient
    TabOrder = 1
    OnClick = MContainerClick
    OnKeyUp = MContainerKeyUp
  end
  object XPMan: TXPManifest
    Left = 8
    Top = 536
  end
  object MainMenu: TMainMenu
    Left = 40
    Top = 536
    object mnFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object mnNew: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        ShortCut = 16462
        OnClick = mnNewClick
      end
      object mnOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
        ShortCut = 16463
        OnClick = mnOpenClick
      end
      object mnSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ShortCut = 16467
        OnClick = mnSaveClick
      end
      object mnSaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        OnClick = mnSaveAsClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object PageSetup: TMenuItem
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1090#1088#1072#1085#1080#1094#1099'...'
        OnClick = PageSetupClick
      end
      object mnPrint: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100'...'
        ShortCut = 16464
        OnClick = mnPrintClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mnExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = mnNewClick
      end
    end
    object mnEdit: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
      object mnUndo: TMenuItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100
        ShortCut = 16474
        OnClick = mnUndoClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnCut: TMenuItem
        Caption = #1042#1099#1088#1077#1079#1072#1090#1100
        ShortCut = 16472
        OnClick = mnCutClick
      end
      object mnCopy: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
        ShortCut = 16451
        OnClick = mnCopyClick
      end
      object mnPaste: TMenuItem
        Caption = #1042#1089#1090#1072#1074#1080#1090#1100
        ShortCut = 16470
        OnClick = mnPasteClick
      end
      object N16: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        ShortCut = 46
        OnClick = N16Click
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object N18: TMenuItem
        Caption = #1053#1072#1081#1090#1080'...'
        ShortCut = 16454
        OnClick = N18Click
      end
      object N19: TMenuItem
        Caption = #1053#1072#1081#1090#1080' '#1076#1072#1083#1077#1077'...'
        ShortCut = 114
        OnClick = N19Click
      end
      object N20: TMenuItem
        Caption = #1047#1072#1084#1077#1085#1080#1090#1100'...'
        ShortCut = 16456
        OnClick = N20Click
      end
      object mnGo: TMenuItem
        Caption = #1055#1077#1088#1077#1081#1090#1080'...'
        ShortCut = 16455
        OnClick = mnGoClick
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object N23: TMenuItem
        Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
        ShortCut = 16449
        OnClick = N23Click
      end
      object N24: TMenuItem
        Caption = #1042#1088#1077#1084#1103' '#1080' '#1076#1072#1090#1072
        ShortCut = 116
        OnClick = N24Click
      end
    end
    object mnFormat: TMenuItem
      Caption = #1060#1086#1088#1084#1072#1090
      object mnWantReturn: TMenuItem
        AutoCheck = True
        Caption = #1055#1077#1088#1077#1085#1086#1089' '#1087#1086' '#1089#1083#1086#1074#1072#1084
        Checked = True
        OnClick = mnWantReturnClick
      end
      object mnFont: TMenuItem
        Caption = #1064#1088#1080#1092#1090
        OnClick = mnFontClick
      end
    end
    object mnView: TMenuItem
      Caption = #1042#1080#1076
      object mnStBar: TMenuItem
        AutoCheck = True
        Caption = #1057#1090#1088#1086#1082#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
        Checked = True
        OnClick = mnStBarClick
      end
    end
    object N30: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N31: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N31Click
      end
    end
  end
  object OpenDlg: TOpenDialog
    DefaultExt = 'TXT'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' (*.txt)|*.txt;|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*;'
    Left = 72
    Top = 536
  end
  object SaveDlg: TSaveDialog
    DefaultExt = 'TXT'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' (*.txt)|*.txt;|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*;'
    Left = 104
    Top = 536
  end
  object FontDlg: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 136
    Top = 536
  end
  object PrintDlg: TPrintDialog
    Left = 168
    Top = 536
  end
  object PrinterSetupDlg: TPrinterSetupDialog
    Left = 200
    Top = 536
  end
  object FindDlg: TFindDialog
    Options = [frDown, frHideMatchCase, frHideWholeWord, frHideUpDown]
    OnFind = FindDlgFind
    Left = 232
    Top = 536
  end
  object ReplaceDlg: TReplaceDialog
    Options = [frHideMatchCase, frHideWholeWord]
    OnFind = FindDlgFind
    OnReplace = ReplaceDlgReplace
    Left = 264
    Top = 536
  end
  object PageSetupDlg: TPageSetupDialog
    MinMarginLeft = 0
    MinMarginTop = 0
    MinMarginRight = 0
    MinMarginBottom = 0
    MarginLeft = 2500
    MarginTop = 2500
    MarginRight = 2500
    MarginBottom = 2500
    PageWidth = 21000
    PageHeight = 29700
    Left = 296
    Top = 536
  end
end
