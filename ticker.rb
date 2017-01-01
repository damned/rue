ticks = ARGV[0].to_i 
ticks = 1 if ticks < 1
puts "stdout sync: #{STDOUT.sync}"
(1..ticks).each do
  sleep 1
  STDOUT.print '.'
end
puts
