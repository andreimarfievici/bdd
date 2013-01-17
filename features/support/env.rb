require 'rubygems'
require 'watir-webdriver'
require 'rspec'
require 'watir-webdriver/wait'
require 'net/http'
require 'uri'
ENV['env'] = 'chr'
case ENV['env'].downcase
  when 'chrome', 'chr'
    browser = Watir::Browser.new :chrome
  when 'firefox', 'ff'
    browser = Watir::Browser.new :firefox
  when 'json'
    format = 'format_json'
  when 'xml'
    format = ''
  else
    p "No such env #{ENV['env']}"
end

$format = format

Before('~@api') do
  p 'Before each GUI scenario'
  $browser = browser
  $browser.driver.manage.window.maximize
  $browser.cookies.clear
end

After('@api') do
  p 'After each API scenario'
end

at_exit do
  browser.quit unless browser == nil
  p "All tests were executed"
end



