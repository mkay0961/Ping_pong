class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :num_players, default: 0
      t.string :status
      t.integer :winner_id
      t.integer :user_id

      t.timestamps
    end
  end
end
