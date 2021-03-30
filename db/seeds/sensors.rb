puts "loading ruby #{__FILE__}"

3.times do |i|
  Sensor.create!([{
                   model: Faker::Coffee.blend_name,
                   serial: Faker::Lorem.sentence(word_count: 5),
                   environmental_condition_id: i + 1,
                   arduino_id: Arduino.first.id
                 }])
end
