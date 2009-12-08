When /^I confirm$/ do
  
end

Then /^(?:|I )should see "([^\"]*)" within "([^\"]*)"$/ do |text, selector|
  response_body.should have_tag(selector, /#{Regexp.escape(text)}/)
end