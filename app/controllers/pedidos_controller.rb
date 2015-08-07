class PedidosController < ApplicationController
	def index
		@articles = Article.pedido.order(:ultimoped)
	end
end
