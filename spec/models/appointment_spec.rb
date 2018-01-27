require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:appointment) {build :appointment}

  it "has a valid factory" do
    expect(appointment).to be_valid
  end
  it "require a start timestamp" do
    appointment.start_at = nil
    expect(appointment).to_not be_valid
  end
  it "require an end timestamp" do
    appointment.end_at = nil
    expect(appointment).to_not be_valid
  end
  it "cant end before to start" do
    appointment.start_at = DateTime.new(2012,01,01,14,00,00)
    appointment.end_at = DateTime.new(2012,01,01,13,00,00)
    expect(appointment).to_not be_valid
  end
  it "has to be on the same day" do
    appointment.start_at = DateTime.new(2012,01,01,14,00,00)
    appointment.end_at = DateTime.new(2012,01,02,15,00,00)
    expect(appointment).to_not be_valid
    appointment.start_at = DateTime.new(2012,01,02,14,00,00)
    appointment.end_at = DateTime.new(2012,01,01,15,00,00)
    expect(appointment).to_not be_valid
  end
  it "require a customer name" do
    appointment.customer_name = nil
    expect(appointment).to_not be_valid
  end

end
