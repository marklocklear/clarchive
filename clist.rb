#Author J. Mark Locklear
require 'java'
require 'rubygems'
require 'date'
require 'htmlunit.rb'
require 'clist_helper.rb'

start_time = DateTime.now
get_sites()
count = 0
j = 0
while j < 500
	webClient = WebClient.new(BrowserVersion::FIREFOX_3)
 	begin
 		main_page = webClient.getPage($sites[j])
	rescue java.net.UnknownHostException => e
		$stderr.print "Exception caught: #{e}n\n"
	end 
 	main_div = main_page.getElementById("sss")
 	h4 = main_page.getByXPath(main_div.getCanonicalXPath() + "/h4/a")
 	for_sale_page = h4[0].click
 	i=1
	#TODO This conditional is a little silly. Will eventually drop the 99 posts and do conditional on exsistance of posts
 	while i < 99 and for_sale_page.getByXPath("html/body/blockquote[2]/p[#{i}]/a")[0] != nil
    post = for_sale_page.getByXPath("html/body/blockquote[2]/p[#{i}]/a")
		if post[0] and post[0] != nil
			begin
    		click_post = post[0].click
			rescue java.lang.RuntimeException => e
				$stderr.print "Exception caught: #{e}n\n"
			#rescue java.lang.NullPointerException => e
       # $stderr.print "Exception caught: #{e}n\n"
			end
    	title = click_post.getByXPath("html/body/h2")
    	category = click_post.getByXPath("html/body/div[1]/a[4]")
    	post_body = click_post.getElementById("userbody")
    	html_body = click_post.getByXPath("html/body")
		end
		#TODO Need to handle the case of a numeric title...script fails when it trys asText method on a fixnum
		if title[0].asText
			title = title[0].asText
		else
			tile = 'Error setting title'
		end
		if post_body
			#phone = post_body.asText.scan(%r'\(?([0-9]{3})\)?[-.\/ ]?([0-9]{3})[-.\/ ]?([0-9]{4})')
			phone = post_body.asText.scan(%r`[0-9]{3}[-.\/ ][0-9]{3}[-.\/ ][0-9]{4}`)
			#url = post_body.asText.scan(/((www|http|https?:\/\/)+((?:[-a-z0-9]+\.)+[a-z]{2,}))/)
			url = post_body.asText.scan(%r'\b(([\w-]+://?|www|WWW[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|/)))')
		end
		if html_body[0]
		#str.partition(sep) → [head, sep, tail]
    	date = html_body[0].asText.partition("Date:")[2][0..19] #grabs all txt after string 'Date:' then grabs 0..19 which is date and time
		end

    post_id = html_body[0].asText.partition("PostingID")[2][0..12] #see above
#TODO Use a regex to search a post for any and all phone numbers. Possibly drop these into a separate table with PostID as prim key
#TODO need to add code when parsing location string to add text until we see a carrage return. Possible use regex to search for
#			text between word 'location' and carrage return => \n
    #location = html_body[0].asText.partition("Location:")[2][0..5] #see above
    #What ended up doing below is grabbing the location from xpath instead of trying to parse it out of the post body
    location_first_attempt = click_post.getByXPath("html/body/div[4]/ul/li[1]")
    location_second_attempt = click_post.getByXPath("html/body/ul[1]/li[1]")
		if location_first_attempt[0]
			location = location_first_attempt[0].asText.gsub('Location: ', ' ') #Why the gsub???
		else
			#location = location_second_attempt[0].asText.gsub('Location: ', ' ')
			location = "Location not found"
		end
		puts "In site: " + $sites[j]
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
		count += 1
		puts "Processed " + count.to_s + " posts."
  end
j+=1
end
end_time = DateTime.now
execution_time = (start_time - end_time).to_s
puts "Processed " + count.to_s + " posts in " + execution_time
