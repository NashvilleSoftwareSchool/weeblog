#still fairly confused with the syntax of all this, but understand that this is the guts of what cucumber is using to run its tests...i think?
Given /^I (?:click|press) "(.*?)"$/ do |link_text|
  click_link_or_button link_text
end

Then /^I should see "(.*?)"$/ do |expected_text|
  page.should have_content(expected_text)
end

Then /^I should see the title "(.*?)"$/ do |title_text|
  page.should have_css("h1, h2", text: title_text)
end

When /^I fill in "(.*?)" for "(.*?)"$/ do |text, field_label|
  page.fill_in field_label, with: text
end
