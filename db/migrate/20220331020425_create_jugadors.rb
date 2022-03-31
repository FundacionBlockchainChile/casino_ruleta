class CreateJugadors < ActiveRecord::Migration[7.0]
  def change
    create_table :jugadors do |t|
      t.string :nombre
      t.string :email
      t.integer :total_billetera

      t.timestamps
    end
  end
end
