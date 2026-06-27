class Hands::HeroesController < ApplicationController
  before_action :authenticate_user!

  RANK_ORDER = {"A" => 14, "K" => 13, "Q" => 12, "J" => 11, "T" => 10,
                "9" => 9, "8" => 8, "7" => 7, "6" => 6, "5" => 5,
                "4" => 4, "3" => 3, "2" => 2}

  def new
    @hand = Hand.find(params[:hand_id])
    @player = @hand.players.build(is_hero: true)
  end

  def create
    @hand = Hand.find(params[:hand_id])

    card1 = params[:card1]
    card2 = params[:card2]
    sorted = [card1, card2].sort_by { |c| -RANK_ORDER[c[0]] }

    @player = @hand.players.build(
      name: current_user.name,
      is_hero: true,
      stack: params[:stack],
      seat_number: 1
    )
    if @player.save
      HoleCard.create(
        hand: @hand,
        player: @player,
        card1: sorted[0],
        card2: sorted[1]
      )
      session[:hero_position] = params[:selected_position]
      redirect_to new_hand_villain_path(@hand)
    else
      render :new
    end
  end
end