unit Interfaces.SPQuery;

interface

uses Classes;

type
  TTipoLista = (tpColunas, tpCondicoes);


  iSPQuery = interface
    ['{F3289158-0A01-40FF-926E-25070E080B09}']
    function GetSpCondicoes: TStringList;
    procedure SetSPCondicoes(aValue: TStringList);

    function GetSpColunas: TStringList;
    procedure SetSPColunas(aValue: TStringList);

    function GetSpTabelas: TStringList;
    procedure SetSPTabelas(aValue: TStringList);

    property spCondicoes: TStringList read GetSpCondicoes write SetSpCondicoes;
    property spColunas: TStringList read GetSpColunas write SetSpColunas;
    property spTabelas: TStringList read GetSpTabelas write SetSpTabelas;

    ///  <summary>Gera o SQL de acordo com o que foi informado de colunas, condicoes e tabelas</summary>
    ///  <remarks>Se for informada uma quantidade diferente de 1 para tabelas, será emitida uma excecao</remarks>
    ///  <return>Será retornada a consulta</return>
    ///  <author>Diogo Cardoso</author>
    ///  <date>13/03/2021</date>
    function GeraSQL: String;
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

  end;

implementation

end.
