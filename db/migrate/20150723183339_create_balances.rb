class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :balances, :articles
  end
end
