class AddColumnsToOutputs < ActiveRecord::Migration
  def change
    add_column :outputs, :comment, :string
  end
end
