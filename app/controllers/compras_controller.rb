class ComprasController < ApplicationController
	before_action :set_compra, only: [:show, :edit, :update, :destroy]
  
  def index
  	@compras = Buyorder.all
  end



  def new
  	@compra = Buyorder.new

  	@faltantes = Article.faltante 

  end
  def create
  	@compra = Buyorder.new

  	respond_to do |format|
  		if @compra.save

  			ids = params[:acomprar]

  			ids.each do |article|
  				ArticleHasBuyorder.create(article_id:article,buyorder_id:@compra.id)
  				a=Article.find(article)
          a.comprar!
          a.update(ultimoped:a.article_has_buyorder.last.id)
  			end


  			format.html { redirect_to @compra, notice: 'La compra se creó correctamente, lo artículos deberían estar en estado "pedido".' }
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