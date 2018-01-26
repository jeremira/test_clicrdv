require 'rails_helper'

RSpec.describe Opening, type: :model do
  let(:opening) {build :opening}

  it "has a valid factory" do
    expect(opening).to be_valid
  end

end
