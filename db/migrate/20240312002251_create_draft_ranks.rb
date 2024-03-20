class CreateDraftRanks < ActiveRecord::Migration[7.1]
  def change
    create_table :draft_ranks do |t|
      t.integer :game_id
      t.integer :school_id
      t.string :player
      t.integer :rank
      t.boolean :priority
      t.boolean :super_priority

      t.timestamps
    end
  end
end
