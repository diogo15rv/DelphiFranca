program ProvaDelphiApp;

uses
  Vcl.Forms,
  View.Principal in 'view\View.Principal.pas' {ViewPrincipal},
  ufTarefa1 in 'view\ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'view\ufTarefa2.pas' {fTarefa2},
  Controller.Threads in 'controller\Controller.Threads.pas',
  ufTarefa3 in 'view\ufTarefa3.pas' {fTarefa3},
  Interfaces.Tarefa3 in 'interfaces\Interfaces.Tarefa3.pas',
  Controller.Tarefa3 in 'controller\Controller.Tarefa3.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
