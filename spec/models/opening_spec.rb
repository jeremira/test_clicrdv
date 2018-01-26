require 'rails_helper'

RSpec.describe Opening, type: :model do
  let(:opening)                {build :opening}

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

  context "Records cant overlap in a same calendar" do
    before :each do
      @calendar = create :calendar
      @opening        = build :opening, calendar: @calendar
      @other_opening  = build :opening, calendar: @calendar
    end
    it "accept openings appart by 1 second" do
      @opening.start_at = DateTime.new(2012,1,1,14,00,00)
      @opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      @other_opening.start_at = DateTime.new(2012,1,1,14,20,01)
      @other_opening.end_at   = DateTime.new(2012,1,1,14,50,00)
      expect(@opening).to be_valid
      @opening.save
      expect(@other_opening).to be_valid
    end
    it "accept a opening starting just after another one" do
      @opening.start_at = DateTime.new(2012,1,1,14,00,00)
      @opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      @other_opening.start_at = DateTime.new(2012,1,1,14,20,00)
      @other_opening.end_at   = DateTime.new(2012,1,1,14,50,00)
      expect(@opening).to be_valid
      @opening.save
      expect(@other_opening).to be_valid
    end
    it "reject overlapping openings (end overlap)" do
      @opening.start_at = DateTime.new(2012,1,1,14,00,00)
      @opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      @other_opening.start_at = DateTime.new(2012,1,1,14,10,00)
      @other_opening.end_at   = DateTime.new(2012,1,1,14,50,00)
      expect(@opening).to be_valid
      @opening.save
      expect(@other_opening).to_not be_valid
    end
    it "reject overlapping openings (start overlap)" do
      @opening.start_at = DateTime.new(2012,1,1,14,00,00)
      @opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      @other_opening.start_at = DateTime.new(2012,1,1,13,30,00)
      @other_opening.end_at   = DateTime.new(2012,1,1,14,10,00)
      expect(@opening).to be_valid
      @opening.save
      expect(@other_opening).to_not be_valid
    end
  end
  context 'Record can overlap in different calendar' do
    before :each do
      @calendar  = create :calendar
      @calendar2 = create :calendar
      @opening        = build :opening, calendar: @calendar
      @other_opening  = build :opening, calendar: @calendar2
    end
    it "accept opening appart by 1 second" do
      @opening.start_at = DateTime.new(2012,1,1,14,00,00)
      @opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      @other_opening.start_at = DateTime.new(2012,1,1,14,20,01)
      @other_opening.end_at   = DateTime.new(2012,1,1,14,50,00)
      expect(@opening).to be_valid
      @opening.save
      expect(@other_opening).to be_valid
    end
    it "accept a opening starting just after another one" do
      @opening.start_at = DateTime.new(2012,1,1,14,00,00)
      @opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      @other_opening.start_at = DateTime.new(2012,1,1,14,20,00)
      @other_opening.end_at   = DateTime.new(2012,1,1,14,50,00)
      expect(@opening).to be_valid
      @opening.save
      expect(@other_opening).to be_valid
    end
    it "accept overlapping openings (end overlap)" do
      @opening.start_at = DateTime.new(2012,1,1,14,00,00)
      @opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      @other_opening.start_at = DateTime.new(2012,1,1,14,10,00)
      @other_opening.end_at   = DateTime.new(2012,1,1,14,50,00)
      expect(@opening).to be_valid
      @opening.save
      expect(@other_opening).to be_valid
    end
    it "accept overlapping openings (start overlap)" do
      @opening.start_at = DateTime.new(2012,1,1,14,00,00)
      @opening.end_at   = DateTime.new(2012,1,1,14,20,00)
      @other_opening.start_at = DateTime.new(2012,1,1,13,30,00)
      @other_opening.end_at   = DateTime.new(2012,1,1,14,10,00)
      expect(@opening).to be_valid
      @opening.save
      expect(@other_opening).to be_valid
    end
  end

end
