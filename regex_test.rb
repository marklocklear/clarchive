string = "My phone number is (1923) 915-1234."  
phone_reg = /\((\d{4})\)\s+(\d{3})-(\d{4})/
phone_reg2 = /\((\d{4})\)\s+(\d{3})-(\d{4})/
m = phone_reg.match(string)  
unless m  
  puts "There was no match..."  
  exit  
end  
print "I found: "  
puts m[0]  
