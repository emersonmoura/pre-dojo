class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :round, index: true
      t.references :gamer, index: true
      t.integer :killings
      t.integer :deaths

      t.timestamps
    end
  end
end
