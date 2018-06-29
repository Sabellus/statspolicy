class Politician < ApplicationRecord
  belongs_to :territory
  has_one :operation
end
