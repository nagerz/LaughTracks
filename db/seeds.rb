require_relative '../app/models/comedian.rb'
require_relative '../app/models/special.rb'

Comedian.destroy_all
Special.destroy_all

dave = Comedian.create(name: "Dave Chappelle", age: 35, city: "DC")
Comedian.create(name: "Eddie Murphy", age: 58, city: "NY")
Comedian.create(name: "Robin Williams", age: 68, city: "Chicago")
Comedian.create(name: "Jerry Seinfeld", age: 50, city: "NY")

dave.specials.create(name: "Special 2", run_time: 500)

#Any of these work:
# Special.create(name: "Special 1", run_time: 500, comedian_id: dave.id)
# Special.create(name: "Special 3", run_time: 500, comedian: dave)
# dave.specials << Special.create(name: "Special 4", run_time: 500)
