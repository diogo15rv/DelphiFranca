unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Controller.Threads;

type
  TfTarefa2 = class(TForm)
    lblThread1: TLabel;
    edtThread1: TEdit;
    edtThread2: TEdit;
    lblThread2: TLabel;
    btnExecutar: TButton;
    pbThread1: TProgressBar;
    pbThread2: TProgressBar;
    procedure btnExecutarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Thread1, Thread2: TThreadTarefa2;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

procedure TfTarefa2.btnExecutarClick(Sender: TObject);
begin
  Thread1 := TThreadTarefa2.Create(pbThread1, StrToInt(edtThread1.Text));
  Thread2 := TThreadTarefa2.Create(pbThread2, StrToInt(edtThread2.Text));
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Thread1) then
  begin
    if not Thread1.Finished then
      TerminateThread(Thread1.Handle, 0);
    Thread1.Free;
  end;

  if Assigned(Thread2) then
  begin
    if not Thread2.Finished then
      TerminateThread(Thread2.Handle, 0);
    Thread2.Free;
  end;

  Action   := TCloseAction.caFree;
  fTarefa2 := nil;
end;

end.
