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
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  field_value.should == text
end

And /^I attach "(.*?)" to "(.*?)"$/ do |attached_file, locator|
  page.attach_file(locator, attached_file)
  #attach_file('Image', '/path/to/image.jpg')
end


Then /^I should see my video$/ do 
  page.has_content?('View Video')
end

Then /^I should see the image "(.*?)" in "(.*?)" the CSS$/ do |content, css|
  find('img')['src'].should == "http://www.google.com/logo.png"
end

Then /^I should see the video "(.*?)"$/ do |content|
  page.find_link(content).visible?
  #find('a')['href'].should == content find_link(locator)
end
