class Email < ActionMailer::Base
  default from: "Curso Rails - mensaje"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.enviar.subject
  #
  def enviar(parametros)
   @asunto = parametros[:asunto]
   @mensaje = parametros[:mensaje]
   @destinatario = parametros[:destinatario]
   
   mail to: @destinatario,
        subject: "Curso Rails - #{@asunto}"
  end


  def solicitar_amistad(usuario,amigo)
    @usuario = usuario
    @amigo = amigo

    mail to: amigo.email,
         subject: "Solicitud de amistad de #{amigo.name}"

  end
end
