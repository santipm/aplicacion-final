class UsersController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!, :except=>:show

  def index
    @users = User.all
  end

  def show
    if params[:id]
    	@user = User.find(params[:id])
	  else
		  @user = User.find_by_name(params[:nombre])
	  end
  end

  def contacto
    @destinatario = User.find(params[:id])

    if request.post?
      if comprobar(params)
        flash[:notice] = "Se ha enviado correctamente"
      else
        flash[:alert] = "No se ha enviado correctamente"
      end
      redirect_to @destinatario
    end
  end
end
