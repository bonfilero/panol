class AddColumnsToInputs < ActiveRecord::Migration
  def up
    add_column :inputs, :remito, :string
    add_column :inputs, :devolucion, :boolean, default: false
    add_column :inputs, :comment, :string
  end

  def down
    remove_column :inputs, :devolucion
    remove_column :inputs, :remito
    remove_column :inputs, :comment
  end
end
