class CreateSsfamilies < ActiveRecord::Migration
  def change
    create_table :ssfamilies do |t|
      t.string :nombre
      t.text :desc
      t.references :sfamily, index: true

      t.timestamps null: false
    end
    add_foreign_key :ssfamilies, :sfamilies
  end
end
