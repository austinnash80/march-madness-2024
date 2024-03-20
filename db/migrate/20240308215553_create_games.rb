class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :status
      t.string :p1
      t.integer :p1_score
      t.string :p2
      t.integer :p2_score
      t.string :p3
      t.integer :p3_score
      t.string :p4
      t.integer :p4_score

      t.timestamps
    end
  end
end
