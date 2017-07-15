require "rails_helper"

RSpec.describe Song::CreatPolicy do
  let(:policy) { described_class.new(song) }
  let(:user)   { FactoryGirl.create(:user) }

end
