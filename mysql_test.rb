require 'jdbc.rb'

db = JdbcMysql.new("localhost", "root", "homer9721", "mysql")
res = db.query "SELECT * FROM user"

res.each do |row|
  puts row["value"]
end
