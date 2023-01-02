require 'rails_helper'

RSpec.describe ActorMovie do
  describe 'associations' do
    it {should belong_to(:actor)}
    it {should belong_to(:movie)}
  end
end