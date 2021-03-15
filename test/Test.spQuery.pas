unit Test.spQuery;

interface
uses
  DUnitX.TestFramework, uspQuery, Interfaces.spQuery, System.Classes,
  System.SysUtils;

type

  [TestFixture]
  TTestSPQuery = class(TObject)
  private
    SPQuery: TspQuery;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase('Condicoes_vazias', ',,1')]
    [TestCase('Condicoes', 'and campo1 = 1 ; and campo2 = 2,where campo1 = 1 and campo2 = 2,1')]
    [TestCase('Colunas', 'campo1;campo2|campo1, campo2|0', '|')]
    [TestCase('Colunas_vazias', ',*,0')]
    procedure TestListaParaString(const aValor: String; const aResult: String; const aTipo: Integer);
    [Test]
    [TestCase('Tabelas_vazias', '')]
    [TestCase('Tabelas_1tabela', 'tabela')]
    [TestCase('Tabelas_2tabela2', 'tabela;tabelas')]
    procedure TestValidarTabelas(const aTabela: String);
  end;

implementation

procedure TTestSPQuery.Setup;
begin
  SPQuery := TspQuery.Create(nil);
end;

procedure TTestSPQuery.TearDown;
begin
  if Assigned(SPQuery) then SPQuery.Free;
end;

procedure TTestSPQuery.TestListaParaString(const aValor, aResult: String; const aTipo: Integer);
var
  StrList: TStringList;
  Resultado, Valor: String;
  I: Integer;
begin
  try
    StrList := TStringList.Create;

    if aValor <> '' then
    begin
      Valor := StringReplace(aValor, ' ', '%20', [rfReplaceAll, rfIgnoreCase]);

      StrList.StrictDelimiter := False;
      StrList.Delimiter       := ';';
      StrList.DelimitedText   := Valor;
      StrList.StrictDelimiter := True;

      for I := 0 to Pred(StrList.Count) do
        StrList.Strings[I] := StringReplace(StrList.Strings[I], '%20', ' ', [rfReplaceAll, rfIgnoreCase]);
    end;

    Resultado := SPQuery.ListaParaString(StrList, TTipoLista(aTipo));
    Assert.IsTrue(Trim(aResult) = Trim(Resultado), 'TestListaParaString = ' + aResult + ' esperado, retornou ' + Resultado);

  finally
    StrList.Free;
  end;
end;

procedure TTestSPQuery.TestValidarTabelas(const aTabela: String);
var
  StrList: TStringList;
  i: Integer;
begin
  try
    SPQuery.spTabelas.Clear;
    StrList := TStringList.Create;

    if aTabela <> '' then
    begin
      StrList.StrictDelimiter := False;
      StrList.Delimiter       := ';';
      StrList.DelimitedText   := aTabela;
      StrList.StrictDelimiter := True;
    end;

    for i := 0 to Pred(StrList.Count) do
      SPQuery.spTabelas.Add(StrList.Strings[I]);

    Assert.WillRaise(SPQuery.ValidarTabelas, nil, 'Não gerou exception');
  finally
    StrList.Free;
  end;

end;

initialization
  TDUnitX.RegisterTestFixture(TTestSPQuery);
end.
