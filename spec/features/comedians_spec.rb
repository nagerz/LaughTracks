RSpec.describe "comedians welcome page" do
  context "as a visitor" do
    before :each do
      @comic_1 = Comedian.create(name: "Dave Chappelle", dob: "1973-08-24", city: "Washington, D.C.")
      @comic_2 = Comedian.create(name: "Eddie Murphy", dob: "1961-04-03", city: "Brooklyn, NY")
      @comic_3 = Comedian.create(name: "Robin Williams", dob: "1951-07-21", city: "Chicago, Illinois")
      @comedians = [@comic_1, @comic_2, @comic_3]
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
      visit '/comedians'

      within '.statistics-info' do
        expect(page).to have_content("Average age: #{56}")
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

    ##Test sorting

  end
end
