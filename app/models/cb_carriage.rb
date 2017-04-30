class CbCarriage < Carriage
  validates :bottom_seats, presence: true,
                  numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
