class ChangeColumnRemitoToInteger < ActiveRecord::Migration
  def up
    change_column :inputs, :remito, :integer
  end

  def down
    change_column :inputs, :remito, :string
  end
end