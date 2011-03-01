#Author J. Mark Locklear
require 'java'
require 'rubygems'
require 'htmlunit.rb'
	sites = Array.new
	webClient = WebClient.new(BrowserVersion::FIREFOX_3)
 	main_page = webClient.getPage("http://www.google.com/#sclient=psy&hl=en&q=michael+jackson&aq=0s&aqi=g-s2g1g-s1g-o1&aql=f&oq=&pbx=1&bav=on.1,or.&fp=18e4c0cc530c3619")
	webClient.waitForBackgroundJavaScript(10000);
  webClient.waitForBackgroundJavaScriptStartingBefore(10000);
	urls = main_page.asText
	puts urls
