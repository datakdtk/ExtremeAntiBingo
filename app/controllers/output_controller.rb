class OutputController < ApplicationController
  def index
    @folded_cards = FoldedCard.sorted
    @current_turn = OutputNumber.current_turn
    @in_game_outputs = OutputNumber.in_game_outputs.map(&:number)
    @excluded_outputs = OutputNumber.exluded.map(&:number)
    remaining_numbers = OutputNumber.remaining_numbers 
    @last_digits = (0 .. 9).map {|n| LastDigitNumber.new n, @in_game_outputs, @remaining_numbers }
  end
end
