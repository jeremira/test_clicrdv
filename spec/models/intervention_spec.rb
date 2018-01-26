require 'rails_helper'

RSpec.describe Intervention, type: :model do
  let(:intervention) {build :intervention}

  it "has a valid factory" do
    expect(intervention).to be_valid
  end

  it "require a name" do
    intervention.name = nil
    expect(intervention).to_not be_valid
  end
  it "require a duration" do
    intervention.duration = nil
    expect(intervention).to_not be_valid
  end
  it "require a duration > 0" do
    intervention.duration = 0
    expect(intervention).to_not be_valid
    intervention.duration = 1
    expect(intervention).to be_valid
  end
  it "require a duration < 61" do
    intervention.duration = 61
    expect(intervention).to_not be_valid
    intervention.duration = 60
    expect(intervention).to be_valid
  end

end
