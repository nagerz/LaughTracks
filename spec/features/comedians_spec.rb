RSpec.describe "comedians welcome page" do
  context "as a visitor" do
    before :each do
      @comic_1 = Comedian.create(name: "Fred", age: 48, city: "NY")
      @comic_2 = Comedian.create(name: "George", age: 37, city: "Boulder")
      @comic_3 = Comedian.create(name: "Ron", age: 26, city: "Paris")

      visit '/comedians'
    end

    it "has title" do

      within '#greeting' do

      expect(page).to have_content("Laugh Tracks")
      end
    end

    it "lists comedians with info" do
      expect(page).to have_content("Name: #{@comic_1.name}")
      expect(page).to have_content("Age: #{@comic_1.age}")
      expect(page).to have_content("City: #{@comic_1.city}")
      expect(page).to have_content("Name: #{@comic_2.name}")
      expect(page).to have_content("Age: #{@comic_2.age}")
      expect(page).to have_content("City: #{@comic_2.city}")
    end

  end
end
