# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_or_create_by(email: 'admin@admin.com') do |user|
  user.rut = '99.999.999-9'
  user.firstname = 'Usuario'
  user.lastname = 'Administrador'
  user.password = 'Abc123456-'
  user.password_confirmation = 'Abc123456-'
end

load "#{Rails.root}/db/seeds/environmental_conditions.rb"
load "#{Rails.root}/db/seeds/burlesque.rb"

if ENV.fetch('RAILS_ENV', 'development') == 'development'

  load "#{Rails.root}/db/seeds/greenhouses.rb"
  load "#{Rails.root}/db/seeds/arduinos.rb"
  load "#{Rails.root}/db/seeds/floors.rb" if Greenhouse.exists?
  load "#{Rails.root}/db/seeds/sensors.rb" if Arduino.exists?
end
