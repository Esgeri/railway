class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :train

  validates :number, :passenger_name, :passport_number, presence: true

  before_validation :set_number

  after_create :send_notification
  after_destroy :send_cancel_notification

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_cancel_notification
    TicketsMailer.cancel_ticket(self.user, self).deliver_now
  end

  def set_number
    number = Ticket.maximum(:number).to_i || 1
    self.number = number + 1
  end
end
