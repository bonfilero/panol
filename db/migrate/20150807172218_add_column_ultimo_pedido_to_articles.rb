class AddColumnUltimoPedidoToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :ultimoped, :integer
  end
end
