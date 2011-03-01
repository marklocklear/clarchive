#Author J. Mark Locklear
require 'java'
require 'rubygems'
require 'date'
require 'htmlunit.rb'
require 'clist_helper.rb'
require 'mysql_helper.rb'

webClient = WebClient.new(BrowserVersion::FIREFOX_3)
get_sites() #see helper file

start_time = DateTime.now
count = 0
j = 0

while j < 500
	for_sale_page = get_for_sale_pages(j) #see helper file
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
		if title[0].asText
			title = title[0].asText.gsub(/'/, '')
		else
			tile = 'Error setting title' #needed to add this condition asText method was failing if title was numberic
		end
		if post_body
			phone = post_body.asText.scan(%r`[0-9]{3}[-.\/ ][0-9]{3}[-.\/ ][0-9]{4}`)
			url = post_body.asText.scan(%r'\b(([\w-]+://?|www|WWW[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|/)))')
		end
		if html_body[0]
    	date = html_body[0].asText.partition("Date:")[2][0..19].gsub(/[APMCEKST ]/, '') #str.partition(sep) → [head, sep, tail]
    	post_id = html_body[0].asText.partition("PostingID")[2][2..12] #see above
		end

    location_first_attempt = click_post.getByXPath("html/body/div[4]/ul/li[1]")
		if location_first_attempt[0] and location_first_attempt[0] != /^it's NOT ok/
			#TODO Need to combine these next two statements
			location = location_first_attempt[0].asText.gsub('Location: ', '') 
			location = location.gsub(/'/, '')
		else
			location = "Location not found"
		end
		puts "In site: " + $sites[j]
		if date != ''
    	puts "Date is =>" + date
		else
			date = '0000-00-00,00:00'
		end
		if post_id
			puts "Post id is =>" + post_id
		else
			puts "Can't get post id"
		end
		if category[0]
			puts "Category is =>" + category[0].asText
		end
		puts "Location is=>" + location
		puts "Tile is =>" + title
		puts "Phone is =>" + phone.inspect
		puts "URL is =>" + url.inspect
		if post_body
			body = post_body.asText.gsub(/[\n']/,'')
			puts "Post is=>" + body
		end
    statement = "insert into post7 values('#{date}', '#{post_id}', '#{location}', '#{title}', '#{body}');"
    puts statement;
    query(statement)
		puts "*************************************************"
		puts "*************************************************"
    i+=1
		count += 1
		puts "Processed " + count.to_s + " posts."
  end
j+=1
end
end_time = DateTime.now
execution_time = (start_time - end_time).to_s
puts "Processed " + count.to_s + " posts in " + execution_time
