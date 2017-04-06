class SeatCarriage < Carriage
  validates :only_seat, presence: true,
                  numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
