require 'rubygems'
require 'java'
require "dbi"
require 'dbd-jdbc'
require 'htmlunit.rb'


begin

# connect to the MySQL server
#
dbh = DBI.connect("DBI:Mysql:clist:localhost", "root", "homer9721")
#
# # get server version string and display it
#
 row = dbh.select_one("SELECT VERSION()")
#
 puts "Server version: " + row[0]
#
 rescue DBI::DatabaseError => e
#
 puts "An error occurred"
#
 puts "Error code: #{e.err}"
#
 puts "Error message: #{e.errstr}"
#
 ensure
#
# # disconnect from server
#
 dbh.disconnect if dbh
#
 end
