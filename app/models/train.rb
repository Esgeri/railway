class Train < ApplicationRecord
  has_many :carriages
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  validates :number, presence: true

  def sort_carriages
    sort_carriage ? carriages.sort_az : carriages.sort_za
  end

  def show_carriages_count_by_type(carriage_type, place_type)
    carriages.where(carriage_type: carriage_type).sum(place_type)
  end
end
