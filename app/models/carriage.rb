class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, :carriage_type, presence: true
end
