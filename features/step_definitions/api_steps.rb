Given /^that I am connected to the Last.fm API$/ do
  @request = Rest.new
  @request.base_domain = 'http://ws.audioscrobbler.com/2.0/'
end

When /^I request (.*) (.*)$/ do |verb, endpoint|
  @response = @request.make_http_request(verb, endpoint)
  p @request.uri
end

Then /^the response status code should be (.*) (.*)$/ do |code, msg|
  @response.code.should == code
  @response.msg.should == msg
end
When /^I get back results$/ do
  @response.body.should_not == nil
end