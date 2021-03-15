unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Datasnap.DBClient,
  Controller.Tarefa3, Interfaces.Tarefa3;

type
  TfTarefa3 = class(TForm)
    lblValoresProjeto: TLabel;
    grdProjeto: TDBGrid;
    lblTotal: TLabel;
    edtTotal: TMaskEdit;
    Label1: TLabel;
    edtDivisoes: TMaskEdit;
    btnTotal: TButton;
    btnDivisoes: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnDivisoesClick(Sender: TObject);
  private
    { Private declarations }
    Tarefa3: iTarefa3;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnTotalClick(Sender: TObject);
begin
  edtTotal.Text := FormatFloat(',0.00', Tarefa3.CalcularTotal);
end;

procedure TfTarefa3.btnDivisoesClick(Sender: TObject);
begin
  edtDivisoes.Text := FormatFloat(',0.00', Tarefa3.CalcularDivisao);
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Tarefa3  := nil;
  Action   := TCloseAction.caFree;
  fTarefa3 := nil;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  Tarefa3 := TTarefa3.Create;
  grdProjeto.DataSource := Tarefa3.DataSource;

  for I := 0 to Pred(grdProjeto.Columns.Count) do
    grdProjeto.Columns[I].Field := Tarefa3.DataSource.DataSet.Fields[I];
end;

end.
