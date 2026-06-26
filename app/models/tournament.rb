class Tournament < ApplicationRecord
  has_many :hands, dependent: :destroy
end