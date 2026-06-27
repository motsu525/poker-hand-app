class TournamentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.create(name: "tournament_#{Time.now.to_i}", avg_stack: params[:avg_stack])
    hand = current_user.hands.build(tournament: @tournament)
    if hand.save
      redirect_to new_hand_hero_path(hand)
    else
      render :new
    end
  end
end