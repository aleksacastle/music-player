# == Schema Information
#
# Table name: users
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
#  role                   :integer
#  avatar                 :string
#  first_name             :string
#  last_name              :string
#  nick_name              :string
#  provider               :string
#  uid                    :string
#

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password(8)
    role 0
    first_name "TestFirstName"
    last_name "TestLastName"
  end
end
