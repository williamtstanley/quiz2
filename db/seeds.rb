# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1000.times do
    department = ["sales", "marketing", "technical"]
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    name = "#{first_name} #{last_name}"
    email = "#{first_name}_#{last_name}#{rand(1000)}@example.com"
    SupportTicket.create name: name,
                         email: email,
                         department: department.shuffle[0],
                         message: Faker::Lorem.paragraph
end
