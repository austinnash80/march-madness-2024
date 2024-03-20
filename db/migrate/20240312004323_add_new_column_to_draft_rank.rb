class AddNewColumnToDraftRank < ActiveRecord::Migration[7.1]
  def change
    add_column :draft_ranks, :seed, :integer
    add_column :draft_ranks, :r1, :integer
    add_column :draft_ranks, :r2, :integer
    add_column :draft_ranks, :r3, :integer
    add_column :draft_ranks, :r4, :integer
  end
end
