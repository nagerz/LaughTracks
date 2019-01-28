RSpec.describe Special, type: :model do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        special = Special.create(run_time: 345, image: "image_location")
        expect(special).to_not be_valid
      end
      it 'should be invalid if missing a run time' do
        special = Special.create(name: "special_1", image: "image_location")
        expect(special).to_not be_valid
      end
      it 'should be invalid if missing an image' do
        special = Special.create(name: "special_1", run_time: 345)
        expect(special).to_not be_valid
      end
    end
  end
end
