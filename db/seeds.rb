# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'admin@admin.com', password: '123456', password_confirmation: '123456')

10.times do
  Greenhouse.create!([{
                       name: Faker::Coffee.blend_name,
                       description: Faker::Lorem.sentence(word_count: 5)
                     }])
end

5.times do
  Floor.create!([{
                  name: Faker::Coffee.blend_name,
                  plant_type: Faker::Lorem.sentence(word_count: 5),
                  greenhouse_id: rand(Greenhouse.count)
                }])
end
