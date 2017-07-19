# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require "rails_helper"

RSpec.describe Admin, type: :model do
  let(:admin) { build(:admin) }

  context "validate admin" do
    it "email" do
      admin.email = "admin@example.com"
      expect(admin.email).to eq("admin@example.com")
    end

    it "not email" do
      admin.email = " "
      expect(admin.email).to_not eq("admin@example.com")
    end

    it "password" do
      admin.encrypted_password = "password"
      expect(admin.encrypted_password).to eq("password")
    end

    it "not password" do
      admin.encrypted_password = " "
      expect(admin.encrypted_password).to_not eq("password")
    end
  end
end
