class AddColumnToArticleHasBuyorder < ActiveRecord::Migration
  def change
    add_column :article_has_buyorders, :cantidad, :decimal
  end
end
