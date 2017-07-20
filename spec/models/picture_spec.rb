# == Schema Information
#
# Table name: pictures
#
#  id             :integer          not null, primary key
#  name           :string
#  imageable_id   :integer
#  imageable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  file           :string
#

require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:imageable_id) }
  it { is_expected.to have_db_column(:imageable_type) }
  it { should belong_to(:imageable) }
end
