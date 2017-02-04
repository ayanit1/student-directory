# reads and prints its own source code
# or add $><<IO.read($0) syntax to file
File.open(__FILE__).each do |line|
  puts line
end
