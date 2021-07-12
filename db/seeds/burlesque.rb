puts "loading ruby #{__FILE__}"

# ROLES
Burlesque::Role.for Arduino
Burlesque::Role.for EnvironmentalCondition
Burlesque::Role.for EnvironmentalSetting
Burlesque::Role.for Floor
Burlesque::Role.for Greenhouse
Burlesque::Role.for Greenhouse, actions: :charts
Burlesque::Role.for Sensor
Burlesque::Role.for User

# GROUPS
g = Burlesque::Group.find_or_create_by(name: "Encargado de invernadero")
g.roles << Burlesque::Role.resource(EnvironmentalSetting).where.not(id: g.role_ids)
g.roles << Burlesque::Role.resource(Floor).where.not(id: g.role_ids)
g.roles << Burlesque::Role.resource(Greenhouse).where.not(id: g.role_ids)
g.roles << Burlesque::Role.resource(User).where.not(id: g.role_ids)

g = Burlesque::Group.find_or_create_by(name: "Trabajador")
g.roles << Burlesque::Role.resource(Greenhouse).action(:read).where.not(id: g.role_ids)
g.roles << Burlesque::Role.resource(User).action(:read).where.not(id: g.role_ids)
