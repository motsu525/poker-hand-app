class Player < ApplicationRecord
  belongs_to :hand

  has_one :hole_card, dependent: :destroy
  has_many :actions, dependent: :destroy
end