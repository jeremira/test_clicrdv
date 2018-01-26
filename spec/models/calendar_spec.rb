require 'rails_helper'

RSpec.describe Calendar, type: :model do
  let(:calendar) {build :calendar}

  it "has a valid factory" do
    expect(calendar).to be_valid
  end

end
