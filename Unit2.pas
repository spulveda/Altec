unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UnitAPICEP, XMLDoc,
  Xml.XMLIntf, IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase;

type
  TFormMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtNome: TEdit;
    edtIdentidade: TEdit;
    edtCPF: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    edtCep: TEdit;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtEstado: TEdit;
    edtPais: TEdit;
    btnCadastrar: TButton;
    procedure edtCepExit(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure enviarEmail(sTexto: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.btnCadastrarClick(Sender: TObject);
var
  Xml: IXMLDocument;
  Node: IXMLNode;
begin
  Xml := NewXMLDocument;
  Node := Xml.AddChild('Cadastro');

  Node.Attributes['id'] := TGUID.NewGuid.ToString();
  Node.AddChild('nome').Text := edtNome.Text;
  Node.AddChild('identidade').Text := edtIdentidade.Text;
  Node.AddChild('cpf').Text := edtCPF.Text;
  Node.AddChild('telefone').Text := edtTelefone.Text;
  Node.AddChild('email').Text := edtEmail.Text;
  Node.AddChild('cep').Text := edtCep.Text;
  Node.AddChild('logradouro').Text := edtLogradouro.Text;
  Node.AddChild('numero').Text := edtNumero.Text;
  Node.AddChild('complemento').Text := edtComplemento.Text;
  Node.AddChild('bairro').Text := edtBairro.Text;
  Node.AddChild('cidade').Text := edtCidade.Text;
  Node.AddChild('estado').Text := edtEstado.Text;
  Node.AddChild('pais').Text := edtPais.Text;

  enviarEmail(Xml.Xml.Text);
end;

procedure TFormMain.enviarEmail(sTexto: String);
var
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;
begin

  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
  IdSMTP := TIdSMTP.Create(Self);
  IdMessage := TIdMessage.Create(Self);

  try
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.UseTLS := utUseImplicitTLS;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Port := 465;
    IdSMTP.Host := 'smtp.gmail.com';
    IdSMTP.Username := 'email@gmail.com';
    IdSMTP.Password := 'senha';

    IdMessage.From.Address := 'usuario@gmail.com';
    IdMessage.From.Name := 'Usuário';
    IdMessage.ReplyTo.EMailAddresses := 'usuario@gmail.com';
    IdMessage.Recipients.Add.Text := 'destino@outlook.com';
    IdMessage.Subject := 'XML do Cadastro';

    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add(sTexto);
    IdText.ContentType := 'text/plain; charset=iso-8859-1';

    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E: Exception do
      begin
        MessageDlg('Erro na conexão ou autenticação: ' + E.Message, mtWarning,
          [mbOK], 0);
        Exit;
      end;
    end;

    try
      IdSMTP.Send(IdMessage);
      MessageDlg('Mensagem enviada com sucesso!', mtInformation, [mbOK], 0);
    except
      On E: Exception do
      begin
        MessageDlg('Erro ao enviar a mensagem: ' + E.Message, mtWarning,
          [mbOK], 0);
      end;
    end;
  finally
    IdSMTP.Disconnect;
    UnLoadOpenSSLLibrary;
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;

end;

procedure TFormMain.edtCepExit(Sender: TObject);
var
  APICep: TAPICep;
  Ret: Integer;
begin
  if edtCep.Text <> '' then
  begin
    APICep := TAPICep.Create(edtCep.Text);
    Ret := APICep.Response;
    if Ret <> 200 then
    begin
      ShowMessage('CEP não encontrado');
      Exit;
    end;

    edtLogradouro.Text := APICep.Logradouro;
    edtBairro.Text := APICep.Bairro;
    edtCidade.Text := APICep.Localidade;
    edtEstado.Text := APICep.UF;
    edtPais.Text := 'Brasil';

    edtNumero.SetFocus;

  end;
end;

end.
