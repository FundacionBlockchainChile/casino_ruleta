class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.references :roullette, null: false, foreign_key: true
      t.integer :winner_number

      t.timestamps
    end
  end
end
