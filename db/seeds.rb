require_relative '../app/models/comedian.rb'
require_relative '../app/models/special.rb'

Comedian.destroy_all
Special.destroy_all

dave = Comedian.create(name: "Dave Chappelle", dob: "1973-08-24", city: "Washington, D.C.")
eddie = Comedian.create(name: "Eddie Murphy", dob: "1961-04-03", city: "Brooklyn, NY")
robin = Comedian.create(name: "Robin Williams", dob: "1951-07-21", city: "Chicago, Illinois")
jerry = Comedian.create(name: "Jerry Seinfeld", dob: "1954-04-29", city: "Brooklyn, NY")
bill = Comedian.create(name: "Bill Burr", dob: "1968-06-10", city: "Canton, Massachusettes")
aziz = Comedian.create(name: "Aziz Ansari", dob: "1983-02-23", city: "Columbia, South Carolina")
chelsea = Comedian.create(name: "Chelsea Handler", dob: "1975-02-25", city: "Livingston, New Jersey")
jim = Comedian.create(name: "Jim Jeffries", dob: "1977-02-14", city: "Sydney, Australia")
chris = Comedian.create(name: "Chris Rock", dob: "1965-02-07", city: "Andrews, South Carolina")
demetri = Comedian.create(name: "Demetri Martin", dob: "1973-05-25", city: "New York City, NY")
louis = Comedian.create(name: "Louis C.K.", dob: "1967-09-12", city: "Washington, D.C.")
sarah = Comedian.create(name: "Sarah Silverman", dob: "1970-12-01", city: "Bedford, New Hampshire")

dave.specials.create(name: "Dave Chappelle: Killin' Them Softly", run_time: 500, image: "https://pmcvariety.files.wordpress.com/2017/12/dave-chappelle.jpg?w=1000")
dave.specials.create(name: "Dave Chappelle: For What It's Worth", run_time: 500, image: "https://occ-0-2433-999.1.nflxso.net/art/3dee0/99bfe4dc058d1bb67cac26d2b125a864cf33dee0.jpg")
dave.specials.create(name: "Deep in the Heart of Texas: Dave Chappelle Live at Austin City Limits", run_time: 500, image: "https://occ-0-2433-999.1.nflxso.net/art/3dee0/99bfe4dc058d1bb67cac26d2b125a864cf33dee0.jpg")
eddie.specials.create(name: "Special 3", run_time: 500, image: "https://occ-0-2433-999.1.nflxso.net/art/3dee0/99bfe4dc058d1bb67cac26d2b125a864cf33dee0.jpg")
robin.specials.create(name: "Special 4", run_time: 500)
jerry.specials.create(name: "Special 5", run_time: 500)
bill.specials.create(name: "Special 5", run_time: 500)
aziz.specials.create(name: "Special 5", run_time: 500)
chelsea.specials.create(name: "Special 5", run_time: 500)
jim.specials.create(name: "Special 5", run_time: 500)
chris.specials.create(name: "Special 5", run_time: 500)
demetri.specials.create(name: "Special 5", run_time: 500)
louis.specials.create(name: "Special 5", run_time: 500)
sarah.specials.create(name: "Special 5", run_time: 500)

#Any of these would also work for creating specials:
# Special.create(name: "Special 1", run_time: 500, comedian_id: dave.id)
# Special.create(name: "Special 3", run_time: 500, comedian: dave)
# dave.specials << Special.create(name: "Special 4", run_time: 500)
