require 'rails_helper'

RSpec.describe Calendar, type: :model do
  let(:calendar) {create :calendar}
  let(:another_calendar) {build :calendar}

  let(:rei_opening) {
    create :opening, start_at: DateTime.new(2018,11,1,8,0,0),
    end_at: DateTime.new(2018,11,1,12,0,0), calendar: calendar
  }
  let(:rei_appointment1) {
    create :appointment, start_at: DateTime.new(2018,11,1,9,0,0),
    end_at: DateTime.new(2018,11,1,9,30,0), calendar: calendar
  }
  let(:rei_appointment2) {
    create :appointment, start_at: DateTime.new(2018,11,1,10,0,0),
    end_at: DateTime.new(2018,11,1,10,40,0), calendar: calendar
  }
  let(:rei_intervention) {
    create :intervention, name: 'Massage', duration: 30, calendar: calendar
  }


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

  describe "#availabilities" do
    it "can return all his possible appointment starting time" do
      expected_availabilities = [
        "2018-01-11 08:00:00", "2018-01-11 08:10:00", "2018-01-11 08:20:00",
        "2018-01-11 08:30:00", "2018-01-11 09:30:00", "2018-01-11 10:40:00",
        "2018-01-11 10:50:00", "2018-01-11 11:00:00", "2018-01-11 11:10:00",
        "2018-01-11 11:20:00", "2018-01-11 11:30:00"
      ]
    rei_opening
    rei_appointment2
    rei_appointment1
    expect(calendar.availabilities rei_intervention).to eq expected_availabilities
    end
  end
end
