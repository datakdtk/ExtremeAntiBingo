class LastDigitNumber

  attr_reader :number, :already_hit, :matching_remainnings_count

  def initialize(number, in_game_outputs, remainings)
    @number = number
    @already_hit = in_game_outputs.any? {|n| n % 10 == number }
    @all_remainings_count = remainings.size
    @matching_remainnings_count = remainings.select {|n| n % 10 == number }.count
  end

  def hit_probability
    Rational(@matching_remainnings_count, @all_remainings_count)
  end
end
