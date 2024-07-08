object Form1: TForm1
  Left = 535
  Top = 262
  Width = 450
  Height = 279
  Caption = 'SATUAN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 16
    Width = 40
    Height = 18
    Caption = 'NAMA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 16
    Top = 48
    Width = 72
    Height = 18
    Caption = 'DESKRIPSI'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 16
    Top = 208
    Width = 121
    Height = 18
    Caption = 'MASUKKAN NAMA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edt1: TEdit
    Left = 112
    Top = 16
    Width = 313
    Height = 21
    TabOrder = 0
    OnKeyPress = edt1KeyPress
  end
  object edt2: TEdit
    Left = 112
    Top = 48
    Width = 313
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 352
    Top = 80
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 2
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 352
    Top = 144
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 352
    Top = 176
    Width = 75
    Height = 25
    Caption = 'UBAH'
    TabOrder = 4
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 352
    Top = 208
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 5
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 352
    Top = 112
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 6
    OnClick = btn5Click
  end
  object dbgrd1: TDBGrid
    Left = 16
    Top = 80
    Width = 329
    Height = 120
    DataSource = DataModule2.tbl_satuan
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
  end
  object edt3: TEdit
    Left = 144
    Top = 208
    Width = 201
    Height = 21
    TabOrder = 8
    OnChange = edt3Change
  end
end
