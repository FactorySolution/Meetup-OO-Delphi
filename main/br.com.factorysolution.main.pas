unit br.com.factorysolution.main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,

  br.com.factorysolution.controller.pessoa.interfaces;

type
  TFrmMain = class(TForm)
    btnInsert: TButton;
    btnPut: TButton;
    mmDados: TMemo;
    btnGetAll: TButton;
    btnGet: TButton;
    btnDelete: TButton;
    btnName: TButton;
    procedure btnInsertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPutClick(Sender: TObject);
    procedure btnGetAllClick(Sender: TObject);
    procedure btnGetClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnNameClick(Sender: TObject);
  private
    { Private declarations }
    FController: IControllerPessoa;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  br.com.factorysolution.model.pessoa,
  System.Generics.Collections,
  br.com.factorysolution.controller.pessoa.impl,
  br.com.tecnospeed.service.pessoa.impl;

{$R *.dfm}

procedure TFrmMain.btnDeleteClick(Sender: TObject);
var
  LTempId: string;
  LID: Integer;
begin
  LTempId := InputBox('Deletar Pessoa', 'Informe o id que deseja deletar', '0');

  if TryStrToInt(LTempId, LID) then
    FController.Delete(LID)
  else
    raise Exception.Create('Informe um ID válido');
end;

procedure TFrmMain.btnGetClick(Sender: TObject);
var
  LPessoa: TPessoa;
begin
  LPessoa := FController.Get(1);
  mmDados.Lines.Add('------------ GET ---------------');
  mmDados.Lines.Add(LPessoa.ToString);
end;

procedure TFrmMain.btnInsertClick(Sender: TObject);
var
  LPessoa: TPessoa;
begin
  mmDados.Lines.Add('----------- INSERT --------------');
  LPessoa := TPessoa.Create;
  LPessoa.Nome := 'Andre';
  LPessoa := FController.Save(LPessoa);
  mmDados.Lines.Add(LPessoa.ToString);
end;

procedure TFrmMain.btnNameClick(Sender: TObject);
var
  LPessoa: TPessoa;
begin
  LPessoa := FController.GetByName('andre');

  if Assigned(LPessoa) then
  begin
    mmDados.Lines.Add('--------- GET BY NAME ------------');
    mmDados.Lines.Add(LPessoa.ToString);
  end;
end;

procedure TFrmMain.btnPutClick(Sender: TObject);
var
  LPessoa: TPessoa;
begin
  mmDados.Lines.Add('------------ UPDATE --------------');
  LPessoa := TPessoa.Create;
  LPessoa.Id := 1;
  LPessoa.Nome := 'Oliveira';
  LPessoa := FController.Update(LPessoa);
  mmDados.Lines.Add(LPessoa.ToString);
end;

procedure TFrmMain.btnGetAllClick(Sender: TObject);
var
  LPessoaList: TObjectList<TPessoa>;
  LPessoa: TPessoa;
begin
  LPessoaList := nil;
  try
    LPessoaList := FController.Get;

    for LPessoa in LPessoaList do
    begin
      mmDados.Lines.Add('------------ GET ALL ---------------');
      mmDados.Lines.Add(LPessoa.ToString);
    end;

  finally
    FreeAndNil(LPessoaList);
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FController := TControllerPessoa.New(TPessoaService.New);
end;

end.
