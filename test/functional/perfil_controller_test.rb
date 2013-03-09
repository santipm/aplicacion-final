require 'test_helper'

class PerfilControllerTest < ActionController::TestCase

 test "No deja acceder a index" do
    get :index
    assert_redirected_to new_user_session_path
  end

  test "No deja acruby ceder a show" do
    get :show
    assert_redirected_to new_user_session_path
  end

  test "No deja acceder a actualizar" do
    get :update
    assert_redirected_to new_user_session_path
  end

end
