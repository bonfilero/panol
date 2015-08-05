class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :nombre
      t.string :codigo
      t.references :ssystem, index: true

      t.timestamps null: false
    end
    add_foreign_key :equipment, :ssystems
  end
end
