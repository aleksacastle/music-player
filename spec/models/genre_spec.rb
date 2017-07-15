# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Genre, type: :model do
  context "has_and_belongs_to_many" do
    it { should have_and_belong_to_many(:songs) }
  end
end
