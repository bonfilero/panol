class CreateBuyorders < ActiveRecord::Migration
  def change
    create_table :buyorders do |t|

      t.timestamps null: false
    end
  end
end
