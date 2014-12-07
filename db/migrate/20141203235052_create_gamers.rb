class CreateGamers < ActiveRecord::Migration
  def change
    create_table :gamers do |t|
      t.string :name
      t.integer :killings
      t.integer :deaths
      t.references :round, index: true
      t.timestamps
    end
  end
end
