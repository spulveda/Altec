object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 467
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 46
    Top = 28
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 20
    Top = 55
    Width = 56
    Height = 13
    Caption = 'Identidade:'
  end
  object Label4: TLabel
    Left = 54
    Top = 82
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'CPF:'
  end
  object Label5: TLabel
    Left = 31
    Top = 109
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Telefone:'
  end
  object Label6: TLabel
    Left = 45
    Top = 136
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'E-mail:'
  end
  object Label7: TLabel
    Left = 54
    Top = 167
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'CEP:'
  end
  object Label9: TLabel
    Left = 18
    Top = 195
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'Logradouro:'
  end
  object Label10: TLabel
    Left = 36
    Top = 225
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#250'mero:'
  end
  object Label12: TLabel
    Left = 8
    Top = 252
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Caption = 'Complemento:'
  end
  object Label13: TLabel
    Left = 45
    Top = 280
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Bairro:'
  end
  object Label14: TLabel
    Left = 40
    Top = 307
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cidade:'
  end
  object Label15: TLabel
    Left = 44
    Top = 334
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Estado'
  end
  object Label16: TLabel
    Left = 54
    Top = 361
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pais:'
  end
  object edtNome: TEdit
    Left = 82
    Top = 25
    Width = 167
    Height = 21
    TabOrder = 0
  end
  object edtIdentidade: TEdit
    Left = 82
    Top = 52
    Width = 167
    Height = 21
    TabOrder = 1
  end
  object edtCPF: TEdit
    Left = 82
    Top = 79
    Width = 167
    Height = 21
    TabOrder = 2
  end
  object edtTelefone: TEdit
    Left = 82
    Top = 106
    Width = 167
    Height = 21
    TabOrder = 3
  end
  object edtEmail: TEdit
    Left = 82
    Top = 133
    Width = 167
    Height = 21
    TabOrder = 4
  end
  object edtCep: TEdit
    Left = 82
    Top = 164
    Width = 167
    Height = 21
    TabOrder = 5
    OnExit = edtCepExit
  end
  object edtLogradouro: TEdit
    Left = 82
    Top = 192
    Width = 167
    Height = 21
    TabOrder = 6
  end
  object edtNumero: TEdit
    Left = 82
    Top = 222
    Width = 167
    Height = 21
    TabOrder = 7
  end
  object edtComplemento: TEdit
    Left = 82
    Top = 249
    Width = 167
    Height = 21
    TabOrder = 8
  end
  object edtBairro: TEdit
    Left = 82
    Top = 277
    Width = 167
    Height = 21
    TabOrder = 9
  end
  object edtCidade: TEdit
    Left = 82
    Top = 304
    Width = 167
    Height = 21
    TabOrder = 10
  end
  object edtEstado: TEdit
    Left = 82
    Top = 331
    Width = 167
    Height = 21
    TabOrder = 11
  end
  object edtPais: TEdit
    Left = 82
    Top = 358
    Width = 167
    Height = 21
    TabOrder = 12
  end
  object btnCadastrar: TButton
    Left = 82
    Top = 396
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 13
    OnClick = btnCadastrarClick
  end
end
