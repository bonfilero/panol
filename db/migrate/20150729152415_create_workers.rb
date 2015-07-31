class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers, id: false do |t|
      t.primary_key :legajo
      t.string :nombre

      t.timestamps null: false
    end
  end
end
