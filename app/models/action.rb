class Action < ApplicationRecord
  belongs_to :hand
  belongs_to :player
end
