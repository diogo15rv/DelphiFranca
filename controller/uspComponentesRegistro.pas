unit uspComponentesRegistro;

interface

uses Classes, uspQuery;

procedure Register;

implementation

procedure Register;
begin
  Classes.RegisterComponents('spComponentes', [TspQuery]);
end;

end.
