require_relative '../../spec_helper'

require 'pty'

describe 'rue shell' do
  it 'should run and exit without error' do
    completed = false
    outlines = []
    PTY.spawn("./rue") do |output, input, pid|
      begin
        output.each {|line|
          if line.include? 'hello'
            input.printf("echo 'bob'\r")
          elsif line == "bob\n"
            input.printf("exit\r")
          elsif line.include? 'bye'
            fail 'not a good bye: ' + line unless line.include? 'rue has had enough'
            completed = true
          end
          outlines << line
        }
      rescue Errno::EIO
      ensure
        Process.wait pid
      end
    end
    puts "rue_shell_spec output:\n#{outlines.collect {|l| '>> ' + l}.join ''}"
    expect(completed).to be_true
  end
end