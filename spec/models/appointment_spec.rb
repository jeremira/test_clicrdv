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
  it "does not disturb space continium" do
    appointment.start_at = DateTime.now
    appointment.end_at = 1.month.ago
    expect(appointment).to_not be_valid
  end
  it "require a customer name" do
    appointment.customer_name = nil
    expect(appointment).to_not be_valid
  end

end
