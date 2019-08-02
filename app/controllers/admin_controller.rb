class AdminController < ApplicationController
  def index
    @msg = params[:msg]
  end

  def post_card
    st_params = params.require(:folded_card).permit(:id, :open_count, :folded_turn)
    st_params[:player_name] = "hoge"
    card = FoldedCard.find_or_initialize_by st_params
    card.save!
    redirect_to action: :index, msg: "カードを登録しました"
  end

  def next_turn
    OutputNumber.go_next_turn
    redirect_to action: :index, msg: "第#{OutputNumber.current_turn}ターンです"
  end

  def initalize_game
    OutputNumber.delete_all
    FoldedCard.delete_all
    OutputNumber.exclude_initial_numbers
    redirect_to action: :index, msg: "第#{OutputNumber.current_turn}ターンです"
  end
end
