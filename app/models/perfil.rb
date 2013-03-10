class Perfil < ActiveRecord::Base
	belongs_to :user
    attr_accessible :nombre, :apellidos, :sexo, :fecha_nacimiento, :ciudad


    CAMPOS = %w(nombre apellidos sexo ciudad)
	SEXO = ["Hombre","Mujer"]

	

	#Tamaños
	validates :nombre,:apellidos,:ciudad, :length =>
	{
		:maximum=> 30
		
	},
	:format=> {:with=>/^[a-zA-Z]*( |\S)[a-zA-Z]*$/,
	:message=>"%{value}, formato no permitido"}


	validates :fecha_nacimiento,
	:format =>{:with => /^\d{4}\-\d{2}\-\d{2}$/,
	:message=>"%{value}, incorrecta"}


	validates :sexo, :inclusion=> {:in=>SEXO}
end
