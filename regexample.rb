string = "thi335.670.3344s is a (332)223-5283 test 474-347-1122 and more 864 2305350 here!!! And now 334.332.3357 or it could be 334 443 3322, but also 334/334-3322 or (888) 334-3322"
string2 = "3435884433 or 332 233-2233 now lets add http://www.wintas.com or there could be ***www.sassy.com*** and www.busta.com or even sause-meat.com WWW.WINTAS.COM"
reg = string.scan(%r`[0-9]{3}[-.\/ ][0-9]{3}[-.\/ ][0-9]{4}`)
reg2 = string.scan(/\([0-9]{3}\)[0-9]{3}[-.][0-9]{4}/)
reg4 = string.scan(/\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})/)
url = string2.scan(/((www|http?:\/\/)+((?:[-a-z0-9]+\.)+[a-z]{2,}))/)
url2 = string2.scan(%r'\b(([\w-]+://?|www|WWW[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|/)))')
puts "reg 1 is " + reg.inspect
puts "reg 2 is " + reg2.inspect
puts "reg 4 is " + reg4.inspect
puts "hash is " + reg4[0][1]
puts "The url is " + url2.inspect
