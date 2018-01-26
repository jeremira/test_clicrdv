require 'rails_helper'

RSpec.describe Calendar, type: :model do
  let(:calendar) {build :calendar}
  let(:another_calendar) {build :calendar}

  it "has a valid factory" do
    expect(calendar).to be_valid
  end

  it "require a name" do
    calendar.name = nil
    expect(calendar).to_not be_valid
  end
  it "has an unique name" do
    calendar.save
    another_calendar.name = calendar.name
    expect(another_calendar).to_not be_valid
  end
  it "require an interval" do
    calendar.intervals = nil
    expect(calendar).to_not be_valid
  end
  it "has a interval > 0" do
    calendar.intervals = -1
    expect(calendar).to_not be_valid
  end

end
