# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'technical-challenge-example-order-output.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Billboard.new
  t.vendor_name = row['Vendor Name']
  t.unit_id = row['Unit ID']
  t.latitude = row['Latitude']
  t.longitude = row['Longitude']
  t.creative_asset = row['Has Uploaded Creative Asset']
  t.start_date = row['Start Date']
  t.end_date = row['End Date']
  t.price = row['4 Week Price']
  t.save
end
puts "There are now #{Billboard.count} rows in the billboards table."

User.create(first_name: 'Fahim', last_name: 'Ferdous', address: '555 Rose Ave Suite 3 Venice, CA 90291', phone: '17182166232', email: 'fahim@adquick.com', company_name: 'AdQuick', order: '2018-03-20T15:45:17.008-07:00')
