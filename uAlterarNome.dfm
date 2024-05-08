object FrmAlterarNome: TFrmAlterarNome
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Alterar Nome'
  ClientHeight = 261
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 261
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lblAlterarNome: TLabel
      Left = 0
      Top = 0
      Width = 384
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Alterar Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 110
    end
    object lblNomeAntigo: TLabel
      Left = 61
      Top = 40
      Width = 87
      Height = 16
      Caption = 'Nome Antigo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNomenovo: TLabel
      Left = 61
      Top = 107
      Width = 76
      Height = 16
      Caption = 'Novo Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNomeAntigo: TEdit
      Left = 61
      Top = 62
      Width = 280
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Digite seu nome antigo'
    end
    object edtNomeNovo: TEdit
      Left = 61
      Top = 129
      Width = 280
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TextHint = 'Digite seu novo nome'
    end
    object btnSalvar: TButton
      Left = 266
      Top = 176
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnSalvarClick
    end
  end
end
