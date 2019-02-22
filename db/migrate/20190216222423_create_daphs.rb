class CreateDaphs < ActiveRecord::Migration[5.2]
  def change
    create_table :daphs do |t|

      t.timestamps
    end
  end
end
