object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FrmMain'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnInsert: TButton
    Left = 24
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Insert'
    TabOrder = 0
    OnClick = btnInsertClick
  end
  object btnPut: TButton
    Left = 24
    Top = 53
    Width = 75
    Height = 25
    Caption = 'Put'
    TabOrder = 1
    OnClick = btnPutClick
  end
  object mmDados: TMemo
    Left = 140
    Top = 8
    Width = 487
    Height = 257
    TabOrder = 2
  end
  object btnGetAll: TButton
    Left = 24
    Top = 115
    Width = 75
    Height = 25
    Caption = 'GetAll'
    TabOrder = 3
    OnClick = btnGetAllClick
  end
  object btnGet: TButton
    Left = 24
    Top = 84
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 4
    OnClick = btnGetClick
  end
  object btnDelete: TButton
    Left = 24
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 5
    OnClick = btnDeleteClick
  end
  object btnName: TButton
    Left = 24
    Top = 177
    Width = 75
    Height = 25
    Caption = 'Name'
    TabOrder = 6
    OnClick = btnNameClick
  end
end
