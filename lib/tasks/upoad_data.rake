# namespace :upload do
#   desc 'Upload data to School'
#   task :data => :environment do
#     require 'csv'

#     file_path = '/Users/austinnash/Downloads/Book1.csv'

#     CSV.foreach(file_path, headers: true) do |row|
#       School.create!(row.to_hash)
#     end

#     puts 'Data uploaded successfully.'
#   end
# end
