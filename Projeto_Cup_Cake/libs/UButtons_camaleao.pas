unit UButtons_camaleao;

interface

uses
  Classes, Controls, StdCtrls, Graphics, Messages, JvButtons, JvSpeedButton, Types;

const
 ///  consts para botões

  PRIMARY   = $00FF8000;
  SECUNDARY = $007E7E7E;
  SUCCESS   = $0017AA3D;
  DANGER    = $004E31EE;
  WARNING   = $000DBEF2;
  INFO      = $00D0C52F;
  LIGHT     = $00F3F3F3;
  DARK      = $00252525;
  FONT_STYLE = 'MS Reference Sans Serif';  //- 10 - Regular
  FONT_SIZE =  10;


// Classe botão Pimary
type
  TBtnPimary = class(TJvSpeedButton)
  private
    FCorHover: TColor;
    FCorPadrao: TColor;
    FFontePadrao: TFontName;
    procedure SetCorHover(Value: TColor);
    procedure SetCorPadrao(Value: TColor);
    procedure SetFontePadrao(const Value: TFontName);

  protected
     procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
     procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
    property FontePadrao: TFontName read FFontePadrao write SetFontePadrao;
  end;

// Classe botão Secundary
type
  TBtnSecundary = class(TJvSpeedButton)
  private
    FCorHover: TColor;
    FCorPadrao: TColor;
    FFontePadrao: TFontName;
    procedure SetCorHover(Value: TColor);
    procedure SetCorPadrao(Value: TColor);
  protected
     procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
     procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
     procedure SetFontePadrao(const Value: TFontName);
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
    property FontePadrao: TFontName read FFontePadrao write SetFontePadrao;

  end;

// Classe botão - Success
type
  TBtnSuccess = class(TJvSpeedButton)
  private
    FCorHover: TColor;
    FCorPadrao: TColor;
    FFontePadrao: TFontName;
    procedure SetCorHover(Value: TColor);
    procedure SetCorPadrao(Value: TColor);
    procedure SetFontePadrao(const Value: TFontName);
  protected
     procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
     procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;

// Classe botão Danger
type
  TBtnDanger = class(TJvSpeedButton)
  private
    FCorHover: TColor;
    FCorPadrao: TColor;
    FFontePadrao: TFontName;
    procedure SetCorHover(Value: TColor);
    procedure SetCorPadrao(Value: TColor);
    procedure SetFontePadrao(const Value: TFontName);
  protected
     procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
     procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;

// Classe botão Warning
type
  TBtnWarning = class(TJvSpeedButton)
  private
    FCorHover: TColor;
    FCorPadrao: TColor;
    FFontePadrao: TFontName;
    procedure SetCorHover(Value: TColor);
    procedure SetCorPadrao(Value: TColor);
    procedure SetFontePadrao(const Value: TFontName);
  protected
     procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
     procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;

// Classe botão Info
type
  TBtnInfo = class(TJvSpeedButton)
  private
    FCorHover: TColor;
    FCorPadrao: TColor;
    FFontePadrao: TFontName;
    procedure SetCorHover(Value: TColor);
    procedure SetCorPadrao(Value: TColor);
    procedure SetFontePadrao(const Value: TFontName);
  protected
     procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
     procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;

//classe botão Light
type
  TBtnLight = class(TJvSpeedButton)
  private
    FCorHover: TColor;
    FCorPadrao: TColor;
    FFontePadrao: TFontName;
    procedure SetCorHover(Value: TColor);
    procedure SetCorPadrao(Value: TColor);
    procedure SetFontePadrao(const Value: TFontName);
  protected
     procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
     procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;

//classe botão Dark
type
  TBtnDark = class(TJvSpeedButton)
  private
    FCorHover: TColor;
    FCorPadrao: TColor;
    FFontePadrao: TFontName;
    procedure SetCorHover(Value: TColor);
    procedure SetCorPadrao(Value: TColor);
    procedure SetFontePadrao(const Value: TFontName);
  protected
     procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
     procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;


//////////////////////////////////////////////////////////
procedure Register;

implementation

//metodos das classes de botões
//*************** primary events ************************
constructor TBtnPimary.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := PRIMARY;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Primary';
  Color := PRIMARY;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;
end;

procedure TBtnPimary.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnPimary.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnPimary.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnPimary.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnPimary.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;


//*************** primary events ************************

//*************** Secundary events ************************
constructor TBtnSecundary.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := SECUNDARY;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Secundary';
  Color := SECUNDARY;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;

end;

procedure TBtnSecundary.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnSecundary.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnSecundary.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnSecundary.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnSecundary.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

//*************** Secundary events ************************


//*************** Success events ************************
constructor TBtnSuccess.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := SUCCESS;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Success';
  Color := SUCCESS;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;

end;

procedure TBtnSuccess.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnSuccess.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnSuccess.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnSuccess.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnSuccess.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

//*************** Success events ************************

//*************** Danger events ************************
constructor TBtnDanger.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clred;  // Cor quando o mouse está sobre o botão
  FCorPadrao := DANGER;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Danger';
  Color := DANGER;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;
end;

procedure TBtnDanger.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnDanger.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnDanger.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnDanger.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnDanger.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

//*************** Danger events ************************

//*************** Warning events ************************
constructor TBtnWarning.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := WARNING;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Warning';
  Color := WARNING;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;

  // Força o botão a ignorar os estilos do Windows
  ControlStyle := ControlStyle - [csParentBackground];

end;

procedure TBtnWarning.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnWarning.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnWarning.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnWarning.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnWarning.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

//*************** Warning events ************************


//*************** Info events ************************
constructor TBtnInfo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := INFO;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Info';
  Color :=  INFO;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;
end;

procedure TBtnInfo.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnInfo.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnInfo.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnInfo.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnInfo.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;


//*************** Info events ************************

//*************** Light events ************************
constructor TBtnLight.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := LIGHT;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Light';
  Color := LIGHT;
  Font.Size := FONT_SIZE;
  Font.Color := clBlack;
end;

procedure TBtnLight.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnLight.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnLight.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnLight.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnLight.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

//*************** Light events ************************

//*************** Dark events ************************
constructor TBtnDark.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := DARK;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Dark';
  Color := DARK;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;
end;

procedure TBtnDark.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnDark.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnDark.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnDark.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnDark.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

//*************** Dark events ************************

procedure Register;
begin
  RegisterComponents('ButtonsCamaleao', [TBtnPimary, TBtnSecundary, TBtnSuccess, TBtnDanger, TBtnWarning, TBtnInfo, TBtnLight, TBtnDark]);
end;


end.

