require_relative '../app/models/comedian.rb'
require_relative '../app/models/special.rb'

Comedian.destroy_all
Special.destroy_all

dave = Comedian.create(name: "Dave Chappelle", age: 35, city: "DC")
eddie = Comedian.create(name: "Eddie Murphy", age: 58, city: "NY")
robin = Comedian.create(name: "Robin Williams", age: 68, city: "Chicago")
jerry = Comedian.create(name: "Jerry Seinfeld", age: 50, city: "NY")

dave.specials.create(name: "Special 1", run_time: 500, image: "https://pmcvariety.files.wordpress.com/2017/12/dave-chappelle.jpg?w=1000")
dave.specials.create(name: "Special 2", run_time: 500, image: "https://occ-0-2433-999.1.nflxso.net/art/3dee0/99bfe4dc058d1bb67cac26d2b125a864cf33dee0.jpg")
eddie.specials.create(name: "Special 3", run_time: 500, image: "https://occ-0-2433-999.1.nflxso.net/art/3dee0/99bfe4dc058d1bb67cac26d2b125a864cf33dee0.jpg")
robin.specials.create(name: "Special 4", run_time: 500)
jerry.specials.create(name: "Special 5", run_time: 500)

#Any of these would also work for creating specials:
# Special.create(name: "Special 1", run_time: 500, comedian_id: dave.id)
# Special.create(name: "Special 3", run_time: 500, comedian: dave)
# dave.specials << Special.create(name: "Special 4", run_time: 500)
