class Hands::VillainsController < ApplicationController
  before_action :authenticate_user!

  def new
    @hand = Hand.find(params[:hand_id])
    @hero_position = session[:hero_position]
    Rails.logger.debug "hero_position: #{@hero_position}"
  end

  def create
    @hand = Hand.find(params[:hand_id])

    # 既存のVillainPlayerを削除して重複を防ぐ
    @hand.players.find_by(is_hero: false)&.destroy

    @player = @hand.players.build(
      name: "Villain",
      is_hero: false,
      stack: params[:stack],
      seat_number: 2,
      position: params[:selected_position]
    )
    if @player.save
      redirect_to new_hand_preflop_path(@hand)
    else
      render :new
    end
  end
end