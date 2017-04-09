class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, :top_seats, :bottom_seats, presence: true,
                  numericality: {only_integer: true, greater_than_or_equal_to: 0}

  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  scope :economy, -> { where(carriage_type: 'EconomyCarriage') }
  scope :coupe, -> { where(carriage_type: 'CoupeCarriage') }
  scope :ordered, -> { order(:number) }

  scope :sort_az, -> { order("number ASC") }
  scope :sort_za, -> { order("number DESC") }

  private

  def set_number
    number = train.carriages.maximum(:number) || 0
    self.number = number + 1
  end
end
