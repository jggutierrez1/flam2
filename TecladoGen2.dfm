object fTecladoGen2: TfTecladoGen2
  Left = 194
  Top = 493
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'TECLADO'
  ClientHeight = 415
  ClientWidth = 228
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -9
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btn9: TSpeedButton
    Left = 146
    Top = 51
    Width = 65
    Height = 65
    Caption = '9'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn9Click
  end
  object btn7: TSpeedButton
    Left = 16
    Top = 51
    Width = 65
    Height = 65
    Caption = '7'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn7Click
  end
  object btn8: TSpeedButton
    Left = 81
    Top = 51
    Width = 65
    Height = 65
    Caption = '8'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn8Click
  end
  object btn6: TSpeedButton
    Left = 146
    Top = 116
    Width = 65
    Height = 65
    Caption = '6'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn6Click
  end
  object btn5: TSpeedButton
    Left = 81
    Top = 116
    Width = 65
    Height = 65
    Caption = '5'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn5Click
  end
  object btn4: TSpeedButton
    Left = 16
    Top = 116
    Width = 65
    Height = 65
    Caption = '4'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn4Click
  end
  object btn1: TSpeedButton
    Left = 16
    Top = 181
    Width = 65
    Height = 65
    Caption = '1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn1Click
  end
  object btn2: TSpeedButton
    Left = 81
    Top = 181
    Width = 65
    Height = 65
    Caption = '2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn2Click
  end
  object btn3: TSpeedButton
    Left = 146
    Top = 181
    Width = 65
    Height = 65
    Caption = '3'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn3Click
  end
  object Btnmm: TSpeedButton
    Left = 146
    Top = 245
    Width = 65
    Height = 65
    Caption = 'C'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = BtnmmClick
  end
  object btnponto: TSpeedButton
    Left = 81
    Top = 245
    Width = 65
    Height = 65
    Caption = '.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnpontoClick
  end
  object btn0: TSpeedButton
    Left = 16
    Top = 245
    Width = 65
    Height = 65
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btn0Click
  end
  object DISPLAY: TEdit
    Left = 16
    Top = 8
    Width = 195
    Height = 35
    BiDiMode = bdLeftToRight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn45: TBitBtn
    Left = 16
    Top = 316
    Width = 195
    Height = 65
    Caption = 'CERRAR'
    TabOrder = 1
    OnClick = BitBtn45Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 396
    Width = 228
    Height = 19
    Panels = <>
  end
end