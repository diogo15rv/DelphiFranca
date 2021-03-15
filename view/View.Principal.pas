unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ufTarefa1, ufTarefa2, ufTarefa3;

type
  TViewPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    T1: TMenuItem;
    menuTarefa1: TMenuItem;
    menuTarefa2: TMenuItem;
    menuTarefa3: TMenuItem;
    procedure menuTarefa1Click(Sender: TObject);
    procedure menuTarefa2Click(Sender: TObject);
    procedure menuTarefa3Click(Sender: TObject);
  private
    { Private declarations }
    procedure ChamarTela(Formulario: TFormClass; var Referencia);
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

{ TViewPrincipal }

procedure TViewPrincipal.ChamarTela(Formulario: TFormClass; var Referencia);
begin
  if Assigned(TForm(Referencia)) then
  begin
    with  TForm(Referencia) do
    begin
      Show;
      BringToFront;
    end;
  end
  else
  begin
    Application.CreateForm(Formulario, TForm(Referencia));
    with  TForm(Referencia) do
    begin
      Position := poMainFormCenter;
      Show;
    end;
  end;
end;

procedure TViewPrincipal.menuTarefa1Click(Sender: TObject);
begin
  ChamarTela(TfTarefa1, fTarefa1);
end;

procedure TViewPrincipal.menuTarefa2Click(Sender: TObject);
begin
  ChamarTela(TfTarefa2, fTarefa2);
end;

procedure TViewPrincipal.menuTarefa3Click(Sender: TObject);
begin
  ChamarTela(TfTarefa3, fTarefa3);
end;

end.
