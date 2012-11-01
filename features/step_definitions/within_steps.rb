require 'uri'
require 'cgi'

def selector_for(description)
  case description
  when "the results section"
    'section.results'
  when /(.*)'s comment/
      comment = Comment.find_by_commenter($1)
      ".comment_#{comment.id}"
  else
    description.gsub('"','')
  end
end

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Single-line step scoper
When /^(.*) within ([^:]*)$/ do |stepdescription, parent|
  if parent == "the iframe"
    page.driver.within_frame(page.find("iframe")["id"]) { step stepdescription }
  else
    with_scope(parent) { step stepdescription }
  end
end

# Multi-line step scoper
When /^(.*) within (.*[^:]):$/ do |stepdescription, parent, table_or_string|
  if parent == "the iframe"
    page.driver.within_frame(page.find("iframe")["id"]) { step "#{stepdescription}:", table_or_string }
  else
    with_scope(parent) { step "#{stepdescription}:", table_or_string }
  end
end

