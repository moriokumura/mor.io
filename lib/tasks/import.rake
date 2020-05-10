# require 'csv'
#
# namespace :import do
#
#   PaperTrail.whodunnit = "rake:import #{`whoami`.strip}"
#
#   desc 'Import AttributeItems'
#   task :attribute_items, [:file] => :environment do |task_name, args|
#     PaperTrail.whodunnit = "rake:#{task_name} #{`whoami`.strip}"
#
#     file = args[:file] || File.join(Rails.root, 'lib', 'tasks', 'import', 'attribute_items.csv')
#     csv_hash(file).each do |row|
#       item = AttributeItem.new
#       row.each do |k, v|
#         item.send("#{k}=", v)
#       end
#       item.save!
#     end
#   end
# end
#
# # Read CSV file and returns Array of Hash.
# # Keys are symbolized header row.
# #
# # @param [String] csv_path
# # @return [Array<Hash>]
# def csv_hash(csv_path)
#   rows = CSV.read(csv_path)
#   keys = rows.shift
#   rows.map {|a| Hash[ keys.map(&:to_sym).zip(a) ] }
# end
