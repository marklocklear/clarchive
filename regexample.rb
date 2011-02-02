string = "thi335.670.3344s is a (332)223-5283 test 474-347-1122 and more here!!! And now 334.332.3357 or it could be 334 443 3322"
string2 = "3435884433 or 332 233-2233 now lets add http://www.wintas.com"
reg = string.scan(%r`[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}`)
reg2 = string.scan(/\([0-9]{3}\)[0-9]{3}[-.][0-9]{4}/)
reg4 = string.scan(/\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})/)
url = string2.scan(/((http|https?:\/\/)+((?:[-a-z0-9]+\.)+[a-z]{2,}))/)
puts "reg 1 is " + reg.inspect
puts "reg 2 is " + reg2.inspect
puts "reg 4 is " + reg4.inspect
puts "hash is " + reg4[0][1]
puts "The url is " + url.inspect
