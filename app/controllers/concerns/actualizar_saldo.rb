module ActualizarSaldo
	extend ActiveSupport::Concern

	def actualizar_saldo(articuloid,movement,inOrOut,idInOrOut)


	    @article = Article.find(articuloid)

	    if @article.balances.last.present?
	      saldo_actual = @article.balances.last.saldo
	      
	    else
	      raise
	      
	    end
	    
	    movement = movement.to_f	#paso la cantidad a número flotante
	    if inOrOut == "output" 	#si es salida, lo convierto a negativo para restarlo del saldo.
	    	saldo_nuevo = saldo_actual - movement
	    	output = Output.find(idInOrOut)
		    newbalance=@article.balances.new(saldo:saldo_nuevo,output_id:idInOrOut,comment:output.comment)
		    
			else
				saldo_nuevo = saldo_actual + movement
				input = Input.find(idInOrOut)
			 	newbalance=@article.balances.new(saldo:saldo_nuevo,input_id:idInOrOut,comment:input.comment)
		end
	    newbalance.save

	    saldo_min = @article.stockmin
	    estado = @article.state


	    # si el saldo recién creado es menor que mín
	    if saldo_nuevo < saldo_min
	    	if estado == "stock" # si el estado es stock, lo pasa a faltante
	    		@article.faltar!
	    	elsif estado == "pedido" && newbalance.input.present? && !newbalance.input.devolucion # si el estado es pedido y no es una devolución, pasa a faltante
	    		@article.entrar_con_faltante!
	    	end
	    
	    #si el saldo recién creado es mayor que mín
	    elsif saldo_nuevo >= saldo_min 
	    	#si estado es faltante
	    	if estado == "faltante"
	    		@article.devolver!
	    	#si estado es pedido
	    	elsif estado == "pedido" 
	    		if newbalance.input.present? && !newbalance.input.devolucion #es una entrada, y @input tiene como devolución: false => cambia estado a stock
	    			@article.entrar!
	    		end
	    	end
	    end
	  end

end