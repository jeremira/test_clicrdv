require 'rails_helper'

RSpec.describe Intervention, type: :model do
  let(:intervention) {build :intervention}

  it "has a valid factory" do
    expect(intervention).to be_valid
  end

end
