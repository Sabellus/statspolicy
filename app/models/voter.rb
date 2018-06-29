class Voter < ApplicationRecord
  enum age: {
    'от 20' => 0,
    'от 20 до 40' => 1,
    'от 40 до 60' => 2,
    'от 60' => 3
  }
end
