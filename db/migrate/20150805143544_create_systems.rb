class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
