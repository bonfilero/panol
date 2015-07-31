class SetCeroDefaultSaldoInArticles < ActiveRecord::Migration
  def change

#cambia borra la columna, y crea una nueva con saldo = 0 y tipo decimal
  	remove_column :articles, :saldo, :integer

  	add_column :articles, :saldo, :decimal, :default => 0
  end
end
