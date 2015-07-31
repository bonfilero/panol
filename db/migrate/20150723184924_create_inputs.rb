class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.decimal :cantidad
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :inputs, :articles
  end
end
