def get_sites
	$sites = Array.new
	webClient = WebClient.new(BrowserVersion::FIREFOX_3)
 	main_page = webClient.getPage("http://www.craigslist.org/about/sites")
	urls = main_page.asXml.to_s.scan(%r`(http.*craigslist.*\.(com|uk|de|it|ca|org|in|jp|kr|ph|sg|tw|th|au|mx|za))`)
	for i in 0..urls.length-1 do
		$sites[i] = urls[i][0]
	end
end

def get_for_sale_pages(num)
	webClient = WebClient.new(BrowserVersion::FIREFOX_3)
  begin
    main_page = webClient.getPage($sites[num])
  rescue java.net.UnknownHostException => e
    $stderr.print "Exception caught: #{e}n\n"
  end 
  main_div = main_page.getElementById("sss")
  h4 = main_page.getByXPath(main_div.getCanonicalXPath() + "/h4/a")
  for_sale_page = h4[0].click
	return for_sale_page
end

