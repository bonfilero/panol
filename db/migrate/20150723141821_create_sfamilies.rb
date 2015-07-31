class CreateSfamilies < ActiveRecord::Migration
  def change
    create_table :sfamilies do |t|
      t.string :nombre
      t.text :desc
      t.references :family, index: true

      t.timestamps null: false
    end
    add_foreign_key :sfamilies, :families
  end
end
