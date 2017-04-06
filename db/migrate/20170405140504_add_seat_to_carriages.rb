class AddSeatToCarriages < ActiveRecord::Migration[5.0]
  def change
    add_column :carriages, :only_seat, :integer
  end
end
