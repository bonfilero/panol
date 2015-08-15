class ReportesController < ApplicationController
	def por_operario
	end
	def por_equipo
		@equipment = Equipment.all
		render "reportes/equipo/seleccionar_equipo"
	end


	def cons_equipo
		# raise
		equipo = Equipment.find(params[:equipo])

		@outputs = equipo.outputs.all


		render "reportes/equipo/cons_equipo"
	
		
	end




	def por_articulo
		@articles = Article.all
		render "reportes/articulo/seleccionar_articulo"
	end
	def cons_articulo
		# raise
		article = Article.find(params[:articulo])
		@outputs = article.outputs.all

		render "reportes/articulo/cons_articulo"
	

	end




	
	def index
	end
end
