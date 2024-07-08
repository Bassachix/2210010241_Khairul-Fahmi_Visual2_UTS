unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    dbgrd1: TDBGrid;
    lbl3: TLabel;
    edt3: TEdit;

    procedure posisiAwalSatuan;
    procedure bersihSatuan;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure edt3Change(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure dbgrd1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: string;

implementation

uses
  Unit2;

{$R *.dfm}

procedure TForm1.bersihSatuan;
begin
  edt1.Clear;
  edt2.Clear;
end;

procedure TForm1.posisiAwalSatuan;
begin
  bersihSatuan;
  edt1.Enabled := False;
  edt2.Enabled := False;

  btn1.Enabled := True;
  btn2.Enabled := False;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := False;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  edt1.Enabled := True;
  edt2.Enabled := True;

  btn1.Enabled := False;
  btn2.Enabled := True;
  btn3.Enabled := False;
  btn4.Enabled := False;
  btn5.Enabled := True;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  posisiAwalSatuan;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  posisiAwalSatuan;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  if edt1.Text = '' then // Validasi
    begin
      ShowMessage('Nama Satuan Tidak Boleh Kosong!');
    end
  else
    if DataModule2.qry_satuan.Locate('nama', edt1.Text,[])then
      begin
        ShowMessage('Nama Satuan '+edt1.Text+' Sudah Ada di Dalam Sistem');
      end
    else
      begin // Simpan
        with DataModule2.qry_satuan do
          begin
            SQL.Clear;
            SQL.Add('insert into satuan values(null, "'+edt1.Text+'", "'+edt2.Text+'")');
            ExecSQL;

            SQL.Clear;
            SQL.Add('select * from satuan');
            Open;
          end;
          ShowMessage('Data Berhasil Disimpan!');
      end;
  posisiAwalSatuan;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  if edt1.Text = '' then // Validasi
    begin
      ShowMessage('Nama Satuan Tidak Boleh Kosong!');
    end
  else
    if edt1.Text = DataModule2.qry_satuan.Fields[1].AsString then
      begin
        ShowMessage('Nama Satuan '+edt1.Text+' Tidak Ada Perubahan');
      end
    else
      begin // Ubah
        with DataModule2.qry_satuan do
          begin
            SQL.Clear;
            SQL.Add('update satuan set nama = "'+edt1.Text+'", deskripsi = "'+edt2.Text+'" where id = "'+a+'"');
            ExecSQL;

            SQL.Clear;
            SQL.Add('select * from satuan');
            Open;
          end;
          ShowMessage('Data Berhasil Diubah!');
      end;
  posisiAwalSatuan;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  if MessageDlg('Apakah Anda Yakin Ingin Menghapus Data Ini', mtWarning, [mbYes,mbNo], 0) = mrYes then
    begin  // Hapus
      with DataModule2.qry_satuan do
        begin
          SQL.Clear;
          SQL.Add('delete from satuan where id = "'+a+'"');
          ExecSQL;

          SQL.Clear;
          SQL.Add('select * from satuan');
          Open;
        end;
        ShowMessage('Data Berhasil Dihapus!');
    end
  else
    begin
      ShowMessage('Data Batal Dihapus');
    end;
  posisiAwalSatuan;
end;

procedure TForm1.edt3Change(Sender: TObject);
begin
  with DataModule2.qry_satuan do
    begin
      // Periksa apakah tabel kosong
      SQL.Clear;
      SQL.Add('select count(*) as jumlah from satuan');
      Open;
      if Fields[0].AsInteger = 0 then
        begin
          ShowMessage('Database kosong');
          Close;
          Exit;
        end;

      // Jika tabel tidak kosong, jalankan query seperti biasa
      SQL.Clear;
      SQL.Add('select * from satuan where nama like "%'+edt3.Text+'%"');
      Open;
    end;
end;

procedure TForm1.edt1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
  edt1.Text := DataModule2.qry_satuan.Fields[1].AsString;
  edt2.Text := DataModule2.qry_satuan.Fields[2].AsString;
  a := DataModule2.qry_satuan.Fields[0].AsString;

  edt1.Text := UpperCase(edt1.Text);

  edt1.Enabled := True;
  edt2.Enabled := True;

  btn1.Enabled := False;
  btn2.Enabled := False;
  btn3.Enabled := True;
  btn4.Enabled := True;
  btn5.Enabled := True;
end;

end.
