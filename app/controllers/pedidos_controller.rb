class PedidosController < ApplicationController
	def index
		@articles = Article.pedido.order(:ultimoped)
		@ordenes_abiertas = ArticleHasBuyorder.generada
	end
end
