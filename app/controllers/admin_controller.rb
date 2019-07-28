class AdminController < ApplicationController
  def index
  end

  def post_cards
    st_params = params.require(:folded_card).permit(:id, :player_name, :open_count, :folded_turn)
    card = FoldedCard.find_or_initialize_by st_params
    card.save!
    redirect_to :back
  end

  def next_turn
    OutputNumber.go_next_turn
    redirect_to :back
  end

  def initalize_game
    OutputNumber.delete_all
    FoldedCard.delete_all
    OutputNumber.exclude_initial_numbers
    redirect_to :back
  end
end
