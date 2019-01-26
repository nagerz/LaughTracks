#save_and_open_page

RSpec.describe "comedians welcome page" do
  context "as a visitor" do
    before :each do
      @comic_1 = Comedian.create(name: "Dave Chappelle", dob: "1973-08-24", city: "Washington, D.C.")
      @comic_2 = Comedian.create(name: "Eddie Murphy", dob: "1961-04-03", city: "Brooklyn, NY")
      @comic_3 = Comedian.create(name: "Robin Williams", dob: "1951-07-21", city: "Chicago, Illinois")
      @comic_4 = Comedian.create(name: "Sarah", dob: "1951-08-21", city: "Denver, CO")
      @comic_5 = Comedian.create(name: "Kirsten", dob: "1992-03-14", city: "Denver, CO")
      @comedians = [@comic_1, @comic_2, @comic_3, @comic_4, @comic_5]
      @comic_1.specials.create(name: "Dave Chappelle: Killin' Them Softly", run_time: 57, image: "https://m.media-amazon.com/images/M/MV5BMTcyOGMxN2MtYzUwYy00YzQxLTgwZTItZjAxZTIzYWM1YzEyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_.jpg")
      @comic_1.specials.create(name: "Dave Chappelle: For What It's Worth", run_time: 60, image: "https://m.media-amazon.com/images/M/MV5BZGQ2MjBjNDEtYWVlNi00Nzc3LTg2NjUtYWY3ZTkwNTAwNDQyXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")
      @comic_2.specials.create(name: "Eddie Murphy: Raw", run_time: 93, image: "https://m.media-amazon.com/images/M/MV5BOWEwYTk4YTgtZGVjNi00MmI0LTkwOTItOWUxYzBlN2YwZWFkXkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
      @comic_3.specials.create(name: "Robin Williams: Off the Wall", run_time: 60, image: "https://m.media-amazon.com/images/M/MV5BYWYwNTVkMTQtNTM5Ni00ZTFmLWEyYTEtODViNDQwNDM5ZjEyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjg5NTA5Mjg@._V1_.jpg")
      @comic_4.specials.create(name: "Sarah special", run_time: 50, image: "https://m.media-amazon.com/images/M/MV5BYWYwNTVkMTQtNTM5Ni00ZTFmLWEyYTEtODViNDQwNDM5ZjEyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjg5NTA5Mjg@._V1_.jpg")
      @comic_5.specials.create(name: "Kirstens not funny", run_time: 5, image: "https://m.media-amazon.com/images/M/MV5BYWYwNTVkMTQtNTM5Ni00ZTFmLWEyYTEtODViNDQwNDM5ZjEyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjg5NTA5Mjg@._V1_.jpg")
    end

    context "without parameters" do
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
        avg_age = 52.4
        avg_length = 54.2
        visit '/comedians'

        within '.statistics-info' do
          expect(page).to have_content("Average age: #{avg_age}")
          expect(page).to have_content("Average special run time: #{avg_length}min.")
        end
      end

      it "lists comedians with info" do
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
    end

    context "with age parameter" do
      it "filters and lists comedians by age" do
        age = 45
        visit "/comedians?age=#{age}"

        expect(page).to have_content("Name: #{@comic_1.name}")
        expect(page).to have_content("Age: #{@comic_1.age}")
        expect(page).to have_content("City: #{@comic_1.city}")
        expect(page).not_to have_content("Name: #{@comic_2.name}")
        expect(page).not_to have_content("Age: #{@comic_2.age}")
        expect(page).not_to have_content("City: #{@comic_2.city}")
        expect(page).not_to have_content("Name: #{@comic_3.name}")
        expect(page).not_to have_content("Age: #{@comic_3.age}")
        expect(page).not_to have_content("City: #{@comic_3.city}")
      end

      it "filters and lists comedians by age (multiple comedians)" do
        age = 67
        visit "/comedians?age=#{age}"

        expect(page).not_to have_content("Name: #{@comic_1.name}")
        expect(page).not_to have_content("Age: #{@comic_1.age}")
        expect(page).not_to have_content("City: #{@comic_1.city}")
        expect(page).not_to have_content("Name: #{@comic_2.name}")
        expect(page).not_to have_content("Age: #{@comic_2.age}")
        expect(page).not_to have_content("City: #{@comic_2.city}")
        expect(page).to have_content("Name: #{@comic_3.name}")
        expect(page).to have_content("Age: #{@comic_3.age}")
        expect(page).to have_content("City: #{@comic_3.city}")
        expect(page).to have_content("Name: #{@comic_4.name}")
        expect(page).to have_content("Age: #{@comic_4.age}")
        expect(page).to have_content("City: #{@comic_4.city}")
      end

      it "has statistics filtered by age" do
        age = 45
        visit "/comedians?age=#{age}"

        within '.statistics-info' do
          expect(page).to have_content("Average age: #{age}")
          expect(page).to have_content("Average special run time: 58.5")
          expect(page).to have_content("Comedian home towns:")
          within '#home-town-list' do
            expect(page).to have_content("Washington, D.C.")
            expect(page).not_to have_content("Brooklyn, NY")
            expect(page).not_to have_content("Chicago, Illinois")
          end
        end
      end

      it "has statistics filtered by age (multiple comedians)" do
        age = 67
        visit "/comedians?age=#{age}"

        within '.statistics-info' do
          expect(page).to have_content("Average age: #{age}")
          expect(page).to have_content("Average special run time: 55")
          expect(page).to have_content("Comedian home towns:")
          within '#home-town-list' do
            expect(page).not_to have_content("Washington, D.C.")
            expect(page).not_to have_content("Brooklyn, NY")
            expect(page).to have_content("Chicago, Illinois")
            expect(page).to have_content("Denver, CO")
          end
        end
      end
    end

    context "with city parameter" do
      it "filters and lists comedians by city (multiple comedians)" do
        city = "Denver, CO"
        visit "/comedians?city=#{city}"

        expect(page).not_to have_content("Name: #{@comic_1.name}")
        expect(page).not_to have_content("Age: #{@comic_1.age}")
        expect(page).not_to have_content("City: #{@comic_1.city}")
        expect(page).not_to have_content("Name: #{@comic_2.name}")
        expect(page).not_to have_content("Age: #{@comic_2.age}")
        expect(page).not_to have_content("City: #{@comic_2.city}")
        expect(page).to have_content("Name: #{@comic_4.name}")
        expect(page).to have_content("Age: #{@comic_4.age}")
        expect(page).to have_content("City: #{@comic_4.city}")
        expect(page).to have_content("Name: #{@comic_5.name}")
        expect(page).to have_content("Age: #{@comic_5.age}")
        expect(page).to have_content("City: #{@comic_5.city}")
      end

      it "has statistics filtered by city (multiple comedians)" do
        city = "Denver, CO"
        visit "/comedians?city=#{city}"
        save_and_open_page

        within '.statistics-info' do
          expect(page).to have_content("Average age: 46.5")
          expect(page).to have_content("Average special run time: 27.5")
          expect(page).to have_content("Comedian home towns:")
          within '#home-town-list' do
            expect(page).not_to have_content("Washington, D.C.")
            expect(page).not_to have_content("Brooklyn, NY")
            expect(page).not_to have_content("Chicago, Illinois")
            expect(page).to have_content("Denver, CO")
          end
        end
      end
    end

    ##Test sorting

  end
end
