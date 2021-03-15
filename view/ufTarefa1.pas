unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery, Vcl.StdCtrls, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.TDataDef, FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.TData;

type
  TfTarefa1 = class(TForm)
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    lblSQLGerado: TLabel;
    mmoColunas: TMemo;
    mmoTabelas: TMemo;
    mmoCondicoes: TMemo;
    mmoSQLGerado: TMemo;
    btnGerarSQL: TButton;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysTDataDriverLink1: TFDPhysTDataDriverLink;
    procedure btnGerarSQLClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGerarSQLClick(Sender: TObject);
var
  spQuery: TspQuery;
begin
  spQuery := TspQuery.Create(nil);
  mmoSQLGerado.Lines.Clear;

  try
    spQuery.spCondicoes.Text := mmoCondicoes.Lines.Text;
    spQuery.spTabelas.Text   := mmoTabelas.Lines.Text;
    spQuery.spColunas.Text   := mmoColunas.Lines.Text;

    mmoSQLGerado.Lines.Add(spQuery.GeraSQL);
  finally
    spQuery.Free;
  end;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action   := TCloseAction.caFree;
  fTarefa1 := nil;
end;

procedure TfTarefa1.FormShow(Sender: TObject);
begin
  mmoColunas.SetFocus;
end;

end.
