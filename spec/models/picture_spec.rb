require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to have_db_column(:imageable_id) }
  it { is_expected.to have_db_column(:imageable_type) }
  it { should belong_to(:imageable) }
end
