module ActualizarSaldo
	extend ActiveSupport::Concern

	def actualizar_saldo(articuloid,movement,inOrOut,idInOrOut)

#poner acá como variale si es in o out , y con eso ver si suma o resta, y si es input u output lo que crea.

	    @article = Article.find(articuloid)
	    if @article.balances.last.present?
	      saldo_actual = @article.balances.last.saldo
	      
	    else
	      saldo_actual = 0
	      
	    end
	    
	    movement = movement.to_f	#paso la cantidad a número flotante
	    if inOrOut == "output" 	#si es salida, lo convierto a negativo para restarlo del saldo.
	    	saldo_nuevo = saldo_actual - movement
		    newbalance=@article.balances.new(saldo:saldo_nuevo,output_id:idInOrOut)
		    
		else
			saldo_nuevo = saldo_actual + movement
		   	newbalance=@article.balances.new(saldo:saldo_nuevo,input_id:idInOrOut)
	    end
	    newbalance.save

	    saldo_min = @article.stockmin
	    estado = @article.state

	    # si el saldo recién creado es menor que mín y estado es stock
	    if saldo_nuevo < saldo_min && estado == "stock"
	    	@article.faltar!
	    
	    #si el saldo recién creado es mayor que mín y estado es faltante
	    elsif saldo_nuevo > saldo_min && estado == "faltante"
	    	@article.devolver!

	    #si el saldo recién creado es mayor que mín, es una entrada, y @input tiene como devolución: false => cambia estado stock

	    		
	    end
	  end

end