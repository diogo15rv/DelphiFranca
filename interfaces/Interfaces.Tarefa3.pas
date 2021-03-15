unit Interfaces.Tarefa3;

interface

uses Data.DB;

type
  iTarefa3 = interface
    ['{5BDA0DC3-FD26-4873-8034-E19A29D32429}']
    function GetDataSource: TDataSource;

    function CalcularTotal: Double;
    function CalcularDivisao: Double;

    property DataSource: TDataSource read GetDataSource;
  end;

implementation

end.
