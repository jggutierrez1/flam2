object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Machine Manager V.1.0 [Menu principal]'
  ClientHeight = 620
  ClientWidth = 812
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0788888800000000FF088880000000000F7777778000000FFFF0778000000000
    0F777777788880FFFFFF0780000000000F77777778880FFFFFFFF08000000000
    0F7777777880FFFFFFFFFF00000000000F777777880FFFFFFFFFFF8000000000
    0F77777780FFFFFFFFFFF080000000000F7777788FFFFFFFFFFF008000000000
    0FFFFFF7FFFFFFFFFFF88F700000000000000008888888888880000000000000
    078888880000000888888880000000000F777777800000877777778000000000
    0F7777777888887777777780000000000F777777777777777777778000000000
    0F7777777777777777777780000000000F777777777777770000008000000000
    0F777777777777770BBBB080000000000F777777777777770000008000000000
    0FFFFFFFFFFFFFFFFFFFFF700000000000000000000000000000000000000000
    078888880000000888888880000000000F777777800000877777778000000000
    0F7777777888887777777780000000000F777777777777777777778000000000
    0F7777777777777777777780000000000F777777777777770000008000000000
    0F777777777777770BBBB080000000000F777777777777770000008000000000
    0FFFFFFFFFFFFFFFFFFFFF70000000000000000000000000000000000000F000
    000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000
    000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000
    000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000
    000FF000000FF000000FF000000FF000000FF000000FF000000FF000000F}
  Menu = MainMenu2
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 601
    Width = 812
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 250
      end
      item
        Width = 150
      end>
  end
  object MainMenu2: TMainMenu
    Left = 320
    Top = 88
    object MenuItem1: TMenuItem
      Caption = 'Mantenimientos'
      Hint = 'Mantenimiento de sistema.'
      object MenuItem2: TMenuItem
        Caption = 'Empresas'
        OnClick = Empresas1Click
      end
      object MenuItem3: TMenuItem
        Caption = '-'
      end
      object Personal1: TMenuItem
        Caption = 'Personal'
        OnClick = Personal1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Proveedores1: TMenuItem
        Caption = 'Proveedores'
        OnClick = Proveedores1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MenuItem13: TMenuItem
        Caption = 'Usuarios'
        OnClick = Usuarios1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object ransferenciasBNP1: TMenuItem
        Caption = 'Transferencias BNP'
        OnClick = ransferenciasBNP1Click
      end
    end
    object MenuItem20: TMenuItem
      Caption = 'Reportes'
    end
    object MenuItem33: TMenuItem
      Caption = 'Ayuda.'
      object MenuItem34: TMenuItem
        Caption = 'Acerca de'
        OnClick = Acercade1Click
      end
    end
    object MenuItem35: TMenuItem
      Caption = 'Salir'
      OnClick = Salir1Click
    end
  end
end
