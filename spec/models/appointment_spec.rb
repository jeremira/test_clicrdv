require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:appointment) {build :appointment}
  
  it "has a valid factory" do
    expect(appointment).to be_valid
  end

end
