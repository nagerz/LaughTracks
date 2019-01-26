RSpec.describe "comedians welcome page" do
  context "as a visitor" do
    before :each do
      @comic_1 = Comedian.create(name: "Dave Chappelle", dob: "1973-08-24", city: "Washington, D.C.")
      @comic_2 = Comedian.create(name: "Eddie Murphy", dob: "1961-04-03", city: "Brooklyn, NY")
      @comic_3 = Comedian.create(name: "Robin Williams", dob: "1951-07-21", city: "Chicago, Illinois")
      @comedians = [@comic_1, @comic_2, @comic_3]
      @comic_1.specials.create(name: "Dave Chappelle: Killin' Them Softly", run_time: 57, image: "https://m.media-amazon.com/images/M/MV5BMTcyOGMxN2MtYzUwYy00YzQxLTgwZTItZjAxZTIzYWM1YzEyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_.jpg")
      @comic_1.specials.create(name: "Dave Chappelle: For What It's Worth", run_time: 60, image: "https://m.media-amazon.com/images/M/MV5BZGQ2MjBjNDEtYWVlNi00Nzc3LTg2NjUtYWY3ZTkwNTAwNDQyXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")
      @comic_2.specials.create(name: "Eddie Murphy: Raw", run_time: 93, image: "https://m.media-amazon.com/images/M/MV5BOWEwYTk4YTgtZGVjNi00MmI0LTkwOTItOWUxYzBlN2YwZWFkXkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
      @comic_3.specials.create(name: "Robin Williams: Off the Wall", run_time: 60, image: "https://m.media-amazon.com/images/M/MV5BYWYwNTVkMTQtNTM5Ni00ZTFmLWEyYTEtODViNDQwNDM5ZjEyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjg5NTA5Mjg@._V1_.jpg")

    end

    it "has title" do
      visit '/comedians'

      within '#greeting' do

        expect(page).to have_content("Laugh Tracks")
      end
    end

    it "has statistics title" do
      visit '/comedians'

      within '.statistics-info' do
        expect(page).to have_content("Comedian Statistics:")
      end
    end

    it "has statistics" do

      avg_age = 56
      avg_length = 67
      visit '/comedians'

      within '.statistics-info' do
        expect(page).to have_content("Average age: #{avg_age}")
        expect(page).to have_content("Average special run time: #{avg_length}min.")
      end
    end

    it "lists comedians with info" do
      @comic_1.specials.create(name: "Dave Chappelle: Killin' Them Softly", run_time: 500, image: "https://pmcvariety.files.wordpress.com/2017/12/dave-chappelle.jpg?w=1000")
      @comic_1.specials.create(name: "Dave Chappelle: For What It's Worth", run_time: 501, image: "https://occ-0-2433-999.1.nflxso.net/art/3dee0/99bfe4dc058d1bb67cac26d2b125a864cf33dee0.jpg")
      @comic_1.specials.create(name: "Deep in the Heart of Texas: Dave Chappelle Live at Austin City Limits", run_time: 502, image: "https://occ-0-2433-999.1.nflxso.net/art/3dee0/99bfe4dc058d1bb67cac26d2b125a864cf33dee0.jpg")

      visit '/comedians'

      @comedians.each do |comedian|
        within "#comedian_#{comedian.id}" do
          expect(page).to have_content("Name: #{comedian.name}")
          expect(page).to have_content("Age: #{comedian.age}")
          expect(page).to have_content("City: #{comedian.city}")

          within '#specials' do
            comedian.specials.each do |special|
              expect(page).to have_content("#{special.name}")
              expect(page).to have_content("#{special.run_time}")
              expect(page).to have_css("img[src*='#{special.image}']")
            end
          end
        end
      end
    end

    it "filters and lists comedians by age" do
      visit '/comedians?age=45'

      expect(page).to have_content("Name: #{@comic_1.name}")
      expect(page).to have_content("Age: #{@comic_1.age}")
      expect(page).to have_content("City: #{@comic_1.city}")
    end

    it "has statistics filtered by age" do
      age = 45
      visit "/comedians?age=#{age}"

      within '.statistics-info' do
        expect(page).to have_content("Average age: #{age}")
      end
    end

    ##Test sorting

  end
end
