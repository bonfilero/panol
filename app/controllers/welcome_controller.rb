class WelcomeController < ApplicationController
  def index
  	@articles = Article.all
  
  end
  def dashboard

  end





=begin
  	
  def cambiar
  	@articles = Article.where("state='incompleto'")
  	@articles.each do |x|
  		x.update(state:"stock")
 		
  	end

  end
=end
end
