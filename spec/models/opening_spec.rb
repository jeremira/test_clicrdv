require 'rails_helper'

RSpec.describe Opening, type: :model do
  let(:opening) {build :opening}
  let(:other_opening) {build :opening}

  it "has a valid factory" do
    expect(opening).to be_valid
  end

  it "require a start timestamp" do
    opening.start_at = nil
    expect(opening).to_not be_valid
  end
  it "require a end timestamp" do
    opening.end_at = nil
    expect(opening).to_not be_valid
  end
  it "does not disturb space continium" do
    opening.start_at = DateTime.now
    opening.end_at = 1.month.ago
    expect(opening).to_not be_valid
  end

  context "Records cant overlap" do
    it "accept records appart by 1 second" do
      opening.start_at = DateTime.new(2012,1,1,14,00,00)
      opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      other_opening.start_at = DateTime.new(2012,1,1,14,20,01)
      other_opening.end_at   = DateTime.new(2012,1,1,14,50,00)
      expect(opening).to be_valid
      opening.save
      expect(other_opening).to be_valid
    end
    it "accept a record starting just after another one" do
      opening.start_at = DateTime.new(2012,1,1,14,00,00)
      opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      other_opening.start_at = DateTime.new(2012,1,1,14,20,00)
      other_opening.end_at   = DateTime.new(2012,1,1,14,50,00)
      expect(opening).to be_valid
      opening.save
      expect(other_opening).to be_valid
    end
    it "reject overlapping records" do
      opening.start_at = DateTime.new(2012,1,1,14,00,00)
      opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      other_opening.start_at = DateTime.new(2012,1,1,14,10,00)
      other_opening.end_at   = DateTime.new(2012,1,1,14,50,00)
      expect(opening).to be_valid
      opening.save
      expect(other_opening).to_not be_valid
    end
  end

end
