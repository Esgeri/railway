class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, :top_seats, :bottom_seats, presence: true

  scope :economy, -> { where(carriage_type: 'EconomyCarriage') }
  scope :coupe, -> { where(carriage_type: 'CoupeCarriage') }
  scope :ordered, -> { order(:number) }
end
