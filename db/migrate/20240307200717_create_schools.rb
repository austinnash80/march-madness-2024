class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools do |t|
      t.integer :seed
      t.string :region
      t.string :name
      t.boolean :alive
      t.integer :wins

      t.timestamps
    end
  end
end
