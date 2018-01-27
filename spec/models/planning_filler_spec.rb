require 'rails_helper'

RSpec.describe PlanningFiller do

  let(:opening1) {
    create :opening, start_at: DateTime.new(2020,12,01,10,00,00), end_at: DateTime.new(2020,12,01,13,00,00)
  }
  let(:opening2) {
    create :opening, start_at: DateTime.new(2020,12,01,10,00,00), end_at: DateTime.new(2020,12,01,13,00,00)
  }
  let(:opening3) {
    create :opening, start_at: DateTime.new(2020,12,05,10,00,00), end_at: DateTime.new(2020,12,05,15,00,00)
  }
  let(:opening4) {
    create :opening, start_at: DateTime.new(2020,12,06,10,00,00), end_at: DateTime.new(2020,12,06,11,00,00)
  }

  let(:appointment1) {
    create :appointment, start_at: DateTime.new(2020,12,01,15,00,00), end_at: DateTime.new(2020,12,01,16,00,00)
  }
  let(:appointment2) {
    create :appointment, start_at: DateTime.new(2020,12,05,10,00,00), end_at: DateTime.new(2020,12,05,10,30,00)
  }
  let(:appointment3) {
    create :appointment, start_at: DateTime.new(2020,12,10,10,00,00), end_at: DateTime.new(2020,12,10,10,30,00)
  }


  it "can be initialize without arguments" do
    planning = PlanningFiller.new
    expect(planning).to be_kind_of PlanningFiller
    expect(planning.openings).to eq []
    expect(planning.appointments).to eq []
    expect(planning.break_time).to eq 0
    expect(planning.duration).to eq 0
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
    it "setup break_time" do
      params = { break_time: 15 }
      planning = PlanningFiller.new(params)
      expect(planning.break_time).to eq 15
    end
    it "setup break_time" do
      params = { duration: 45 }
      planning = PlanningFiller.new(params)
      expect(planning.duration).to eq 45
    end

  end


end
