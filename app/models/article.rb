class Article < ActiveRecord::Base
  include AASM

  belongs_to :sfamily
  belongs_to :family
  belongs_to :ssfamily
  has_many :balances
  has_many :inputs
  has_many :outputs
  has_many :buyorders, through: :article_has_buyorder

  

  aasm column: "state" do
  	state :stock
	 	state :faltante
		state :pedido
		
		event :faltar do
			transitions from: :stock, to: :faltante
		end
		event :entrar do
			transitions from: :pedido, to: :stock
		end
		event :comprar do
		  transitions from: :faltante, to: :pedido
		end
	end




end
