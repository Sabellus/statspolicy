class Vote < ApplicationRecord
  belongs_to :politician, optional: true
  belongs_to :voter
  belongs_to :interview
  # accepts_nested_attributes_for :voter
end
