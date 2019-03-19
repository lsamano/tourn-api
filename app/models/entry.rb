class Entry < ApplicationRecord
  belongs_to :team
  belongs_to :tournament
  validates_uniqueness_of :team_id, scope: :tournament_id
end
