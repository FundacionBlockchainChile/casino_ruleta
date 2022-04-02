class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.references :round, null: false, foreign_key: true
      t.references :jugador, null: false, foreign_key: true
      t.string :jugador_name
      t.integer :bet_ammount
      t.integer :bet_number

      t.timestamps
    end
  end
end
