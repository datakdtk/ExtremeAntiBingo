# == Schema Information
#
# Table name: output_numbers
#
#  id         :bigint           not null, primary key
#  turn       :integer          not null
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OutputNumber < ApplicationRecord
  EXCLUSION_COUNT = 30
  NUMBER_RANGE = 1 .. 75

  validates :number, inclusion: { in: (NUMBER_RANGE)}

  scope :excluded, -> { where(turn: -Float::INFINITY..-1).order(number: :asc) }
  scope :in_game, -> { where(turn: 1..Float::INFINITY).order(turn: :asc) }

  def self.exclude_initial_numbers
    (-EXCLUSION_COUNT .. -1).each { |n| create_at_random n }
  end

  def self.go_next_turn
    create_at_random(current_turn(force_reload: true) + 1)
  end

  def self.current_turn(force_reload: false)
    max_num = (force_reload ? all.reload.maximum(:turn) : maximum(:turn)) || 0
    [0, max_num].max
  end

  def self.remaining_numbers(force_reload: false)
    records = force_reload ? all.reload : all
    used_numbers = records.map(&:number)
    NUMBER_RANGE.to_a - used_numbers
  end

  def self.create_at_random(turn)
    num = remaining_numbers(force_reload: true).sample
    create! turn: turn, number: num
  end
end
