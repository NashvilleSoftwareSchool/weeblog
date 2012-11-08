Given /^there is a blog post$/ do
  step %{1 blog post}
end

Given /^I am viewing that blog post$/ do
  step %{I am on that blog post's page}
end

Then /^I should be viewing that blog post$/ do
  step %{I should be on that blog post's page}
end

Given /^I have created a blog post with title "(.*?)" and body "(.*?)"$/ do |title, body|
  Fabricate(:post, author: @user, title: title, body: body)
end
