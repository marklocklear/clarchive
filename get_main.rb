#Author J. Mark Locklear
require 'java'
require 'rubygems'
require 'htmlunit.rb'

#	LogFactory.getFactory().setAttribute("org.apache.commons.logging.Log", "org.apache.commons.logging.impl.NoOpLog"); 
	webClient = WebClient.new(BrowserVersion::FIREFOX_3)
 	main_page = webClient.getPage("http://www.craigslist.org/about/sites")
	#urls = main_page.asXml.to_s.scan(/[a-zA-Z0-9\-\.]+\.(com|org|net|mil|edu|COM|ORG|NET|MIL|EDU)/)
	urls = main_page.asXml.to_s.scan(%r`((http|https?:\/\/)+((?:[-a-z0-9]+\.)+[a-z]{2,}))`)
 	puts urls.inspect
