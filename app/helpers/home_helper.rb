#encoding: utf-8
module HomeHelper
	def ciudad_usuario(usuario)
		if usuario.perfil
			usuario.perfil.ciudad 
		else
			"Sín especificar"
		end
	end
end
