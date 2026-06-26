class Hand < ApplicationRecord
  belongs_to :user
  belongs_to :tournament

  has_many :players, dependent: :destroy
  has_many :hole_cards, dependent: :destroy
  has_many :actions, dependent: :destroy
  has_one :board, dependent: :destroy
end