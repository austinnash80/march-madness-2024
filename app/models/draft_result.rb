class DraftResult < ApplicationRecord
  validates :school_id, uniqueness: { scope: [:game, :player]}

	belongs_to :school
	belongs_to :game

def self.to_csv
    attributes = %w[id game_id school_id player created_at updated_at]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |draft_result|
        csv << draft_result.attributes.values_at(*attributes)
      end
    end
  end

end
