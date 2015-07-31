class AddOutputRefToBalances < ActiveRecord::Migration
  def change
    add_reference :balances, :output, index: true
    add_foreign_key :balances, :outputs
  end
end
