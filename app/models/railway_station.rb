class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position ASC").uniq }

  def update_position(route, position)
    station_route = self.railway_stations_routes.where(route: route).first
    station_route.position = position
    station_route.save
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
