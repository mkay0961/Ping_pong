class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :img_url
      t.boolean :active, default: true
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
