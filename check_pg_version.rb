require 'pg'

begin
  # Connect to the database
  conn = PG.connect(dbname: 'postgres')
  
  # Execute the query and fetch the result
  result = conn.exec("SELECT version();")
  
  # Print each row of the result
  result.each do |row|
    puts row['version']
  end

rescue PG::Error => e
  puts e.message
ensure
  # Close the connection
  conn.close if conn
end