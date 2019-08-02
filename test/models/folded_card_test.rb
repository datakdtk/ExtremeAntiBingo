# == Schema Information
#
# Table name: folded_cards
#
#  id          :bigint           not null, primary key
#  open_count  :integer          not null
#  folded_turn :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class FoldedCardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
