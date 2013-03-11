require 'test_helper'

class EmailTest < ActionMailer::TestCase
  test "enviar" do
    mail = Email.enviar(:asunto=>"Prueba Test", :mensaje=>"Mensaje",
    	:destinatario=>"prueba@email.com")
    assert_equal "Curso Rails - Prueba Test", mail.subject
    assert_equal ["prueba@email.com"], mail.to
    assert_equal "Curso Rails - mensaje", mail.from
    assert_match "Mensaje", mail.body.encoded
  end

end
