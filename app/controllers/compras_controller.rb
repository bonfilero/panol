class ComprasController < ApplicationController
	before_action :set_compra, only: [:show, :edit, :update, :destroy]
  
  def index
  	@compras = Buyorder.all
  end



  def new
  	@compra = Buyorder.new

  	@faltantes = Article.faltante
=begin
    @ordenes = []
    @faltantes.each do |orden|
      a = ArticleHasBuyorder.new
      @ordenes << a
    end
=end
  end
  
  def create
    #raise
    @compra = Buyorder.new

  	respond_to do |format|
  		if @compra.save

        articles = params[:articulos]
        cantidad = params[:cantidad]
        a = articles.length

        a.times do |count|
      		ArticleHasBuyorder.create(article_id:articles[count],buyorder_id:@compra.id,state:"generada",cantidad:cantidad[count])
  				article = Article.find(articles[count])
          article.comprar!
          article.update(ultimoped:article.article_has_buyorder.last.id)
          
        end
        


  			format.html { redirect_to @compra, notice: 'La compra se creó correctamente, los artículos deberían estar en estado "pedido".' }
        format.json { render :show, status: :created, location: @compra }
      else
        format.html { render :new }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@articles = @compra.articles
  end



=begin
	
  	def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
        if @article.saldo.present?
          saldo = @article.saldo
        else
          saldo = 0
        end
        @article.balances.create(article_id:@article.id,saldo:saldo,comment:"Carga inicial")
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
=end


	private

	def compras_params
		params.require(:buyorder).permit(:created_at)

	end
	def set_compra
      @compra = Buyorder.find(params[:id])
  end


end