require 'java'
require 'rubygems'
require 'htmlunit.rb'
webClient = WebClient.new(BrowserVersion::FIREFOX_3)
begin
main_page = webClient.getPage("http://aleigh.craigslist.org/")
rescue UnknownHostException
	puts "Caught error..."
end
puts main_page.asText
