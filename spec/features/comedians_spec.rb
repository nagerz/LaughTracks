RSpec.describe "comedians welcome page" do
  context "as a visitor" do
    before :each do
      @comic_1 = Comedian.create(name: "Fred", age: 48, city: "NY")
      @comic_2 = Comedian.create(name: "George", age: 37, city: "Boulder")
      @comic_3 = Comedian.create(name: "Ron", age: 26, city: "Paris")
    end

    it "has title" do
      visit '/comedians'

      save_and_open_page
      within '#greeting' do

      expect(page).to have_content("Laugh Tracks")
      end
    end

    it "lists comedians with info" do
      visit '/comedians'

      expect(page).to have_content("Name: #{@comic_1.name}")
      expect(page).to have_content("Age: #{@comic_1.age}")
      expect(page).to have_content(@comic_2.name)
      expect(page).to have_content(@comic_3.name)
    end

  end
end
