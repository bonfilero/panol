class ChangeColumnStockminToArticles < ActiveRecord::Migration
  def change
  	change_column :articles, :stockmin, :decimal, :default => 0
  end
end
