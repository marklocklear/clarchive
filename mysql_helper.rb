require 'java'
require 'rubygems'
require 'jdbc/mysql'

module JavaLang
  include_package "java.lang"
end
module JavaSql
  include_package 'java.sql'
end
def query(statement)
	begin
  	com.mysql.jdbc.Driver.new
  	conn = JavaSql::DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/clist", "root", "homer9721");
  	stmt = conn.createStatement
  	rs = stmt.execute(statement)
  	#rs.close
  	stmt.close
  	conn.close()
	rescue JavaLang::ClassNotFoundException
  	puts "ClassNotFoundException"
	end
end
