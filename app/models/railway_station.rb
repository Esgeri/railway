class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains, foreign_key: :current_station_id
end
