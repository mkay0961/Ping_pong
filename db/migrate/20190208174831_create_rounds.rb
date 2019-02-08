class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.string :num
      t.belongs_to :tournament, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
