class AddInputRefToBalances < ActiveRecord::Migration
  def change
    add_reference :balances, :input, index: true
    add_foreign_key :balances, :inputs
  end
end
