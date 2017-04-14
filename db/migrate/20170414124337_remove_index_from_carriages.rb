class RemoveIndexFromCarriages < ActiveRecord::Migration[5.0]
  def change
    remove_index :carriages, name: "index_carriages_on_id_and_type"
  end
end
