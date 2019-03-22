class Bracket < ApplicationRecord
  belongs_to :tournament
  has_many :rounds
end
