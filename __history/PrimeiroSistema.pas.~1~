unit PrimeiroSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Outline,
  Vcl.ExtCtrls;

type
  TJogador = (jNenhum, jX, jO);

  TForm7 = class(TForm)
    LinhaHorizontal1: TShape;
    LinhaHorizontal2: TShape;
    LinhaVertical1: TShape;
    LinhaVertical2: TShape;
    Bloco1: TPaintBox;
    Bloco2: TPaintBox;
    Bloco3: TPaintBox;
    Bloco4: TPaintBox;
    Bloco5: TPaintBox;
    Bloco6: TPaintBox;
    Bloco7: TPaintBox;
    Bloco8: TPaintBox;
    Bloco9: TPaintBox;
    LabelX: TLabel;
    LabelO: TLabel;
    Placar: TLabel;
    TimerVitoria: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure BlocoClick(Sender: TObject);
    procedure BlocoPaint(Sender: TObject);
    procedure TimerVitoriaTimer(Sender: TObject);
  private
    { Private declarations }
    JogadorAtual: TJogador;
    JogoFinalizado: Boolean;
    PiscarEstado: Boolean;
    PiscarContador: Integer;
    MensagemFim: string;
    VitoriasX: Integer;
    VitoriasO: Integer;
    function VerificarVitoria(Jogador: Integer): Boolean;
    procedure NovoJogo;
    procedure FimDeJogo(Mensagem: string);
    function TabuleiroCheio: Boolean;
    procedure DestacarVitoria(B1, B2, B3: TPaintBox; Jogador: Integer);
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
  JogadorAtual := jX;
  JogoFinalizado := False;
  VitoriasX := 0;
  VitoriasO := 0;
end;

procedure TForm7.BlocoClick(Sender: TObject);
var
  P: TPaintBox;
  JogadorMarcado: Integer;
begin
  if JogoFinalizado then
    Exit;

  if Sender is TPaintBox then
  begin
    P := Sender as TPaintBox;

    // Se está marcado n faz nada
    if P.Tag <> 0 then
      Exit;

    if JogadorAtual = jX then
    begin
      P.Tag := 1;
      JogadorMarcado := 1;
      JogadorAtual := jO;
    end
    else
    begin
      P.Tag := 2;
      JogadorMarcado := 2;
      JogadorAtual := jX;
    end;

    P.Invalidate;

    // Em caso de vitória
    if VerificarVitoria(JogadorMarcado) then
    begin
      JogoFinalizado := True;

      PiscarEstado := True;
      PiscarContador := 0;

      if JogadorMarcado = 1 then
      begin
        Inc(VitoriasX);
        LabelX.Caption := 'X: ' + VitoriasX.ToString;
        MensagemFim := 'Jogador X venceu!';
      end
      else
      begin
        Inc(VitoriasO);
        LabelO.Caption := 'O: ' + VitoriasO.ToString;
        MensagemFim := 'Jogador O venceu!';
      end;

      TimerVitoria.Enabled := True;
      Exit;
    end;

    // Empate
    if TabuleiroCheio then
    begin
      FimDeJogo('Empate!');
    end;
  end;
end;

procedure TForm7.BlocoPaint(Sender: TObject);
var
  P: TPaintBox;
begin
  P := Sender as TPaintBox;

  if (P.Tag = 3) or (P.Tag = 4) then
  begin
    if PiscarEstado then
      P.Canvas.Brush.Color := clMoneyGreen
    else
      P.Canvas.Brush.Color := clWhite;

    P.Canvas.FillRect(P.ClientRect);
  end
  else
  begin
    P.Canvas.Brush.Color := clWhite;
    P.Canvas.FillRect(P.ClientRect);
  end;

  if (P.Tag = 1) or (P.Tag = 3) then
  begin
    P.Canvas.Pen.Width := 4;
    P.Canvas.Pen.Color := clRed;
    P.Canvas.MoveTo(10, 10);
    P.Canvas.LineTo(P.Width - 10, P.Height - 10);
    P.Canvas.MoveTo(P.Width - 10, 10);
    P.Canvas.LineTo(10, P.Height - 10);
  end;

  if (P.Tag = 2) or (P.Tag = 4) then
  begin
    P.Canvas.Pen.Width := 4;
    P.Canvas.Pen.Color := clBlue;
    P.Canvas.Brush.Style := bsClear;
    P.Canvas.Ellipse(10, 10, P.Width - 10, P.Height - 10);
  end;

end;

function TForm7.VerificarVitoria(Jogador: Integer): Boolean;
begin
  Result := True;

  // Se ganhar completando as linhas
  if ((Bloco1.Tag = Jogador) and (Bloco2.Tag = Jogador) and
    (Bloco3.Tag = Jogador)) then
  begin
    DestacarVitoria(Bloco1, Bloco2, Bloco3, Jogador);
    Exit(True);
  end

  else if ((Bloco4.Tag = Jogador) and (Bloco5.Tag = Jogador) and
    (Bloco6.Tag = Jogador)) then
  begin
    DestacarVitoria(Bloco4, Bloco5, Bloco6, Jogador);
    Exit(True);
  end

  else if ((Bloco7.Tag = Jogador) and (Bloco8.Tag = Jogador) and
    (Bloco9.Tag = Jogador)) then
  begin
    DestacarVitoria(Bloco7, Bloco8, Bloco9, Jogador);
    Exit(True);
  end

  // Se ganhar completando as colunas
  else if ((Bloco1.Tag = Jogador) and (Bloco4.Tag = Jogador) and
    (Bloco7.Tag = Jogador)) then
  begin
    DestacarVitoria(Bloco1, Bloco4, Bloco7, Jogador);
    Exit(True);
  end

  else if ((Bloco2.Tag = Jogador) and (Bloco5.Tag = Jogador) and
    (Bloco8.Tag = Jogador)) then
  begin
    DestacarVitoria(Bloco2, Bloco5, Bloco8, Jogador);
    Exit(True);
  end

  else if ((Bloco3.Tag = Jogador) and (Bloco6.Tag = Jogador) and
    (Bloco9.Tag = Jogador)) then
  begin
    DestacarVitoria(Bloco3, Bloco6, Bloco9, Jogador);
    Exit(True);
  end

  // Se ganhar completando as diagonais
  else if ((Bloco1.Tag = Jogador) and (Bloco5.Tag = Jogador) and
    (Bloco9.Tag = Jogador)) then
  begin
    DestacarVitoria(Bloco1, Bloco5, Bloco9, Jogador);
    Exit(True);
  end

  else if ((Bloco7.Tag = Jogador) and (Bloco5.Tag = Jogador) and
    (Bloco3.Tag = Jogador)) then
  begin
    DestacarVitoria(Bloco7, Bloco5, Bloco3, Jogador);
    Exit(True);
  end

  else
    Result := False;
end;

function TForm7.TabuleiroCheio: Boolean;
var
  I: Integer;
begin
  Result := True;

  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TPaintBox then
      if TPaintBox(Components[I]).Tag = 0 then
        Exit(False);
  end;
end;

procedure TForm7.TimerVitoriaTimer(Sender: TObject);
begin
  PiscarEstado := not PiscarEstado;
  Inc(PiscarContador);

  Invalidate; // força repaint do form inteiro

  if PiscarContador >= 6 then
  begin
    TimerVitoria.Enabled := False;
    FimDeJogo(MensagemFim); // ⚠️ agora pode abrir MessageDlg
  end;
end;

procedure TForm7.NovoJogo;
var
  I: Integer;
begin
  // Limpa todos os paineis do jogo
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TPaintBox then
    begin
      TPaintBox(Components[I]).Tag := 0;
      TPaintBox(Components[I]).Invalidate;
    end;
  end;

  JogadorAtual := jX;
  JogoFinalizado := False;
end;

procedure TForm7.FimDeJogo(Mensagem: string);
begin
  JogoFinalizado := True;
  if MessageDlg(Mensagem + sLineBreak + 'Deseja iniciar um novo jogo?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    NovoJogo;
  end;
end;

procedure TForm7.DestacarVitoria(B1, B2, B3: TPaintBox; Jogador: Integer);
begin
  if Jogador = 1 then
  begin
    B1.Tag := 3;
    B2.Tag := 3;
    B3.Tag := 3;
  end
  else
  begin
    B1.Tag := 4;
    B2.Tag := 4;
    B3.Tag := 4;
  end;

  B1.Invalidate;
  B2.Invalidate;
  B3.Invalidate;
end;

end.
