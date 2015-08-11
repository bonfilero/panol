class ArticleHasBuyorder < ActiveRecord::Base
  include AASM

  belongs_to :article
  belongs_to :buyorder

  aasm column: "state" do
  	state :generada
		state :procesada
		state :ingresada
	
		event :ingresar do
			transitions from: :generada, to: :ingresada
		end
		
	end


end
