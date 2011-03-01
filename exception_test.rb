require 'java'
require 'htmlunit.rb'
include_class 'java.lang.ClassNotFoundException'

java::lang::Class.forName("java.lang.String")
begin
java::lang::Class.forName("foo.Bar")
rescue ClassNotFoundException => e
$stderr.print "Exception caught: #{e}n\n"
 end


#now lets try some htmlunit stuff
#This will catch java.net.UnknownHostException
webClient = WebClient.new(BrowserVersion::FIREFOX_3)
begin
  main_page = webClient.getPage("http://aleigh.craigslist.org/")
rescue java.net.UnknownHostException => e
$stderr.print "Exception caught: #{e}n\n"
end


