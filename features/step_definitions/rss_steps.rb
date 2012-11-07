# Then /^I should see "(.*?)"$/ do |expected_text|
#   page.should have_content(expected_text)
# end

Then /^I should see all rss feeds$/ do
# save_and_open_page
  page.should have_content("Your Blog Title")
end
