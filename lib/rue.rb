require 'io/console'

class Terminal
  def get_char
    STDIN.getch
  end
  def print(s)
    STDOUT.print s
  end
end


class LineDiscipline
  def initialize
    @line = ''
  end
  def complete?
    @complete || false
  end
  def add(c)
    if complete? || c == "\r"
      @complete = true
      return "\r\n"
    end
    @line +=c
    c
  end
  def to_s
    @line
  end
end

class ExecutionContext
  def method_missing(method, *params)
    puts "running (honest): #{method} #{params}"
  end
  def exit
    raise 'Had enough, exiting...'
  end
end

class Executor
  def initialize
    @context = ExecutionContext.new
  end
  def exec(line)
    @context.instance_eval line.to_s
  end
end

class Shell
  def run
    begin
      executor = Executor.new
      terminal = Terminal.new

      while true do

        line = LineDiscipline.new

        until line.complete?
          terminal.print line.add(terminal.get_char)
        end

        executor.exec line
      end
    rescue => e
      puts "you're just mucking around now, rue has had enough: #{e}"
    end
  end
  private
  attr_reader :executor, :terminal
end
