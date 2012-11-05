Given /^there is a user "(.*?)" with password "(.*?)"$/ do |email, password|
  @user = Fabricate(:user, email: email, password: password, password_confirmation: password)
end

Given /^I am signed in$/ do
  @user = Fabricate(:user)
  steps %Q{
    Given I am on the homepage
    When I click "Sign In"
    And I fill in "#{@user.email}" for "Email"
    And I fill in "password" for "Password"
    And I click "Sign in"
    Then I should see "You are now signed in."
  }
end
