class HoleCard < ApplicationRecord
  belongs_to :hand
  belongs_to :player
end
