puts "loading ruby #{__FILE__}"

# ROLES
# Burlesque::Role.for Arduino
# Burlesque::Role.for Environmental_condition
# Burlesque::Role.for Environmental_setting
# Burlesque::Role.for Floor
# Burlesque::Role.for Greenhouse
# Burlesque::Role.for Humidity_reading
# Burlesque::Role.for Root_moisture_reading
# Burlesque::Role.for Sensor
# Burlesque::Role.for Temperature_reading
Burlesque::Role.for User
# Burlesque::Role.for Version

# GROUPS
g = Burlesque::Group.find_or_create_by(name: "Encargado de invernadero")
# g.roles << Burlesque::Role.resource(Company).action(:read).where.not(id: g.role_ids)

g = Burlesque::Group.find_or_create_by(name: "Trabajador")
# g.roles << Burlesque::Role.resource(Company).action(:read).where.not(id: g.role_ids)
