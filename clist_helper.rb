def get_sites
	$sites = Array.new
	webClient = WebClient.new(BrowserVersion::FIREFOX_3)
 	main_page = webClient.getPage("http://www.craigslist.org/about/sites")
	urls = main_page.asXml.to_s.scan(%r`(http.*craigslist.*\.(com|uk|de|it|ca|org|in|jp|kr|ph|sg|tw|th|au|mx|za))`)
	for i in 0..urls.length-1 do
		$sites[i] = urls[i][0]
	end
end

