Given /^I navigate to (.*)$/   do |url|
  $browser.goto url
end

When /^I search for (.*)$/ do |search_string|
  @search_string = search_string
  $browser.text_field(:id, 'siteSearchBox').set search_string
  $browser.ul(:class, 'autocomplete-group autocomplete-group--more').wait_until_present
  $browser.button(:id, 'siteSearchSubmit').click
end

Then /^I get results back$/ do
  $browser.p(:class, 'stats').wait_until_present
  $browser.p(:class, 'stats').should_not == nil
end

When /^I filter for (.*)$/ do |filter|
  @filter = filter
  $browser.a(:text, "#{filter}").click
end

Then /^I get filtered results back$/ do
  case @filter
    when 'Albums', 'Tags', 'Tracks', 'Labels'
    $browser.span(:class, 'h2Wrapper').text.should include "#{@filter[0..@filter.size-2]} results for \u201C#{@search_string}\u201D"
    else
    $browser.span(:class, 'h2Wrapper').text.should include "#{@filter[0..@filter.size-2]} results for your search \u201C#{@search_string}\u201D"
  end
end
Then /^footer should be equal to:$/ do |table|
  # table is a |About us     |  |Sign up    |  |Download Desktop App |  |Help & Support|  |Free Music Downloads|pending
  p table.hashes.each do |h|
    p h
  end
end