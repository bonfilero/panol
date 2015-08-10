class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :valor
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :prices, :articles
  end
end
