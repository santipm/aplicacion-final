class PerfilController < ApplicationController
before_filter :authenticate_user!
  def index
  end

  def show
  	@usuario = User.find(current_user)
  	@usuario.perfil ||= @usuario.build_perfil
  	@perfil = @usuario.perfil
  end

  def update

  	@usuario = User.find(params[:id])
    @perfil = @usuario.perfil


    respond_to do |format|
      if current_user.create_perfil(params[:perfil])
        format.html {redirect_to @usuario, notice: "Datos Actualizados" }
      else
        format.html { render action: "show"}

      end
    end
  end
end
