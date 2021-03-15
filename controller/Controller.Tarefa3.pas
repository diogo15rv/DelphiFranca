unit Controller.Tarefa3;

interface

uses
  Data.DB, Datasnap.DBClient, VCL.DBGrids, Interfaces.Tarefa3, SysUtils;

type
  TTarefa3 = class(TInterfacedObject, iTarefa3)
  private
    { private declarations }
    procedure CriarDataSet;
    procedure PreencherDataSet;
  protected
    { protected declarations }
    FDataSet: TClientDataSet;
    FDataSource: TDataSource;
    function GetDataSource: TDataSource;
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;

    function CalcularTotal: Double;
    function CalcularDivisao: Double;

    property DataSource: TDataSource read GetDataSource;
  end;

implementation

{ TTarefa3 }

function TTarefa3.CalcularDivisao: Double;
var
  ValorAnterior : Double;
begin
  Result        := 0;
  ValorAnterior := 0;

  FDataSet.DisableControls;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    if (FDataSet.FieldByName('Valor').AsFloat > 0) and (ValorAnterior > 0) then
      Result := Result + (FDataSet.FieldByName('Valor').AsFloat / ValorAnterior);

    ValorAnterior := FDataSet.FieldByName('Valor').AsFloat;

    FDataSet.Next;
  end;

  FDataSet.EnableControls;
end;

function TTarefa3.CalcularTotal: Double;
begin
  Result := 0;

  FDataSet.DisableControls;

  FDataSet.First;
  while not FDataSet.Eof do
  begin
    Result := Result + FDataSet.FieldByName('Valor').AsFloat;
    FDataSet.Next;
  end;

  FDataSet.EnableControls;
end;

constructor TTarefa3.Create;
begin
  FDataSet    := TClientDataSet.Create(nil);
  FDataSource := TDataSource.Create(nil);

  FDataSource.DataSet := FDataSet;

  CriarDataSet;
  PreencherDataSet;
end;

procedure TTarefa3.CriarDataSet;
begin
  FDataSet.FieldDefs.BeginUpdate;
  FDataSet.FieldDefs.Clear;

  FDataSet.FieldDefs.Add('IdProjeto', ftInteger);
  FDataSet.FieldDefs.Add('NomeProjeto', ftString, 20);
  FDataSet.FieldDefs.Add('Valor', ftFloat);

  FDataSet.FieldDefs.EndUpdate;
  FDataSet.CreateDataSet;

  TFloatField(FDataSet.FieldByName('Valor')).DisplayFormat := 'R$,0.00';

  FDataSet.Open;
end;

destructor TTarefa3.Destroy;
begin
  FDataSource.Free;
  FDataSet.Free;
  inherited;
end;

function TTarefa3.GetDataSource: TDataSource;
begin
  Result := FDataSource;
end;

procedure TTarefa3.PreencherDataSet;
begin
  while FDataSet.RecordCount < 10 do
  begin
    FDataSet.Append;
    FDataSet.FieldByName('IdProjeto').AsInteger  := FDataSet.RecordCount + 1;
    FDataSet.FieldByName('NomeProjeto').AsString := 'Projeto ' + IntToStr(FDataSet.RecordCount + 1);
    FDataSet.FieldByName('Valor').AsCurrency     := Random(100);

    FDataSet.Post;
  end;
end;

end.
