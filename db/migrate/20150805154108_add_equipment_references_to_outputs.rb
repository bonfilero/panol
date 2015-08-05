class AddEquipmentReferencesToOutputs < ActiveRecord::Migration
  def change
    add_reference :outputs, :equipment, index: true
    add_foreign_key :outputs, :equipment
  end
end
