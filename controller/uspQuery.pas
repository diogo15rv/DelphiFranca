unit uspQuery;

interface

uses Interfaces.SPQuery, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Classes, System.SysUtils, StrUtils, FireDAC.Phys;

type

  TspQuery = class(TFDQuery, iSPQuery)
  private
    { private declarations }
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;
  protected
    { protected declarations }
    {$REGION 'Metodos get_set'}
      function GetSpCondicoes: TStringList;
      procedure SetSPCondicoes(aValue: TStringList);

      function GetSpColunas: TStringList;
      procedure SetSPColunas(aValue: TStringList);

      function GetSpTabelas: TStringList;
      procedure SetSPTabelas(aValue: TStringList);
    {$ENDREGION}
  public
    { public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    ///  <summary>Valida se o valor das tabelas é diferente de 1</summary>
    ///  <author>Diogo Cardoso</author>
    ///  <date>13/03/2021</date>
    procedure ValidarTabelas;
    ///  <summary>Funcao que percorre as StringLists para retornar a string montada</summary>
    ///  <return>String montada do recurso</return>
    ///  <param name="aStringList">Lista para ser percorrida</param>
    ///  <param name="aTipoList">Tipo da lista, identificando o marcador que sera adicionado entre os itens</param>
    ///  <author>Diogo Cardoso</author>
    ///  <date>13/03/2021</date>
    function ListaParaString(aStringList: TStringList; aTipoLista: TTipoLista): String;
    ///  <summary>Gera o SQL de acordo com o que foi informado de colunas, condicoes e tabelas</summary>
    ///  <remarks>Se for informada uma quantidade diferente de 1 para tabelas, será emitida uma excecao</remarks>
    ///  <return>Será retornada a consulta</return>
    ///  <author>Diogo Cardoso</author>
    ///  <date>13/03/2021</date>
    function GeraSQL: String;
  published
    { published declarations }
    property spCondicoes: TStringList read GetSpCondicoes write SetSpCondicoes;
    property spColunas: TStringList read GetSpColunas write SetSpColunas;
    property spTabelas: TStringList read GetSpTabelas write SetSpTabelas;
  end;


implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FspCondicoes := TStringList.Create;
  FspColunas   := TStringList.Create;
  FspTabelas   := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  FspCondicoes.Free;
  FspColunas.Free;
  FspTabelas.Free;
  inherited Destroy;
end;

function TspQuery.GeraSQL: String;
begin
  SQL.Clear;
  ValidarTabelas;

  Result := '';
  Result := 'select ' + ListaParaString(FspColunas, TTipoLista.tpColunas);
  Result := Result + ' from ' + FspTabelas.Strings[0];
  Result := Result + ' ' + ListaParaString(FspCondicoes, TTipoLista.tpCondicoes);

  SQL.Add(Result);
end;

procedure TspQuery.ValidarTabelas;
begin
  if FspTabelas.Count = 0 then
    raise Exception.Create('Não foi informado nenhuma tabela!' + #13 + 'Verifique!')
  else if FspTabelas.Count > 1 then
    raise Exception.Create('Foram informadas mais de uma tabela!' + #13 +
                           'Só é possível adicionar apenas uma.' + #13 +
                           'Verifique!');
end;

function TspQuery.ListaParaString(aStringList: TStringList; aTipoLista: TTipoLista): String;
var
  I: Integer;
begin
  Result := '';

  for I := 0 to Pred(aStringList.Count) do
  begin
    case aTipoLista of
      tpColunas:
      begin
         if Result <> '' then
           Result := Result + ', ';
      end;

      tpCondicoes:
      begin
        if Result = '' then
        begin
          if Copy(Trim(aStringList.Strings[I]), 0, 3) = 'and' then
            Result := Copy(Trim(aStringList.Strings[I]), 4, Length(Trim(aStringList.Strings[I])))
          else if Copy(Trim(aStringList.Strings[I]), 0, 2) = 'or' then
            Result := Copy(Trim(aStringList.Strings[I]), 3, Length(Trim(aStringList.Strings[I])));

          Continue;
        end
        else if (Pos('AND ', Trim(UpperCase(Trim(aStringList.Strings[I])))) <= 0) and
                (Pos('OR ', Trim(UpperCase(Trim(aStringList.Strings[I])))) <= 0) then
          Result := Result + ' and '
        else
          Result := Result + ' ';
      end;
    end;

    Result := Result + Trim(aStringList.Strings[I]);
  end;

  if (Result = '') and (aTipoLista = TTipoLista.tpColunas) then
    Result := '* '
  else if (Result <> '') and (aTipoLista = TTipoLista.tpCondicoes) then
    Result := 'where' + Result;
end;

{$REGION 'Get_Sets'}
function TspQuery.GetSpColunas: TStringList;
begin
  Result := FspColunas;
end;

function TspQuery.GetSpCondicoes: TStringList;
begin
  Result := FspCondicoes;
end;

function TspQuery.GetSpTabelas: TStringList;
begin
  Result := FspTabelas;
end;

procedure TspQuery.SetSPColunas(aValue: TStringList);
begin
  FspColunas := aValue;
end;

procedure TspQuery.SetSPCondicoes(aValue: TStringList);
begin
  FspCondicoes := aValue;
end;

procedure TspQuery.SetSPTabelas(aValue: TStringList);
begin
  FspTabelas := aValue;
end;

{$ENDREGION}

end.
