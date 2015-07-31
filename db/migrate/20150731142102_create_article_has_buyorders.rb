class CreateArticleHasBuyorders < ActiveRecord::Migration
  def change
    create_table :article_has_buyorders do |t|
      t.references :article, index: true
      t.references :buyorder, index: true

      t.timestamps null: false
    end
    add_foreign_key :article_has_buyorders, :articles
    add_foreign_key :article_has_buyorders, :buyorders
  end
end
