class AddWorkerReferencesToOutputs < ActiveRecord::Migration
  def change
    add_reference :outputs, :worker, index: true
    add_foreign_key :outputs, :workers
  end
end
