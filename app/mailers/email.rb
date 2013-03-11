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
end
