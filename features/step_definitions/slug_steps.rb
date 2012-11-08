Then /^my URL slug should be "(.*?)"$/ do |url|
  current_path =URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == "/posts/#{url}"
    else
      assert_equal path_to(url), current-path
  end
end

