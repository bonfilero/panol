class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :nombre
      t.text :desc

      t.timestamps null: false
    end
  end
end
