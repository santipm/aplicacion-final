#encoding: utf-8
require 'test_helper'

class UserPerfilTest < ActionDispatch::IntegrationTest

  test "Entrar y salir session" do
    #Entrar de usuario
     post_via_redirect user_session_path,:user=> { :email=> users(:one).email, :password => "12345678"}
     assert_equal '/', path
     assert_equal flash[:notice], "Sesión iniciada."

    #Salir de la sesion
     delete destroy_user_session_path
     assert_equal flash[:notice], "Sesión finalizada."
   end

   test "login y entrar a configuracion basica" do
    #Entrar de usuario
     post_via_redirect user_session_path,:user=> { :email=> users(:one).email, :password => "12345678"}
     assert_equal flash[:notice], "Sesión iniciada."
     assert_equal '/', path
    #Entrar a cambiar configuración básica
     get "users/edit"
     assert_response :success
    end

    test "login y entrar al perfil" do
     #Entrar de usuario
      post_via_redirect user_session_path,:user=> { :email=> users(:one).email, :password => "12345678"}
      assert_equal flash[:notice], "Sesión iniciada."
      assert_equal '/', path
     #Entrar Perfil de usuario de la tabla tes
     usuario = Perfil.find_by_nombre(perfiles(:one).nombre)
     get  perfil_path(usuario)
     assert_response :success
    
    end

    test "realizar registro" do
        #Registro de usuario
     post_via_redirect user_registration_path, :user=> {:name=>"santiago", :email=>"curso_rails@prueba.com", :password=>"12345678", :password_confirmation=>"12345678"}
     assert_equal "Tu cuenta fue creada.", flash[:notice]
    end


   test "realizar registro y entrar perfil" do
    #Registro de usuario
     post_via_redirect user_registration_path, :user=> {:name=>"santiago", :email=>"curso_rails@prueba.com", :password=>"12345678", :password_confirmation=>"12345678"}
     assert_equal "Tu cuenta fue creada.", flash[:notice]
     #Entrar Perfil del nuevo usuario
     usuario = User.find_by_name("santiago")
     get  perfil_path(usuario)
     assert_response :success
     #Rellenar Perfil
     put_via_redirect perfil_path, :perfil=>{:nombre=>"Santiago",
      :apellidos=>"Moreno",
      :sexo=>"Hombre",
      :ciudad=>"Málaga",
      :fecha_nacimiento=>"1981-02-05"}

   end


end
