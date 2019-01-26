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
ellen = Comedian.create(name: "Ellen DeGeneres", dob: "1958-01-26", city: "Metairie, Louisiana")
sarah = Comedian.create(name: "Sarah Silverman", dob: "1970-12-01", city: "Bedford, New Hampshire")

dave.specials.create(name: "Dave Chappelle: Killin' Them Softly", run_time: 57, image: "https://m.media-amazon.com/images/M/MV5BMTcyOGMxN2MtYzUwYy00YzQxLTgwZTItZjAxZTIzYWM1YzEyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_.jpg")
dave.specials.create(name: "Dave Chappelle: For What It's Worth", run_time: 60, image: "https://m.media-amazon.com/images/M/MV5BZGQ2MjBjNDEtYWVlNi00Nzc3LTg2NjUtYWY3ZTkwNTAwNDQyXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")
dave.specials.create(name: "Deep in the Heart of Texas: Dave Chappelle Live at Austin City Limits", run_time: 66, image: "https://m.media-amazon.com/images/M/MV5BODA1MDE3ZWYtMTliYi00YTc5LTk3MjQtZjY2YTlhMDQ3Y2Y3XkEyXkFqcGdeQXVyNTI3NjIyMjI@._V1_.jpg")
dave.specials.create(name: "Dave Chappelle: The Bird Revolution", run_time: 49, image: "https://m.media-amazon.com/images/M/MV5BNGYzOTE0YzEtMjc5NC00MTg2LTk2MDAtMzJlMjM1NTU1MjcwXkEyXkFqcGdeQXVyMTk2ODU0OTM@._V1_.jpg")
dave.specials.create(name: "The Age of Spin: Dave Chappelle Live at the Hollywood Palladium", run_time: 67, image: "https://m.media-amazon.com/images/M/MV5BZjJlNjg1NzktYTI2Zi00NjgyLWFiM2ItZTgzYWZhMmZiNDNlXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")

eddie.specials.create(name: "Eddie Murphy: Raw", run_time: 93, image: "https://m.media-amazon.com/images/M/MV5BOWEwYTk4YTgtZGVjNi00MmI0LTkwOTItOWUxYzBlN2YwZWFkXkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
eddie.specials.create(name: "Eddie Murphy: Delirious", run_time: 69, image: "https://m.media-amazon.com/images/M/MV5BMTQ5MDcyODU0Nl5BMl5BanBnXkFtZTcwMTgxNjA0MQ@@._V1_.jpg")

robin.specials.create(name: "Robin Williams: Off the Wall", run_time: 60, image: "https://m.media-amazon.com/images/M/MV5BYWYwNTVkMTQtNTM5Ni00ZTFmLWEyYTEtODViNDQwNDM5ZjEyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjg5NTA5Mjg@._V1_.jpg")
robin.specials.create(name: "Robin Williams Live on Broadway", run_time: 99, image: "https://m.media-amazon.com/images/M/MV5BMTc1MTQ4NjcyOF5BMl5BanBnXkFtZTcwODIyNzIyMQ@@._V1_.jpg")
robin.specials.create(name: "Robin Williams: An Evening at the Met", run_time: 65, image: "https://m.media-amazon.com/images/M/MV5BYzM0Zjc0OWItYWI1MC00NjQwLWE4YTktYWY1MDQyYjM3NjRkXkEyXkFqcGdeQXVyMTQ4NDY5OTc@._V1_.jpg")
robin.specials.create(name: "Robin Williams: Weapons of Self Destruction", run_time: 90, image: "https://m.media-amazon.com/images/M/MV5BMTc2NTg2OTQ0OV5BMl5BanBnXkFtZTcwNTcyNjgxMw@@._V1_.jpg")

jerry.specials.create(name: "Jerry Before Seinfeld", run_time: 62, image: "https://m.media-amazon.com/images/M/MV5BOTc2N2I0Y2UtOTgyYy00MTU3LTk1YzItZGIwMDcxY2JkMGQzXkEyXkFqcGdeQXVyMjQzNzk2ODk@._V1_.jpg")
jerry.specials.create(name: "Jerry Seinfeld: Stand-Up Confidential", run_time: 55, image: "https://m.media-amazon.com/images/M/MV5BYjZlNTgxMzYtZjc1ZS00OTQzLThiYWYtMTEzYjNmNDM1NmFkXkEyXkFqcGdeQXVyMzU0NzkwMDg@._V1_.jpg")
jerry.specials.create(name: "Jerry Seinfeld: 'I'm Telling You for the Last Time'", run_time: 75, image: "https://m.media-amazon.com/images/M/MV5BNDM4OTY0NTAyMF5BMl5BanBnXkFtZTcwNTcxMDQyMQ@@._V1_.jpg")

bill.specials.create(name: "Bill Burr: Let It Go", run_time: 65, image: "https://m.media-amazon.com/images/M/MV5BMjA0ODUxODkwOV5BMl5BanBnXkFtZTgwNTMwNTA2MDE@._V1_.jpg")
bill.specials.create(name: "Bill Burr: You People Are All the Same.", run_time: 69, image: "https://m.media-amazon.com/images/M/MV5BMjAyZTI1NjMtNjQ3OC00MDhhLTkxMDgtMDVmMThhNjE5M2NkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
bill.specials.create(name: "Bill Burr: I'm Sorry You Feel That Way", run_time: 80, image: "https://m.media-amazon.com/images/M/MV5BMTk0MzI5MjAxNV5BMl5BanBnXkFtZTgwNDY1NzA0NDE@._V1_SY1000_SX675_AL_.jpg")

aziz.specials.create(name: "Aziz Ansari: Dangerously Delicious", run_time: 61, image: "https://m.media-amazon.com/images/M/MV5BYzYzNzlhYTEtYTdkNS00NDdiLWE1N2MtM2ZlOTQzMjU5OTg5XkEyXkFqcGdeQXVyMTIxMDUyOTI@._V1_.jpg")
aziz.specials.create(name: "Aziz Ansari: Buried Alive", run_time: 80, image: "https://m.media-amazon.com/images/M/MV5BNzAyNTYyODI5Nl5BMl5BanBnXkFtZTgwMzkwMzY1MDE@._V1_SY1000_CR0,0,679,1000_AL_.jpg")
aziz.specials.create(name: "Aziz Ansari: Intimate Moments for a Sensual Evening", run_time: 56, image: "https://m.media-amazon.com/images/M/MV5BMTQyMzEyMTI5MV5BMl5BanBnXkFtZTgwMzM0NDA2MDE@._V1_.jpg")

chelsea.specials.create(name: "Uganda Be Kidding Me Live", run_time: 71, image: "https://m.media-amazon.com/images/M/MV5BMTgzOTI0NDg2N15BMl5BanBnXkFtZTgwMjYzODY3MjE@._V1_SY1000_CR0,0,685,1000_AL_.jpg")

jim.specials.create(name: "Jeff Jeffries: This Is Me Now", run_time: 70, image: "https://m.media-amazon.com/images/M/MV5BMzAxZDNlMmEtYjk2Ny00YzRjLTkwOTQtMDNkYmExMDZhNGNhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
jim.specials.create(name: "Jeff Jeffries: Freedumb", run_time: 86, image: "https://m.media-amazon.com/images/M/MV5BYmZkZDFlMzAtNjQ5MS00NDE4LWEwMjktYTRmOTc3Mjc2NjI0XkEyXkFqcGdeQXVyMjQ4MzkyMjE@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
jim.specials.create(name: "Jeff Jeffries: BARE", run_time: 77, image: "https://m.media-amazon.com/images/M/MV5BMmRlNDE0ZDctZTMwYi00MWQ2LTk2MzctNjdjODM0YWY1MjNmXkEyXkFqcGdeQXVyMjI0MjUyNTc@._V1_SY1000_SX675_AL_.jpg")

chris.specials.create(name: "Chris Rock: Bigger & Blacker", run_time: 65, image: "https://m.media-amazon.com/images/M/MV5BODQzOWExYjktZDQ2OC00YTA5LWI3YzctMDFjNjc3ZTM5NTA0XkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")
chris.specials.create(name: "Chris Rock: Never Scared", run_time: 80, image: "https://m.media-amazon.com/images/M/MV5BMTlhYzMzNzItNWMyYy00ZGRlLWI1N2UtOGI2YjIwOGEwYTViXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
chris.specials.create(name: "Chris Rock: Bring the Pain", run_time: 58, image: "https://m.media-amazon.com/images/M/MV5BMTU0ODk2MzYyM15BMl5BanBnXkFtZTcwMTUxMzYxMQ@@._V1_.jpg")
chris.specials.create(name: "Chris Rock: Kill the Messenger", run_time: 79, image: "https://m.media-amazon.com/images/M/MV5BMjAwMjQxNDA5OF5BMl5BanBnXkFtZTcwNTE3MzM5MQ@@._V1_.jpg")

demetri.specials.create(name: "Demetri Martin: The Overthinker", run_time: 56, image: "https://m.media-amazon.com/images/M/MV5BMGU1N2Q1ZGUtYWY3OC00M2Q5LWIyNGMtMjA3ZDcxMmY2N2M2XkEyXkFqcGdeQXVyMjQzOTM1NTc@._V1_.jpg")
demetri.specials.create(name: "Demetri Martin. Person.", run_time: 42, image: "https://m.media-amazon.com/images/M/MV5BMjE0MDgwNDE0MF5BMl5BanBnXkFtZTcwMDAzMDQ1MQ@@._V1_.jpg")
demetri.specials.create(name: "Demetri Martin: Standup Comedian", run_time: 60, image: "https://m.media-amazon.com/images/M/MV5BNDU5MDc3MzkwNl5BMl5BanBnXkFtZTgwNzU2ODU4NjE@._V1_.jpg")

ellen.specials.create(name: "Ellen DeGeneres: Relatable", run_time: 68, image: "https://m.media-amazon.com/images/M/MV5BYTlmYzI2NTMtYmZmOS00ZTYzLTg2ZTUtZDhkZjhkZDVjMWQwXkEyXkFqcGdeQXVyNDg4NjY5OTQ@._V1_SY1000_CR0,0,675,1000_AL_.jpg")
ellen.specials.create(name: "Ellen DeGeneres: Here and Now", run_time: 60, image: "https://m.media-amazon.com/images/M/MV5BMTgyNzgxMDA5MF5BMl5BanBnXkFtZTcwMTI1NTQyMQ@@._V1_.jpg")
ellen.specials.create(name: "Ellen DeGeneres: The Beginning", run_time: 66, image: "https://m.media-amazon.com/images/M/MV5BODQxNzQzMDc4Nl5BMl5BanBnXkFtZTgwMTgwNjgwMzE@._V1_.jpg")

sarah.specials.create(name: "Sarah Silverman: We Are Miracles", run_time: 53, image: "https://m.media-amazon.com/images/M/MV5BODU5MWI2YWEtNTQ3Ny00OWQ3LThkNTUtYzdiNDVjNDczM2NiXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_SY1000_SX675_AL_.jpg")
sarah.specials.create(name: "Sarah Silverman: Jesus Is Magic", run_time: 72, image: "https://m.media-amazon.com/images/M/MV5BMTYxOTUzOTU3N15BMl5BanBnXkFtZTcwNzE4ODUzMQ@@._V1_SY1000_CR0,0,670,1000_AL_.jpg")
sarah.specials.create(name: "Sarah Silverman: A Speck of Dust", run_time: 71, image: "https://m.media-amazon.com/images/M/MV5BMjYwYjhjM2EtYjgwYS00YjkyLTllMjQtZGM1ZmFkMTQ1YmFmXkEyXkFqcGdeQXVyMzUwMjc0NTU@._V1_.jpg")

#Any of these would also work for creating specials:
# Special.create(name: "Special 1", run_time: 500, comedian_id: dave.id)
# Special.create(name: "Special 3", run_time: 500, comedian: dave)
# dave.specials << Special.create(name: "Special 4", run_time: 500)
