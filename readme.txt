See http://htmlunit.blogspot.com/
http://blog.stevenlevithan.com/archives/validate-phone-number#r4-2
Good regex tester for ruby @ http://www.rubyxp.com/
For DBI be sure and install libmysqlclientxx-dev package and dbd-mysql gem

java/net/AbstractPlainSocketImpl.java:158:in `connect': java.net.UnknownHostException: siskiyou.craigslist.org (NativeException)
	from java/net/SocksSocketImpl.java:384:in `connect'
	from java/net/Socket.java:546:in `connect'
	from com/gargoylesoftware/htmlunit/SocksSocketFactory.java:88:in `connectSocket'
	from org/apache/http/impl/conn/DefaultClientConnectionOperator.java:123:in `openConnection'
	from org/apache/http/impl/conn/AbstractPoolEntry.java:147:in `open'
	from org/apache/http/impl/conn/AbstractPooledConnAdapter.java:108:in `open'
	from org/apache/http/impl/client/DefaultRequestDirector.java:415:in `execute'
	from org/apache/http/impl/client/AbstractHttpClient.java:641:in `execute'
	from org/apache/http/impl/client/AbstractHttpClient.java:597:in `execute'
	from com/gargoylesoftware/htmlunit/HttpWebConnection.java:133:in `getResponse'
	from com/gargoylesoftware/htmlunit/WebClient.java:1405:in `loadWebResponseFromWebConnection'
	from com/gargoylesoftware/htmlunit/WebClient.java:1324:in `loadWebResponse'
	from com/gargoylesoftware/htmlunit/WebClient.java:303:in `getPage'
	from com/gargoylesoftware/htmlunit/WebClient.java:369:in `getPage'
	from com/gargoylesoftware/htmlunit/WebClient.java:354:in `getPage'
	from clist.rb:19:in `(root)'

com/gargoylesoftware/htmlunit/html/HTMLParser.java:654:in `handleCharacters': java.lang.NullPointerException: null (NativeException)
	from com/gargoylesoftware/htmlunit/html/HTMLParser.java:446:in `startElement'
	from org.apache.xerces.parsers.AbstractSAXParser:-1:in `startElement'
	from org/cyberneko/html/HTMLTagBalancer.java:1130:in `callStartElement'
	from org/cyberneko/html/HTMLTagBalancer.java:738:in `startElement'
	from org/cyberneko/html/filters/DefaultFilter.java:136:in `startElement'
	from org/cyberneko/html/filters/NamespaceBinder.java:278:in `startElement'
	from org/cyberneko/html/HTMLScanner.java:2633:in `scanStartElement'
	from org/cyberneko/html/HTMLScanner.java:2008:in `scan'
	from org/cyberneko/html/HTMLScanner.java:895:in `scanDocument'
	from org/cyberneko/html/HTMLConfiguration.java:499:in `parse'
	from org/cyberneko/html/HTMLConfiguration.java:452:in `parse'
	from org.apache.xerces.parsers.XMLParser:-1:in `parse'
	from com/gargoylesoftware/htmlunit/html/HTMLParser.java:765:in `parse'
	from com/gargoylesoftware/htmlunit/html/HTMLParser.java:211:in `parse'
	from com/gargoylesoftware/htmlunit/html/HTMLParser.java:165:in `parseHtml'
	from com/gargoylesoftware/htmlunit/DefaultPageCreator.java:225:in `createHtmlPage'
	from com/gargoylesoftware/htmlunit/DefaultPageCreator.java:108:in `createPage'
	from com/gargoylesoftware/htmlunit/WebClient.java:429:in `loadWebResponseInto'
	from com/gargoylesoftware/htmlunit/WebClient.java:2127:in `loadDownloadedResponses'
	from com/gargoylesoftware/htmlunit/javascript/JavaScriptEngine.java:627:in `doProcessPostponedActions'
	from com/gargoylesoftware/htmlunit/javascript/JavaScriptEngine.java:705:in `processPostponedActions'
	from com/gargoylesoftware/htmlunit/html/HtmlElement.java:1265:in `click'
	from com/gargoylesoftware/htmlunit/html/HtmlElement.java:1214:in `click'
	from com/gargoylesoftware/htmlunit/html/HtmlElement.java:1177:in `click'
	from clist.rb:28:in `(root)'

Processed 41405 posts.
clist.rb:49:in `__file__': undefined method `asText' for 80:Fixnum (NoMethodError)

