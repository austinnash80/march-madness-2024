class DraftRank < ApplicationRecord
	belongs_to :school
	belongs_to :game

def self.to_csv
    attributes = %w[id game_id school_id player rank priority super_priority seed created_at updated_at]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |draft_rank|
        csv << draft_rank.attributes.values_at(*attributes)
      end
    end
  end
end
