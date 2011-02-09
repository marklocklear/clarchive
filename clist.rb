#Author J. Mark Locklear
require 'java'
require 'rubygems'
require 'htmlunit.rb'

	webClient = WebClient.new(BrowserVersion::FIREFOX_3)
 	main_page = webClient.getPage("http://raleigh.craigslist.org/")
 	#main_page = webClient.getPage("http://kolkata.craigslist.co.in")
 	main_div = main_page.getElementById("sss")
 	h4 = main_page.getByXPath(main_div.getCanonicalXPath() + "/h4/a")
 	for_sale_page = h4[0].click
 	i=1
 	while i < 99
    post = for_sale_page.getByXPath("html/body/blockquote[2]/p[#{i}]/a")
		if post[0]
    	click_post = post[0].click
    	title = click_post.getByXPath("html/body/h2")
    	post_body = click_post.getElementById("userbody")
    	html_body = click_post.getByXPath("html/body")
		end

		#str.partition(sep) → [head, sep, tail]
		title = title[0].asText
		if post_body
			phone = post_body.asText.scan(%r'\(?([0-9]{3})\)?[-.\/ ]?([0-9]{3})[-.\/ ]?([0-9]{4})')
			url = post_body.asText.scan(/((www|http|https?:\/\/)+((?:[-a-z0-9]+\.)+[a-z]{2,}))/)
		end
		if html_body[0]
    	date = html_body[0].asText.partition("Date:")[2][0..19] #grabs all txt after string 'Date:' then grabs 0..19 which is date and time
		end

    post_id = html_body[0].asText.partition("PostingID")[2][0..12] #see above
#TODO Use a regex to search a post for any and all phone numbers. Possibly drop these into a separate table with PostID as prim key
#TODO need to add code when parsing location string to add text until we see a carrage return. Possible use regex to search for
#			text between word 'location' and carrage return => \n
    #location = html_body[0].asText.partition("Location:")[2][0..5] #see above
    location_first_attempt = click_post.getByXPath("html/body/div[4]/ul/li[1]")
    location_second_attempt = click_post.getByXPath("html/body/ul[1]/li[1]")
		if location_first_attempt[0]
			location = location_first_attempt[0].asText.gsub('Location: ', ' ')
		else
			#location = location_second_attempt[0].asText.gsub('Location: ', ' ')
			location = "Location not found"
		end
    puts "Date is =>" + date
		puts "Post id is =>" + post_id
		puts "Location is=>" + location
		puts "Tile is =>" + title
		puts "Phone is =>" + phone.inspect
		puts "URL is " + url.inspect
		puts "Post is " + post_body.asText.gsub(/\n/,'')
		puts "*************************************************"
		puts "*************************************************"
		puts "*************************************************"
		puts "*************************************************"
   	#puts html_body[0].asText
    #puts post_body.asText #gets body
    i+=1
  end
