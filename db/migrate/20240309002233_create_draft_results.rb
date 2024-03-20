class CreateDraftResults < ActiveRecord::Migration[7.1]
  def change
    create_table :draft_results do |t|
      t.integer :game_id
      t.integer :school_id
      t.string :player

      t.timestamps
    end
  end
end
