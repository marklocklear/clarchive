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
[jlocklear@jlocklear clarchive]$ 

