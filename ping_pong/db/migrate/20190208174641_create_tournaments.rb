class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :num_players
      t.string :status

      t.timestamps
    end
  end
end
