class AddSaldoToBalances < ActiveRecord::Migration
  def change
    add_column :balances, :saldo, :decimal
  end
end
