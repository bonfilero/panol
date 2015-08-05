class ChangeStateDefaultToArticles < ActiveRecord::Migration
  def change
  	change_column_default(:articles, :state, nil)
  end
end
