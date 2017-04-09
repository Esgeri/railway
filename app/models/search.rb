class Search
  include ActiveModel::Model

  attr_accessor :start_station_id, :end_station_id
  attr_reader :search_result

  def find_start_station
    @start_station ||= RailwayStation.find(start_station_id)
  end

  def find_end_station
    @end_station ||= RailwayStation.find(end_station_id)
  end

  def search_run
    @search_result = Train.joins(route: :railway_stations).where(railway_stations: { id: start_station_id }) &
                      Train.joins(route: :railway_stations).where(railway_stations: { id: end_station_id })
  end
end
