class Amigo < ActiveRecord::Base
	belongs_to :user 
	belongs_to :amistad, :class_name=>"User", :foreign_key =>"amigo_id"
  attr_accessible :amigo_id, :estado, :user_id



  #Enviar petición de amistad

  def self.solicitar_amistad(usuario,amigo)
  	  self.create(:user_id=>usuario.id, :amigo_id=>amigo.id, :estado=>"pendiente")
  		self.create(:user_id=>amigo.id, :amigo_id=>usuario.id, :estado=>"solicitado")
  end

  def self.existe_amistad?(usuario,amigo)
  	find_by_user_id_and_amigo_id(usuario,amigo).nil? and usuario !=amigo
  end
  #Aceptar Amistad
  def self.aceptar_amistad(usuario,amigo)
  	nuestra_fila = self.find_by_user_id_and_amigo_id(usuario.id,amigo.id)
  	nuestra_fila.estado = "aceptado"
  	nuestra_fila.save!
  end
 #Rechazar Amistad
  def self.rechazar_amistad(usuario,amigo)
    nuestra_fila = self.find_by_user_id_and_amigo_id(usuario.id,amigo.id)
    nuestra_fila.estado = "rechazado"
    nuestra_fila.save!
  end
end
