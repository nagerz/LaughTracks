#save_and_open_page

RSpec.describe "individual comedian page" do
  context "as a visitor" do
    before :each do
      @comic_1 = Comedian.create(name: "Dave Chappelle", dob: "1973-08-24", city: "Washington, D.C.")
      @comic_2 = Comedian.create(name: "Eddie Murphy", dob: "1961-04-03", city: "Brooklyn, NY")
      @comic_3 = Comedian.create(name: "Robin Williams", dob: "1951-07-21", city: "Chicago, Illinois")
      #@comedians = [@comic_1, @comic_2, @comic_3, @comic_4, @comic_5]
      @special_1 = @comic_1.specials.create(name: "Dave Chappelle: Killin' Them Softly", run_time: 57, image: "https://m.media-amazon.com/images/M/MV5BMTcyOGMxN2MtYzUwYy00YzQxLTgwZTItZjAxZTIzYWM1YzEyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_.jpg")
      @special_2 = @comic_1.specials.create(name: "Dave Chappelle: For What It's Worth", run_time: 60, image: "https://m.media-amazon.com/images/M/MV5BZGQ2MjBjNDEtYWVlNi00Nzc3LTg2NjUtYWY3ZTkwNTAwNDQyXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")
      @special_3 = @comic_2.specials.create(name: "Eddie Murphy: Raw", run_time: 93, image: "https://m.media-amazon.com/images/M/MV5BOWEwYTk4YTgtZGVjNi00MmI0LTkwOTItOWUxYzBlN2YwZWFkXkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
      @special_4 = @comic_3.specials.create(name: "Robin Williams: Off the Wall", run_time: 59, image: "https://m.media-amazon.com/images/M/MV5BYWYwNTVkMTQtNTM5Ni00ZTFmLWEyYTEtODViNDQwNDM5ZjEyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjg5NTA5Mjg@._V1_.jpg")
    end

    it "has title" do
      id = 2
      visit "/comedians/#{id}"

      within '#greeting' do

        expect(page).to have_content("Laugh Tracks")
      end
    end

    # it "has statistics title" do
    #   #visit '/comedians'
    #
    #   within '.statistics-info' do
    #     expect(page).to have_content("Comedian Statistics:")
    #   end
    # end
    #
    # it "has statistics" do
    #   avg_age = 52.4
    #   avg_length = 54.2
    #   visit '/comedians'
    #
    #   within '.statistics-info' do
    #     expect(page).to have_content("Average age: #{avg_age}")
    #     expect(page).to have_content("Average special run time: #{avg_length}min.")
    #   end
    # end

    it "lists comedians with info" do
      id = 1
      visit "/comedians/#{id}"

      within "#comedian_#{id}" do
        expect(page).to have_content("Name: #{@comic_1.name}")
        expect(page).to have_content("Age: #{@comic_1.age}")
        expect(page).to have_content("City: #{@comic_1.city}")
        expect(page).not_to have_content("Name: #{@comic_2.name}")
        expect(page).not_to have_content("Age: #{@comic_2.age}")
        expect(page).not_to have_content("City: #{@comic_2.city}")
        expect(page).not_to have_content("Name: #{@comic_3.name}")
        expect(page).not_to have_content("Age: #{@comic_3.age}")
        expect(page).not_to have_content("City: #{@comic_3.city}")

        within '#specials' do
          expect(page).to have_content("#{@special_1.name}")
          expect(page).to have_content("#{@special_1.run_time}")
          expect(page).to have_css("img[src*='#{@special_1.image}']")
          expect(page).to have_content("#{@special_2.name}")
          expect(page).to have_content("#{@special_2.run_time}")
          expect(page).to have_css("img[src*='#{@special_2.image}']")
          expect(page).not_to have_content("#{@special_3.name}")
          expect(page).not_to have_content("#{@special_3.run_time}")
          expect(page).not_to have_css("img[src*='#{@special_3.image}']")
          expect(page).not_to have_content("#{@special_4.name}")
          expect(page).not_to have_content("#{@special_4.run_time}")
          expect(page).not_to have_css("img[src*='#{@special_4.image}']")
        end
      end
    end
  end
end
