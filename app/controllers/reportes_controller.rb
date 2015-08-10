class ReportesController < ApplicationController
	def por_operario
	end
	def por_equipo
	end
	def por_articulo
		@articles = Article.all
		
	end
	def index
	end
end
