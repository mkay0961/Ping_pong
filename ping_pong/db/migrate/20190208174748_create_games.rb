class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.integer :loser_id
      t.string :status
      t.integer :p1_id
      t.integer :p2_id
      t.integer :round_id

      t.timestamps
    end
  end
end
