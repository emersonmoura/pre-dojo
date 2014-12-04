class CreatePartidas < ActiveRecord::Migration
  def change
    create_table :partidas do |t|
      t.integer :ranking
      t.references :jogador, index: true
      t.timestamps
    end
  end
end
