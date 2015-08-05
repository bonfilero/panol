class CreateSsystems < ActiveRecord::Migration
  def change
    create_table :ssystems do |t|
      t.string :nombre
      t.references :system, index: true

      t.timestamps null: false
    end
    add_foreign_key :ssystems, :systems
  end
end
