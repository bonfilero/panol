class AddColumnStateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :state, :string, default: "incompleto"
  end
end
