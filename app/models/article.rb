class Article < ActiveRecord::Base
  include AASM

  belongs_to :sfamily
  belongs_to :family
  belongs_to :ssfamily
  has_many :balances
  has_many :inputs
  has_many :outputs
  has_many :buyorders, through: :article_has_buyorder
  has_many :article_has_buyorder
  has_many :prices

  

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
		event :devolver do
			transitions from: :faltante, to: :stock
		end
		event :entrar_con_faltante do
			transitions from: :pedido, to: :faltante		
		end
	end


  def actualizar_saldo(movement,inOrOut,idInOrOut)
#      @article = Article.find(articuloid)

      if self.balances.last.present?
        saldo_actual = self.balances.last.saldo
        
      else
        raise
        
      end
      
      movement = movement.to_f  #paso la cantidad a número flotante
      if inOrOut == "output"  #si es salida, lo convierto a negativo para restarlo del saldo.
        saldo_nuevo = saldo_actual - movement
        output = Output.find(idInOrOut)
        newbalance=self.balances.new(saldo:saldo_nuevo,output_id:idInOrOut,comment:output.comment)
        
      else
        saldo_nuevo = saldo_actual + movement
        input = Input.find(idInOrOut)
        newbalance=self.balances.new(saldo:saldo_nuevo,input_id:idInOrOut,comment:input.comment)
    	end
      newbalance.save

      saldo_min = self.stockmin
      estado = self.state


      # si el saldo recién creado es menor que mín
      if saldo_nuevo < saldo_min
        if estado == "stock" # si el estado es stock, lo pasa a faltante
          self.faltar!
        elsif estado == "pedido" && newbalance.input.present? && !newbalance.input.devolucion # si el estado es pedido y no es una devolución, pasa a faltante
          self.entrar_con_faltante!
        end
      
      #si el saldo recién creado es mayor que mín
      elsif saldo_nuevo >= saldo_min 
        #si estado es faltante
        if estado == "faltante"
          self.devolver!
        #si estado es pedido
        elsif estado == "pedido" 
          if newbalance.input.present? && !newbalance.input.devolucion #es una entrada, y @input tiene como devolución: false => cambia estado a stock
            self.entrar!
          end
        end
      end
  end





end
