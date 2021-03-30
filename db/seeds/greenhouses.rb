puts "loading ruby #{__FILE__}"

10.times do
  Greenhouse.create!([{
                       name: Faker::Coffee.blend_name,
                       description: Faker::Lorem.sentence(word_count: 5)
                     }])
end
