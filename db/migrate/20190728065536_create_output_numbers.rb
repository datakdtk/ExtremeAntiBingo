class CreateOutputNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :output_numbers do |t|
      t.integer :turn, null: false
      t.integer :number, null: false
      t.timestamps
      t.index :turn, unique: true
      t.index :number, unique: true
    end
  end
end
