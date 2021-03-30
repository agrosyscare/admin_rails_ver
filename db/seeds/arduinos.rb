puts "loading ruby #{__FILE__}"

5.times do
  Arduino.create!([{
                    model: Faker::Device.model_name,
                    serial: Faker::Device.serial
                  }])
end
