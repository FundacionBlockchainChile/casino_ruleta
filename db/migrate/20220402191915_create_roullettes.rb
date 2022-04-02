class CreateRoullettes < ActiveRecord::Migration[7.0]
  def change
    create_table :roullettes do |t|
      t.integer :roullette_wallet
      t.integer :time_delay
      t.float :max_temp_week
      t.boolean :conservative_bets

      t.timestamps
    end
  end
end
