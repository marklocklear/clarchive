#Author J. Mark Locklear
require 'java'
require 'rubygems'
require 'date'
require 'htmlunit.rb'

	webClient = WebClient.new(BrowserVersion::FIREFOX_3)
 	main_page = webClient.getPage("http://hat.craigslist.org/")
 	main_div = main_page.getElementById("sss")
 	h4 = main_page.getByXPath(main_div.getCanonicalXPath() + "/h4/a")
 	for_sale_page = h4[0].click
 	i=1
 	while i < 99 and for_sale_page.getByXPath("html/body/blockquote[2]/p[#{i}]/a")[0] != nil
    post = for_sale_page.getByXPath("html/body/blockquote[2]/p[#{i}]/a")
		puts post[0].asXml
		if post[0] and post[0] != nil
			begin
    		click_post = post[0].click
			rescue java.lang.RuntimeException => e
				$stderr.print "Exception caught: #{e}n\n"
			rescue java.lang.NullPointerException => e
        $stderr.print "Exception caught: #{e}n\n"
			end
    	title = click_post.getByXPath("html/body/h2")
    	category = click_post.getByXPath("html/body/div[1]/a[4]")
    	post_body = click_post.getElementById("userbody")
    	html_body = click_post.getByXPath("html/body")
		end
		if title[0] and title[0] != nil
			title = title[0].asText
		else
			title = 'Error setting title'
		end
		if post_body
			phone = post_body.asText.scan(%r'\(?([0-9]{3})\)?[-.\/ ]?([0-9]{3})[-.\/ ]?([0-9]{4})')
			url = post_body.asText.scan(/((www|http|https?:\/\/)+((?:[-a-z0-9]+\.)+[a-z]{2,}))/)
		end
		if html_body[0]
    	date = html_body[0].asText.partition("Date:")[2][0..19]
		end

    post_id = html_body[0].asText.partition("PostingID")[2][0..12] #see above
    location_first_attempt = click_post.getByXPath("html/body/div[4]/ul/li[1]")
    location_second_attempt = click_post.getByXPath("html/body/ul[1]/li[1]")
		if location_first_attempt[0]
			location = location_first_attempt[0].asText.gsub('Location: ', ' ') #Why the gsub???
		else
			#location = location_second_attempt[0].asText.gsub('Location: ', ' ')
			location = "Location not found"
		end
    puts "Date is =>" + date
		puts "Post id is =>" + post_id
		if category[0]
			puts "Category is =>" + category[0].asText
		end
		puts "Location is=>" + location
		puts "Tile is =>" + title
		puts "Phone is =>" + phone.inspect
		puts "URL is =>" + url.inspect
		if post_body
			puts "Post is=>" + post_body.asText.gsub(/\n/,'')
		end
		puts "*************************************************"
		puts "*************************************************"
		puts "*************************************************"
		puts "*************************************************"
   	#puts html_body[0].asText
    #puts post_body.asText #gets body
    i+=1
  end
