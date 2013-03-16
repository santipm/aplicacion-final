class AmistadController < ApplicationController
before_filter :authenticate_user!
  def crear
  	@usuario = current_user
  	@amigo = User.find(params[:id])

  	#Solicitar Amistad
  	 if Amigo.existe_amistad?(@usuario,@amigo)
  		Amigo.solicitar_amistad(@usuario,@amigo)

  		#Email amigo
  		Email.solicitar_amistad(@usuario,@amigo).deliver
  			#Mostrar mensaje - petición correcta
  		flash[:notice] = "Se ha realizado correctamente"
  		
  	else
  		flash[:notice] = "Ya existe amistad"
  	end
  	#Redireccionar
  		redirect_to @amigo


  end


 def aceptar
 	@usuario = User.find_by_name(params[:nombre])

 	Amigo.aceptar_amistad(@usuario,current_user)
 	Amigo.aceptar_amistad(current_user,@usuario)

 	redirect_to current_user

 end

def rechazar 
  @usuario = User.find_by_name(params[:nombre])
  Amigo.rechazar_amistad(@usuario,current_user)
  Amigo.rechazar_amistad(current_user,@usuario)

  redirect_to current_user
end
