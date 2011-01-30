#Author J. Mark Locklear
require 'java'
require 'rubygems'
require 'htmlunit.rb'

 webClient = WebClient.new(BrowserVersion::FIREFOX_3)
 main_page = webClient.getPage("http://raleigh.craigslist.org/")
 main_div = main_page.getElementById("sss")
 h4 = main_page.getByXPath(main_div.getCanonicalXPath() + "/h4/a")
 for_sale_page = h4[0].click
 i=1
 while i < 5
    post = for_sale_page.getByXPath("html/body/blockquote[2]/p[#{i}]/a")
    click_post = post[0].click
    title = click_post.getByXPath("html/body/h2")
    post_body = click_post.getElementById("userbody")
    html_body = click_post.getByXPath("html/body")
		#str.partition(sep) → [head, sep, tail]
		title = title[0].asText
    date = html_body[0].asText.partition("Date:")[2][0..19] #grabs all txt after string 'Date:' then grabs 0..19 which is date and time
    post_id = html_body[0].asText.partition("PostingID")[2][0..12] #see above
#TODO Use a regex to search a post for any and all phone numbers. Possibly drop these into a separate table with PostID as prim key
#TODO need to add code when parsing location string to add text until we see a carrage return
    location = html_body[0].asText.partition("Location:")[2][0..5] #see above
    puts "Date is =>" + date + " Post id is =>" + post_id + " Locaiton is=>" + location + " Tile is =>" + title
   	#puts html_body[0].asText
    #puts post_body.asText #gets body
    i+=1
  end
