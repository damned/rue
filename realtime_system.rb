command = ARGV.to_a.join ' '
command = 'ruby ticker.rb 7' if command.empty?
puts "start: #{Time.now}"
system 'echo $-'
system command
puts "complete: #{Time.now}"
