class Ticket < ApplicationRecord
  # belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :train

  validates :number, :passenger_name, :passport_number, presence: true

  before_validation :set_number

  private

  def set_number
    number = Ticket.maximum(:number).to_i || 1
    self.number = number + 1
  end
end
