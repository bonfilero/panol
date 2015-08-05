class ComprasController < ApplicationController
  
  def index
  	@compras = Buyorder.all
  end



  def new
  	@compra = Buyorder.new

  	@faltantes = Article.faltante
  end

end
