class ReportesController < ApplicationController
	def por_operario
	end
	def por_equipo
	end
	def por_articulo
		@articles = Article.all
		render "reportes/articulo/seleccionar_articulo"
	end



	
	def index
	end
end
