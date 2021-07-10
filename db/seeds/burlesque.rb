puts "loading ruby #{__FILE__}"

# ROLES
Burlesque::Role.for User
Burlesque::Role.for User, actions: :datatable

# GROUPS
g = Burlesque::Group.find_or_create_by(name: "Encargado de invernadero")
g.roles << Burlesque::Role.resource(Company).action(:read).where.not(id: g.role_ids)

g = Burlesque::Group.find_or_create_by(name: "Trabajador")
g.roles << Burlesque::Role.resource(Company).action(:read).where.not(id: g.role_ids)
