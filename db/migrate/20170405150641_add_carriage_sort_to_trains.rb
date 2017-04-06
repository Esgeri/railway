class AddCarriageSortToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :sort_carriage, :boolean, default: true
  end
end
