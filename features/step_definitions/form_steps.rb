Given /^I have forms titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Form.create!(:name => title, :creator_id => 1)
  end
end

Given /^I have a form titled (.+)$/ do |title|
  Form.create!(:name => title, :creator_id => 1)
end

Given /^I open the form titled (.+)$/ do |title|
  visit form_path(Form.first(:name => title, :creator_id => 1))
end