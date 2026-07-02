class HandsController < ApplicationController
  before_action :authenticate_user!

  def index
    @hands = current_user.hands.order(created_at: :desc)
  end

  def show
    @hand = current_user.hands.find(params[:id])
    @hero = @hand.players.find_by(is_hero: true)
    @villain = @hand.players.find_by(is_hero: false)
    @hero_card = @hand.hole_cards.find_by(player: @hero)
    @actions = @hand.actions.order(:action_order)
  end
end