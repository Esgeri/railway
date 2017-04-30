class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  # rubocop:disable Metrics/LineLength
  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }
  # rubocop:enable Metrics/LineLength

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route(route)
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def change_time(route, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arrival_time, departure_time: departure_time) if station_route(route)
  end

  def change_arrival_time_in(route)
    arrive_time = station_route(route).try(:arrival_time)
    arrive_time.strftime('%T') unless arrive_time.nil?
  end

  def change_departure_time_in(route)
    departure_time = station_route(route).try(:departure_time)
    departure_time.strftime('%T') unless departure_time.nil?
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.find_by(route: route)
  end
end
