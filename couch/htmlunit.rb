require 'java'

#HTMLUnit 2.8 jar files
require 'lib/apache-mime4j-0.6.jar'
require 'lib/commons-codec-1.4.jar'
require 'lib/commons-collections-3.2.1.jar'
require 'lib/commons-io-1.4.jar'
require 'lib/commons-lang-2.4.jar'
require 'lib/commons-logging-1.1.1.jar'
require 'lib/cssparser-0.9.5.jar'
require 'lib/htmlunit-2.8.jar'
require 'lib/htmlunit-core-js-2.8.jar'
require 'lib/httpclient-4.0.1.jar'
require 'lib/httpcore-4.0.1.jar'
require 'lib/httpmime-4.0.1.jar'
require 'lib/nekohtml-1.9.14.jar'
require 'lib/sac-1.3.jar'
require 'lib/serializer-2.7.1.jar'
require 'lib/xalan-2.7.1.jar'
require 'lib/xercesImpl-2.9.1.jar'
require 'lib/xml-apis-1.3.04.jar'

#Turn off Apache logging
require 'commons-logging-1.1.1/commons-logging-1.1.1.jar'
include_class 'org.apache.commons.logging.LogFactory'
LogFactory.getFactory().setAttribute("org.apache.commons.logging.Log", "org.apache.commons.logging.impl.NoOpLog") 

#Web Client Class
include_class 'com.gargoylesoftware.htmlunit.WebClient'
include_class 'com.gargoylesoftware.htmlunit.BrowserVersion'
include_class 'com.gargoylesoftware.htmlunit.SilentCssErrorHandler'

#turn off warnings
[ 'com.gargoylesoftware.htmlunit',
  'com.gargoylesoftware.htmlunit.html',
  'com.gargoylesoftware.htmlunit.javascript',
  'org.apache.commons.httpclient'
].each { |package| java.util.logging.Logger.getLogger(package).level = java.util.logging.Level::OFF }
