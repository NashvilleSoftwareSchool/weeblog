Given /^I (?:click|press) "(.*?)"$/ do |link_text|
  click_link_or_button link_text
end

Then /^I should see "(.*?)"$/ do |expected_text|
  page.should have_content(expected_text)
end

Then /^I should not see "(.*?)"$/ do |expected_text|
  page.should_not have_content(expected_text)
end

Then /^I should see the title "(.*?)"$/ do |title_text|
  page.should have_css("h1, h2", text: title_text)
end

When /^I fill in "(.*?)" for "(.*?)"$/ do |text, field_label|
  page.fill_in field_label, with: text
end

Then /^the "(.*?)" field should contain "(.*?)"$/ do |field_name, text|
  step %{I should see "#{text}" in the "#{field_name}" field}
end

Then /^I should see "(.*?)" in the "(.*?)" field$/ do |text, field_name|
  field = find_field(field_name)
  # Rails adds a line break to beginning of textarea tags
  # https://github.com/rails/rails/issues/393
  # Capybara does not remove the line break
  # https://github.com/jnicklas/capybara/issues/677
  # We are fixing it locally by removing the first character
  field_value = (field.tag_name == 'textarea') ? field.text[1..-1] || "" : field.value
  field_value.should == text
end
