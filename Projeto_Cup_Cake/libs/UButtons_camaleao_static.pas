unit UButtons_camaleao_static;

// Botões que sofrem impacto de componentes externos do windows
// e perdem a cor setada

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
  TBtnPimaryST = class(TJvSpeedButton)
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
     procedure Paint; override;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
    property FontePadrao: TFontName read FFontePadrao write SetFontePadrao;
  end;

// Classe botão Secundary
type
  TBtnSecundaryST = class(TJvSpeedButton)
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
     procedure Paint; override;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
    property FontePadrao: TFontName read FFontePadrao write SetFontePadrao;

  end;

// Classe botão - Success
type
  TBtnSuccessST = class(TJvSpeedButton)
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
     procedure Paint; override;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;

// Classe botão Danger
type
  TBtnDangerST = class(TJvSpeedButton)
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
     procedure Paint; override;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;

// Classe botão Warning
type
  TBtnWarningST = class(TJvSpeedButton)
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
     procedure Paint; override;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;

// Classe botão Info
type
  TBtnInfoST = class(TJvSpeedButton)
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
     procedure Paint; override;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;

//classe botão Light
type
  TBtnLightST = class(TJvSpeedButton)
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
     procedure Paint; override;
  public

    constructor Create(AOwner: TComponent); override;
  published
    property CorHover: TColor read FCorHover write SetCorHover;
    property CorPadrao: TColor read FCorPadrao write SetCorPadrao;
  end;

//classe botão Dark
type
  TBtnDarkST = class(TJvSpeedButton)
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
     procedure Paint; override;
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
constructor TBtnPimaryST.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := PRIMARY;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Primary';
  Color := PRIMARY;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;

  // Força o botão a ignorar os estilos do Windows
  ControlStyle := ControlStyle - [csParentBackground];

end;

procedure TBtnPimaryST.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnPimaryST.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnPimaryST.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnPimaryST.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnPimaryST.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

// para corrigir o problema de cor com o windows
procedure TBtnPimaryST.Paint;
var
  Rect: TRect;
begin
  inherited Paint;

  // Preenche o fundo do botão com a cor atual
  Rect := ClientRect;
  Canvas.Brush.Color := PRIMARY;
  Canvas.FillRect(Rect);

  // Desenha o texto do botão
  Canvas.Font := Font;
  Canvas.TextOut(
    (Width - Canvas.TextWidth(Caption)) div 2,
    (Height - Canvas.TextHeight(Caption)) div 2,
    Caption
  );
end;

//*************** primary events ************************



//*************** Secundary events ************************
constructor TBtnSecundaryST.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := SECUNDARY;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Secundary';
  Color := SECUNDARY;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;

  // Força o botão a ignorar os estilos do Windows
  ControlStyle := ControlStyle - [csParentBackground];
end;

procedure TBtnSecundaryST.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnSecundaryST.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnSecundaryST.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnSecundaryST.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnSecundaryST.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

// para corrigir o problema de cor com o windows
procedure TBtnSecundaryST.Paint;
var
  Rect: TRect;
begin
  inherited Paint;

  // Preenche o fundo do botão com a cor atual
  Rect := ClientRect;
  Canvas.Brush.Color := SECUNDARY;
  Canvas.FillRect(Rect);

  // Desenha o texto do botão
  Canvas.Font := Font;
  Canvas.TextOut(
    (Width - Canvas.TextWidth(Caption)) div 2,
    (Height - Canvas.TextHeight(Caption)) div 2,
    Caption
  );
end;

//*************** Secundary events ************************


//*************** Success events ************************
constructor TBtnSuccessST.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := SUCCESS;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Success';
  Color := SUCCESS;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;

  // Força o botão a ignorar os estilos do Windows
  ControlStyle := ControlStyle - [csParentBackground];

end;

procedure TBtnSuccessST.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnSuccessST.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnSuccessST.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnSuccessST.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnSuccessST.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

// para corrigir o problema de cor com o windows
procedure TBtnSuccessST.Paint;
var
  Rect: TRect;
begin
  inherited Paint;

  // Preenche o fundo do botão com a cor atual
  Rect := ClientRect;
  Canvas.Brush.Color := SUCCESS;
  Canvas.FillRect(Rect);

  // Desenha o texto do botão
  Canvas.Font := Font;
  Canvas.TextOut(
    (Width - Canvas.TextWidth(Caption)) div 2,
    (Height - Canvas.TextHeight(Caption)) div 2,
    Caption
  );
end;

//*************** Success events ************************

//*************** Danger events ************************
constructor TBtnDangerST.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clred;  // Cor quando o mouse está sobre o botão
  FCorPadrao := DANGER;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Danger';
  Color := DANGER;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;

  // Força o botão a ignorar os estilos do Windows
  ControlStyle := ControlStyle - [csParentBackground];
end;

procedure TBtnDangerST.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnDangerST.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnDangerST.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnDangerST.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnDangerST.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

// para corrigir o problema de cor com o windows
procedure TBtnDangerST.Paint;
var
  Rect: TRect;
begin
  inherited Paint;

  // Preenche o fundo do botão com a cor atual
  Rect := ClientRect;
  Canvas.Brush.Color := DANGER;
  Canvas.FillRect(Rect);

  // Desenha o texto do botão
  Canvas.Font := Font;
  Canvas.TextOut(
    (Width - Canvas.TextWidth(Caption)) div 2,
    (Height - Canvas.TextHeight(Caption)) div 2,
    Caption
  );
end;

//*************** Danger events ************************

//*************** Warning events ************************
constructor TBtnWarningST.Create(AOwner: TComponent);
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

procedure TBtnWarningST.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnWarningST.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnWarningST.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnWarningST.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnWarningST.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

// para corrigir o problema de cor com o windows
procedure TBtnWarningST.Paint;
var
  Rect: TRect;
begin
  inherited Paint;

  // Preenche o fundo do botão com a cor atual
  Rect := ClientRect;
  Canvas.Brush.Color := WARNING;
  Canvas.FillRect(Rect);

  // Desenha o texto do botão
  Canvas.Font := Font;
  Canvas.TextOut(
    (Width - Canvas.TextWidth(Caption)) div 2,
    (Height - Canvas.TextHeight(Caption)) div 2,
    Caption
  );
end;

//*************** Warning events ************************


//*************** Info events ************************
constructor TBtnInfoST.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := INFO;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Info';
  Color :=  INFO;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;

  // Força o botão a ignorar os estilos do Windows
  ControlStyle := ControlStyle - [csParentBackground];
end;

procedure TBtnInfoST.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnInfoST.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnInfoST.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnInfoST.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnInfoST.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

// para corrigir o problema de cor com o windows
procedure TBtnInfoST.Paint;
var
  Rect: TRect;
begin
  inherited Paint;

  // Preenche o fundo do botão com a cor atual
  Rect := ClientRect;
  Canvas.Brush.Color := INFO;
  Canvas.FillRect(Rect);

  // Desenha o texto do botão
  Canvas.Font := Font;
  Canvas.TextOut(
    (Width - Canvas.TextWidth(Caption)) div 2,
    (Height - Canvas.TextHeight(Caption)) div 2,
    Caption
  );
end;

//*************** Info events ************************

//*************** Light events ************************
constructor TBtnLightST.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := LIGHT;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Light';
  Color := LIGHT;
  Font.Size := FONT_SIZE;
  Font.Color := clBlack;

  // Força o botão a ignorar os estilos do Windows
  ControlStyle := ControlStyle - [csParentBackground];

end;

procedure TBtnLightST.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnLightST.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnLightST.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnLightST.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnLightST.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

// para corrigir o problema de cor com o windows
procedure TBtnLightST.Paint;
var
  Rect: TRect;
begin
  inherited Paint;

  // Preenche o fundo do botão com a cor atual
  Rect := ClientRect;
  Canvas.Brush.Color := LIGHT;
  Canvas.FillRect(Rect);

  // Desenha o texto do botão
  Canvas.Font := Font;
  Canvas.TextOut(
    (Width - Canvas.TextWidth(Caption)) div 2,
    (Height - Canvas.TextHeight(Caption)) div 2,
    Caption
  );
end;

//*************** Light events ************************

//*************** Dark events ************************
constructor TBtnDarkST.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCorHover := clGrayText;  // Cor quando o mouse está sobre o botão
  FCorPadrao := DARK;    // Cor inicial do botão
  FFontePadrao := Font.Name; // Inicializa com a fonte padrão do botão
  Caption := 'Dark';
  Color := DARK;
  Font.Size := FONT_SIZE;
  Font.Color := clWhite;

  // Força o botão a ignorar os estilos do Windows
  ControlStyle := ControlStyle - [csParentBackground];
  
end;

procedure TBtnDarkST.SetCorHover(Value: TColor);
begin
  if FCorHover <> Value then
    FCorHover := Value;
end;

procedure TBtnDarkST.SetCorPadrao(Value: TColor);
begin
  if FCorPadrao <> Value then
  begin
    FCorPadrao := Value;
    Color := FCorPadrao;
  end;
end;

procedure TBtnDarkST.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  Color := FCorHover; // Altera a cor ao passar o mouse
end;

procedure TBtnDarkST.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  Color := FCorPadrao; // Volta à cor padrão
end;

procedure TBtnDarkST.SetFontePadrao(const Value: TFontName);
begin
  if FFontePadrao <> Value then
  begin
    FFontePadrao := Value;
    Font.Name := FFontePadrao; // Aplica a nova fonte ao botão
    Invalidate; // Redesenha o botão para refletir a alteração
  end;
end;

// para corrigir o problema de cor com o windows
procedure TBtnDarkST.Paint;
var
  Rect: TRect;
begin
  inherited Paint;

  // Preenche o fundo do botão com a cor atual
  Rect := ClientRect;
  Canvas.Brush.Color := DARK;
  Canvas.FillRect(Rect);

  // Desenha o texto do botão
  Canvas.Font := Font;
  Canvas.TextOut(
    (Width - Canvas.TextWidth(Caption)) div 2,
    (Height - Canvas.TextHeight(Caption)) div 2,
    Caption
  );
end;
//*************** Dark events ************************



procedure Register;
begin
  RegisterComponents('ButtonsCamaleao_st', [TBtnPimaryST, TBtnSecundaryST, TBtnSuccessST, TBtnDangerST, TBtnWarningST, TBtnInfoST, TBtnLightST, TBtnDarkST]);
end;


end.

