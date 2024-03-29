unit redefine_senha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls;

type
  TFrmRedefineSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Lbl8Caracteres: TLabel;
    LblMaiusculas: TLabel;
    LblMinusculas: TLabel;
    BtnSalvar: TButton;
    LblNumero: TLabel;
    LblEspecial: TLabel;
    EditSenha: TMaskEdit;
    EditConfirmaSenha: TMaskEdit;
    ImgSenha: TImage;
    ImgConfirmaSenha: TImage;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImgSenhaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgSenhaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgConfirmaSenhaMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImgConfirmaSenhaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidaSenha(Senha:String; Confirma:String): Boolean;
    function IsNumber(C : Char): Boolean;
    function IsCarEspecial(C : Char): Boolean;
    procedure Atualiza;
  end;

var
  FrmRedefineSenha: TFrmRedefineSenha;

implementation

uses Senha_Segura;

{$R *.dfm}

procedure TFrmRedefineSenha.Atualiza;
begin
  // atualiza form, limpa a tela
  EditSenha.Text := '';
  EditConfirmaSenha.Text := '';

  LblMaiusculas.Visible := True;
  LblMinusculas.Visible := True;
  LblNumero.Visible := True;
  LblEspecial.Visible := True;
  Lbl8Caracteres.Visible := True;

  Application.ProcessMessages;

end;

procedure TFrmRedefineSenha.BtnSalvarClick(Sender: TObject);
  var
  IsSenhaValida:Boolean;
  SenhaValida : String;
begin
  SenhaValida := EditConfirmaSenha.Text;
  IsSenhaValida := ValidaSenha(EditSenha.Text, SenhaValida);

  if IsSenhaValida = true then
  begin
    FrmPrincipal.Edit1.Text := SenhaValida;
    close;
  end;


end;

function TFrmRedefineSenha.ValidaSenha(Senha: String; Confirma:String): Boolean;
 var
  i: integer;
  Masterkey : string;
  QtdCar, Numero, Minuscula, Maiuscula, Especial, SenhasIguais : Boolean;
  C : char;

begin
  Numero := False;
  Minuscula := False;
  Maiuscula := False;
  Especial := False;
  QtdCar := False;
  SenhasIguais := False;

  Lbl8Caracteres.Visible := True;
  LblMaiusculas.Visible := True;
  LblMinusculas.Visible := True;
  LblNumero.Visible := True;
  LblEspecial.Visible := True;
  Lbl8Caracteres.Visible := True;
  Application.ProcessMessages;

  if (Length(Senha) < 8) then
  begin
    //ShowMessage('A Senha Precisa ter pelo menos 8 Caracteres.');
    QtdCar := False;
  end
  else
  begin
    QtdCar := True;
  end;

  if (Senha = Confirma) then
  begin
    SenhasIguais := True;
  end
  else
  begin
    ShowMessage('As senhas n�o conferem.');
    SenhasIguais := False;
  end;

  Masterkey := Senha;

  for I := 1 to  Length(MasterKey) do
  begin
    //Verifica se � Maiuscula
    if IsCharUpper(Masterkey[I]) then
    begin
      //ShowMessage('Letra Maiuscula: ' + Masterkey[I]);
      Maiuscula := True;
    end;

    //Verifica se � Minuscula
    if IsCharLower(Masterkey[I]) then
    begin
      //ShowMessage('Letra Minuscula: ' + Masterkey[I]);
      Minuscula := True;
    end;

    //Verifica se � n�mero
    if IsNumber(Masterkey[I]) then
    begin
      //ShowMessage('N�mero: ' + Masterkey[I]);
      Numero := True;
    end;

    //Verifica se � caracter Especial
    if IsCarEspecial(Masterkey[I]) then
    begin
      //ShowMessage('Especial: ' + Masterkey[I]);
      Especial := True;
    end;
  end; // fim for

  Application.ProcessMessages;

  if (Numero = True)  and (Minuscula = True) and (Maiuscula = True) and (Especial = True) and (SenhasIguais = True) and (QtdCar = True) then
  begin
    Result :=  True;
  end
  else
  begin
    LblMaiusculas.Visible :=   not Maiuscula;
    LblMinusculas.Visible :=  not Minuscula;
    LblNumero.Visible :=   not Numero;
    LblEspecial.Visible :=   not Especial;
    Lbl8Caracteres.Visible := not QtdCar;
    Application.ProcessMessages;

    Result :=  False;

  end;



end;

function TFrmRedefineSenha.IsNumber(C: Char): Boolean;
  const
  xCarNum: array[1..10] of char =  ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
  var
  I : Integer;
  Numero : Boolean;
begin
  Numero := False;
  for i := Low(xCarNum) to High(xCarNum) do
  begin
    if xCarNum[i] = C then
    begin
      Numero := True;
      Break;
    end;
  end;

  if Numero = True then
  begin
    Result := True; // � n�mero
  end
  else
  begin
    Result := False; // N�o � N�mero
  end;

end;

function TFrmRedefineSenha.IsCarEspecial(C: Char): Boolean;
  const
  xCarNum: array[1..52] of char =  ('<','>','!','@','#','$','%','�','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','�','`',
                                     '�','�','�','�','�','�','�','�','�','�',
                                     '�','�','�','�','�','�','�','�', ' ', '-', '\', '/'); // 52 simbulos
  var
  I : Integer;
  Especial : Boolean;
begin
  Especial := False;
  for i := Low(xCarNum) to High(xCarNum) do
  begin
    if xCarNum[i] = C then
    begin
      Especial := True;
      Break;
    end;
  end;

  if Especial = True then
  begin
    Result := True; // � Especial
  end
  else
  begin
    Result := False; // N�o � Espeial
  end;

end;


procedure TFrmRedefineSenha.FormShow(Sender: TObject);
begin
  Atualiza;
end;

procedure TFrmRedefineSenha.ImgSenhaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
  Esconde, Mostra: Char;
begin
  Esconde := '*';
  Mostra  := #0;

  if EditSenha.PasswordChar = Esconde  then
  begin
    EditSenha.PasswordChar := Mostra;
  end
  else
  begin
    EditSenha.PasswordChar := Esconde;
  end;

end;

procedure TFrmRedefineSenha.ImgSenhaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
  Esconde, Mostra: Char;
begin
  Esconde := '*';
  Mostra  := #0;

  if EditSenha.PasswordChar = Esconde  then
  begin
    EditSenha.PasswordChar := Mostra;
  end
  else
  begin
    EditSenha.PasswordChar := Esconde;
  end;

end;

procedure TFrmRedefineSenha.ImgConfirmaSenhaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
  Esconde, Mostra: Char;
begin
  Esconde := '*';
  Mostra  := #0;

  if EditConfirmaSenha.PasswordChar = Esconde  then
  begin
    EditConfirmaSenha.PasswordChar := Mostra;
  end
  else
  begin
    EditConfirmaSenha.PasswordChar := Esconde;
  end;

end;

procedure TFrmRedefineSenha.ImgConfirmaSenhaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   var
  Esconde, Mostra: Char;
begin
  Esconde := '*';
  Mostra  := #0;

  if EditConfirmaSenha.PasswordChar = Esconde  then
  begin
    EditConfirmaSenha.PasswordChar := Mostra;
  end
  else
  begin
    EditConfirmaSenha.PasswordChar := Esconde;
  end;

end;

end.
