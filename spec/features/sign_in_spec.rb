require "rails_helper"

feature "Sign in", :devise do
  scenario "user cannot sign in without registration" do
    signin("1@example.com", "password")
    expect(page).to have_content "Invalid Email or password"
  end

  let(:user) { FactoryGirl.create(:user) }

  scenario "user can sign in with valid credentials" do
    signin(user.email, user.password)
    expect(page).to have_content "Signed in successfully"
  end

  scenario "user cannot sign in with invalid email" do
    signin("invalid@email.com", user.password)
    expect(page).to have_content "Invalid Email or password"
  end

  scenario "user cannot sign in with invalid password" do
    signin(user.email, "password")
    expect(page).to have_content "Invalid Email or password"
  end
end
