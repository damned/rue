command = ARGV.to_a.join ' '
command = 'ruby ticker.rb 7' if command.empty?
puts "start: #{Time.now}"
require 'open4'
Open4::popen4(command) do |pid, stdin, stdout, stderr|
  start = Time.now
  begin
    while Time.now - start < 10 do 
      print stdout.readchar
    end
  rescue EOFError
  end
end
puts "complete: #{Time.now}"
