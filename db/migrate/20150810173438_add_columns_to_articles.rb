class AddColumnsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :codigo, :string, index: true
    add_column :articles, :saldo_proy, :decimal
    add_column :articles, :precio, :decimal
    add_column :articles, :ubicacion, :string
  end
end