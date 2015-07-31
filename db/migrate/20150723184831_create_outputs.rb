class CreateOutputs < ActiveRecord::Migration
  def change
    create_table :outputs do |t|
      t.decimal :cantidad
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :outputs, :articles
  end
end
