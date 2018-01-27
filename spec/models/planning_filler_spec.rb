require 'rails_helper'

RSpec.describe PlanningFiller do

  let(:opening1) {
    create :opening, start_at: DateTime.new(2020,12,1,10,0,0), end_at: DateTime.new(2020,12,1,11,0,0)
  }
  let(:opening2) {
    create :opening, start_at: DateTime.new(2020,12,1,14,0,0), end_at: DateTime.new(2020,12,1,14,50,0)
  }
  let(:opening3) {
    create :opening, start_at: DateTime.new(2020,12,1,10,0,0), end_at: DateTime.new(2020,12,1,16,0,0)
  }
  let(:opening4) {
    create :opening, start_at: DateTime.new(2020,12,1,18,0,0), end_at: DateTime.new(2020,12,1,20,0,0)
  }
  let(:rei_opening) {
    create :opening, start_at: DateTime.new(2018,11,1,8,0,0), end_at: DateTime.new(2018,11,1,12,0,0)
  }

  let(:appointment1) {
    create :appointment, start_at: DateTime.new(2020,12,1,10,30,0), end_at: DateTime.new(2020,12,1,10,40,0)
  }
  let(:appointment2) {
    create :appointment, start_at: DateTime.new(2020,12,1,14,20,0), end_at: DateTime.new(2020,12,1,14,30,0)
  }
  let(:appointment3) {
    create :appointment, start_at: DateTime.new(2020,12,1,10,50,0), end_at: DateTime.new(2020,12,1,12,20,0)
  }
  let(:appointment4) {
    create :appointment, start_at: DateTime.new(2020,12,1,18,0,0), end_at: DateTime.new(2020,12,1,19,20,0)
  }
  let(:rei_appointment1) {
    create :appointment, start_at: DateTime.new(2018,11,1,9,0,0), end_at: DateTime.new(2018,11,1,9,30,0)
  }
  let(:rei_appointment2) {
    create :appointment, start_at: DateTime.new(2018,11,1,10,0,0), end_at: DateTime.new(2018,11,1,10,40,0)
  }


  it "can be initialize without arguments" do
    planning = PlanningFiller.new
    expect(planning).to be_kind_of PlanningFiller
    expect(planning.openings).to eq []
    expect(planning.appointments).to eq []
    expect(planning.interval).to eq 10
    expect(planning.duration).to eq 0
    expect(planning.green_spots).to eq []
    expect(planning.slot).to eq({start_at: nil, end_at: nil})
  end

  context "Initialisation" do
    it "setup openings" do
      params = { openings: [opening1, opening2, opening3] }
      planning = PlanningFiller.new(params)
      expect(planning.openings).to eq [opening1, opening2, opening3]
    end
    it "setup appointments" do
      params = { appointments: [appointment1, appointment2, appointment3] }
      planning = PlanningFiller.new(params)
      expect(planning.appointments).to eq [appointment1, appointment2, appointment3]
    end
    it "setup interval" do
      params = { interval: 20 }
      planning = PlanningFiller.new(params)
      expect(planning.interval).to eq 20
    end
    it "setup break_time" do
      params = { duration: 45 }
      planning = PlanningFiller.new(params)
      expect(planning.duration).to eq 45
    end
  end

  context "1 opening 0 appointment" do
    it "find all free slots" do
      params = { openings: [opening1], interval: 10, duration: 30 }
      expected_planning_output = [
        {start_at: DateTime.new(2020,12,1,10,0,0), end_at: DateTime.new(2020,12,1,10,30,0) },
        {start_at: DateTime.new(2020,12,1,10,10,0), end_at: DateTime.new(2020,12,1,10,40,0) },
        {start_at: DateTime.new(2020,12,1,10,20,0), end_at: DateTime.new(2020,12,1,10,50,0) },
        {start_at: DateTime.new(2020,12,1,10,30,0), end_at: DateTime.new(2020,12,1,11,0,0) }
      ]
      planning = PlanningFiller.new(params)
      expect(planning.green_spots).to eq expected_planning_output
    end
  end
  context "1 opening 1 appointment" do
    it "find all free slots" do
      params = { openings: [opening1], appointment: [appointment1], interval: 5, duration: 20 }
      expected_planning_output = [
        {start_at: DateTime.new(2020,12,1,10,0,0), end_at: DateTime.new(2020,12,1,10,20,0) },
        {start_at: DateTime.new(2020,12,1,10,5,0), end_at: DateTime.new(2020,12,1,10,25,0) },
        {start_at: DateTime.new(2020,12,1,10,10,0), end_at: DateTime.new(2020,12,1,10,30,0) },
        {start_at: DateTime.new(2020,12,1,10,40,0), end_at: DateTime.new(2020,12,1,11,0,0) }
      ]
      planning = PlanningFiller.new(params)
      expect(planning.green_spots).to eq expected_planning_output
    end
  end
  context "0 opening 1 appointment" do
    it "find all free slots" do
      params = { openings: [], appointment: [appointment1], interval: 15, duration: 10 }
      expected_planning_output = []
      planning = PlanningFiller.new(params)
      expect(planning.green_spots).to eq expected_planning_output
    end
  end
  context "0 opening 0 appointment" do
    it "find all free slots" do
      params = { openings: [], appointment: [], interval: 1, duration: 5 }
      expected_planning_output = []
      planning = PlanningFiller.new(params)
      expect(planning.green_spots).to eq expected_planning_output
    end
  end
  context "many openings 1 appointment" do
    it "find all free slots" do
      params = { openings: [opening1, opening2], appointment: [appointment2], interval: 10, duration: 20 }
      expected_planning_output = [
        {start_at: DateTime.new(2020,12,1,10,0,0), end_at: DateTime.new(2020,12,1,10,20,0) },
        {start_at: DateTime.new(2020,12,1,10,10,0), end_at: DateTime.new(2020,12,1,10,30,0) },
        {start_at: DateTime.new(2020,12,1,10,20,0), end_at: DateTime.new(2020,12,1,10,40,0) },
        {start_at: DateTime.new(2020,12,1,10,30,0), end_at: DateTime.new(2020,12,1,10,50,0) },
        {start_at: DateTime.new(2020,12,1,10,40,0), end_at: DateTime.new(2020,12,1,11,0,0) },
        {start_at: DateTime.new(2020,12,1,14,0,0), end_at: DateTime.new(2020,12,1,14,20,0) },
        {start_at: DateTime.new(2020,12,1,14,30,0), end_at: DateTime.new(2020,12,1,14,50,0) }
      ]
      planning = PlanningFiller.new(params)
      expect(planning.green_spots).to eq expected_planning_output
    end
  end
  context "1 opening many appointments" do
    it "find all free slots" do
      params = { openings: [opening3], appointment: [appointment1, appointment2, appointment3],
                 interval: 20, duration: 30 }
      expected_planning_output = [
        {start_at: DateTime.new(2020,12,1,10,0,0), end_at: DateTime.new(2020,12,1,10,30,0) },
        {start_at: DateTime.new(2020,12,1,12,20,0), end_at: DateTime.new(2020,12,1,12,50,0) },
        {start_at: DateTime.new(2020,12,1,12,40,0), end_at: DateTime.new(2020,12,1,13,10,0) },
        {start_at: DateTime.new(2020,12,1,13,0,0), end_at: DateTime.new(2020,12,1,13,30,0) },
        {start_at: DateTime.new(2020,12,1,13,20,0), end_at: DateTime.new(2020,12,1,13,50,0) },
        {start_at: DateTime.new(2020,12,1,13,40,0), end_at: DateTime.new(2020,12,1,14,10,0) },
        {start_at: DateTime.new(2020,12,1,14,30,0), end_at: DateTime.new(2020,12,1,15,0,0) },
        {start_at: DateTime.new(2020,12,1,15,0,0), end_at: DateTime.new(2020,12,1,15,30,0) },
        {start_at: DateTime.new(2020,12,1,15,20,0), end_at: DateTime.new(2020,12,1,15,50,0) }
      ]
      planning = PlanningFiller.new(params)
      expect(planning.green_spots).to eq expected_planning_output
    end
  end
  context "many openings many appointments" do
    it "find all free slots" do
      params = { openings: [opening1, opening2, opening4],
                 appointment: [appointment1, appointment2, appointment3, appointment4],
                 interval: 30, duration: 30 }
      expected_planning_output = [
        {start_at: DateTime.new(2020,12,1,10,0,0), end_at: DateTime.new(2020,12,1,10,30,0) },
        {start_at: DateTime.new(2020,12,1,19,20,0), end_at: DateTime.new(2020,12,1,19,50,0) }
      ]
      planning = PlanningFiller.new(params)
      expect(planning.green_spots).to eq expected_planning_output
    end
  end
  context "readme example context" do
    it "find all free slots" do
      params = { openings: [rei_opening],
                 appointment: [rei_appointment1, rei_appointment2],
                 interval: 10, duration: 30 }
      expected_planning_output = [
        {start_at: DateTime.new(2018,11,1,8,0,0), end_at: DateTime.new(2018,11,1,8,30,0) },
        {start_at: DateTime.new(2018,11,1,8,10,0), end_at: DateTime.new(2018,11,1,8,40,0) },
        {start_at: DateTime.new(2018,11,1,8,20,0), end_at: DateTime.new(2018,11,1,9,0,0) },
        {start_at: DateTime.new(2018,11,1,10,40,0), end_at: DateTime.new(2018,11,1,11,10,0) },
        {start_at: DateTime.new(2018,11,1,10,50,0), end_at: DateTime.new(2018,11,1,11,20,0) },
        {start_at: DateTime.new(2018,11,1,11,0,0), end_at: DateTime.new(2018,11,1,11,30,0) },
        {start_at: DateTime.new(2018,11,1,11,10,0), end_at: DateTime.new(2018,11,1,11,20,0) },
        {start_at: DateTime.new(2018,11,1,11,30,0), end_at: DateTime.new(2018,11,1,12,0,0) }
      ]
      planning = PlanningFiller.new(params)
      expect(planning.green_spots).to eq expected_planning_output
    end
  end

end
