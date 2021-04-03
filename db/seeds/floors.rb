puts "loading ruby #{__FILE__}"

5.times do
  Floor.create!([{
                  name: Faker::Coffee.blend_name,
                  plant_type: Faker::Lorem.sentence(word_count: 5),
                  greenhouse_id: rand(1..5)
                }])
end
