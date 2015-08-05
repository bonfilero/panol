class AddCommentToBalances < ActiveRecord::Migration
  def change
  	add_column :balances, :comment, :string
  end
end
