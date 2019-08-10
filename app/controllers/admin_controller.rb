class AdminController < ApplicationController
  before_action :basic_auth

  def index
    @msg = params[:msg]
  end

  def post_card
    st_params = params.require(:folded_card).permit(:id, :open_count, :folded_turn)
    card = FoldedCard.find_or_initialize_by st_params
    card.save!
    redirect_to action: :index, msg: "カードを登録しました"
  end

  def next_turn
    OutputNumber.go_next_turn
    last_num = OutputNumber.last.number
    redirect_to action: :index, msg: "#{last_num}がでました。第#{OutputNumber.current_turn}ターンです"
  end

  def initalize_game
    OutputNumber.delete_all
    FoldedCard.delete_all
    OutputNumber.exclude_initial_numbers
    redirect_to action: :index, msg: "第#{OutputNumber.current_turn}ターンです"
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
