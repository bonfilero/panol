class WelcomeController < ApplicationController
  def index
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
