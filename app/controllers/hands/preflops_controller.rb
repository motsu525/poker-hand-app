class Hands::PreflopsController < ApplicationController
  before_action :authenticate_user!

  PREFLOP_ORDER = ["UTG", "UTG1", "UTG2", "LJ", "HJ", "CO", "BTN", "SB", "BB"]
  POSTFLOP_ORDER = ["SB", "BB", "UTG", "UTG1", "UTG2", "LJ", "HJ", "CO", "BTN"]

  def new
    @hand = Hand.find(params[:hand_id])
    @hero = @hand.players.find_by(is_hero: true)
    @villain = @hand.players.find_by(is_hero: false)
    @first_actor = first_actor_preflop(@hero.position, @villain.position)

    session[:preflop_current_actor] ||= @first_actor.to_s
    session[:preflop_action_order] ||= 1
    @current_actor = session[:preflop_current_actor].to_sym
  end

  def create
    @hand = Hand.find(params[:hand_id])
    @hero = @hand.players.find_by(is_hero: true)
    @villain = @hand.players.find_by(is_hero: false)

    current_actor = (session[:preflop_current_actor] || first_actor_preflop(@hero.position, @villain.position).to_s).to_sym
    action_order = session[:preflop_action_order] || 1

    Action.create(
      hand: @hand,
      player: current_actor == :hero ? @hero : @villain,
      street: "preflop",
      action_type: params[:action_type],
      amount: params[:amount],
      action_order: action_order,
      is_all_in: params[:is_all_in] == "true"
    )

    if params[:action_type] == "fold"
      session.delete(:preflop_current_actor)
      session.delete(:preflop_action_order)
      redirect_to hand_path(@hand)
    elsif params[:action_type] == "call"
      session.delete(:preflop_current_actor)
      session.delete(:preflop_action_order)
      redirect_to new_hand_flop_path(@hand)
    else
      next_actor = current_actor == :hero ? :villain : :hero
      session[:preflop_current_actor] = next_actor.to_s
      session[:preflop_action_order] = action_order + 1
      redirect_to new_hand_preflop_path(@hand)
    end
  end

  private

  def first_actor_preflop(hero_pos, villain_pos)
    hero_idx = PREFLOP_ORDER.index(hero_pos)
    villain_idx = PREFLOP_ORDER.index(villain_pos)
    hero_idx < villain_idx ? :hero : :villain
  end
end