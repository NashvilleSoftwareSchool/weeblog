Given /^there is a blog post$/ do
  step %{1 blog post}
end

Given /^I am viewing that blog post$/ do
  step %{I am on that blog post's page}
end

Then /^I should be viewing that blog post$/ do
  step %{I should be on that blog post's page}
end
