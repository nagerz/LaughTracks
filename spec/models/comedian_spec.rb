RSpec.describe Comedian, type: :model do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(dob: "1967-09-17", city: "Paris")
        expect(comic).to_not be_valid
      end
      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg', city: "Paris")
        expect(comic).to_not be_valid
      end
      it 'should be invalid if missing a city' do
        comic = Comedian.create(name: 'Mitch Hedberg', dob: "1967-09-17")
        expect(comic).to_not be_valid
      end
    end
  end
end
