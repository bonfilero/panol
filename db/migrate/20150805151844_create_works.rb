class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :desc
      t.decimal :horas
      t.date :fecha
      t.references :equipment, index: true
      t.references :worker, index: true

      t.timestamps null: false
    end
    add_foreign_key :works, :equipment
    add_foreign_key :works, :workers
  end
end
