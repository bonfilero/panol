class AddStateToArticleHasBuyorder < ActiveRecord::Migration
  def change
    add_column :article_has_buyorders, :state, :string
  end
end
