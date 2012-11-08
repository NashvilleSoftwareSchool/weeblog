When /^I sign out$/ do
  step %{I click "Sign Out"}
end

Given /^there is a user "(.*?)" with password "(.*?)"$/ do |email, password|
  @user = Fabricate(:user, email: email, password: password, password_confirmation: password)
end

Given /^I am signed in as "(.*?)"$/ do |email|
  @user = Fabricate(:user, email: email)
  sign_in_as @user
end

Given /^I am signed in$/ do
  @user = Fabricate(:user)
  sign_in_as @user
end

Given /^I am not signed in$/ do
  @user = nil
end

Given "I am signed in as a user that did not write the post" do
  post = Post.last
  @user = User.where("id != ?", post.author_id).first || Fabricate(:user)
  sign_in_as @user
end

def sign_in_as user
  steps %Q{
    Given I am on the homepage
    When I click "Sign In"
    And I fill in "#{user.email}" for "Email"
    And I fill in "password" for "Password"
    And I click "Sign in"
    Then I should see "You are now signed in."
  }
end
