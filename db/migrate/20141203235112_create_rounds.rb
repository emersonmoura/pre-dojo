class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.datetime :start
      t.datetime :finish
      t.timestamps
    end
  end
end
