# == Schema Information
#
# Table name: folded_cards
#
#  id          :bigint           not null, primary key
#  player_name :string(255)      not null
#  open_count  :integer          not null
#  folded_turn :integer          not null
#  busted      :boolean          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FoldedCard < ApplicationRecord
  validates :player_name, presence: true
  validates :open_count, :numericality => {:only_integer => true }, inclusion: { in: (0..25)}
  validates :folded_turn, :numericality => {:only_integer => true }, inclusion: { in: (0..75)}

  scope :safe, -> { where(busted: false).order(open_count: :desc, folded_turn: :desc)}
end

