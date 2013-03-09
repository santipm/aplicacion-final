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

  	@usuario = User.find(current_user)
    @perfil = Perfil.new(params[:perfil])
    @usuario.perfil ||= @usuario.build_perfil

    respond_to do |format|
      if @perfil.save
          @usuario.perfil.update_attributes(params[:perfil])
          format.html {redirect_to @usuario, notice: "Datos Actualizados" }
      else
        format.html { render action: "show"}

      end
    end
  end
end
