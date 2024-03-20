class School < ApplicationRecord
	has_many :draft_results
	has_many :draft_ranks
	has_many :games

	def self.to_csv
    attributes = %w[id seed region name alive wins created_at updated_at]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |school|
        csv << school.attributes.values_at(*attributes)
      end
    end
  end

end
