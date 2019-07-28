class CreateFoldedCards < ActiveRecord::Migration[5.2]
  def change
    create_table :folded_cards do |t|
      t.string :player_name, null: false
      t.integer :open_count, null: false
      t.integer :folded_turn, null: false
      t.boolean :busted, null: false
      t.timestamps
    end
  end
end
