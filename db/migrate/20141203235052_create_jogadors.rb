class CreateJogadors < ActiveRecord::Migration
  def change
    create_table :jogadors do |t|
      t.string :nome
      t.integer :assassinatos
      t.integer :mortes
      t.timestamps
    end
  end
end
