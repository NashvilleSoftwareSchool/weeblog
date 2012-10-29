Given /^there is a blog post$/ do
  step %{I have a post with title "blog post" and body "blog body"}
end

Given /^I have a post with title "(.*?)" and body "(.*?)"$/ do |title, body|
  @post = Post.new(title: title, body: body)
  @post.save!
end

Given /^I am viewing that blog post$/ do
  step %{I am on that blog post's page}
end

Then /^I should be viewing that blog post$/ do
  step %{I should be on that blog post's page}
end
