unit Controller.Threads;

interface

uses Classes, Vcl.ComCtrls;

type
  TThreadTarefa2 = class(TThread)
  private
    { private declarations }
    FProgressBar: TProgressBar;
    FMilisegundos: Integer;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(aProgressBar: TProgressBar; aMilisegundos: Integer);
    destructor Destroy; override;

    procedure Execute; override;
  end;

implementation

{ TThreadTarefa2 }

constructor TThreadTarefa2.Create(aProgressBar: TProgressBar; aMilisegundos: Integer);
begin
  inherited Create;

  FProgressBar    := aProgressBar;
  FMilisegundos   := aMilisegundos;
  FreeOnTerminate := True;
end;

destructor TThreadTarefa2.Destroy;
begin
  FProgressBar := nil;
  inherited Destroy;
end;

procedure TThreadTarefa2.Execute;
var
  I: Integer;
begin
  inherited;
  FProgressBar.Position := 0;

  for I := 0 to 100 do
  begin
    Sleep(FMilisegundos);
    FProgressBar.Position := FProgressBar.Position + 1;
  end;
end;


end.
