require 'io/console'

require_relative 'terminal'
require_relative 'line_discipline'

module Rue

  class ShellExit < StandardError

  end

  class ExecutionContext
    def initialize(terminal)
      @terminal = terminal
    end
    def method_missing(method, *params)
      stderr.puts "running (honest): #{method} #{params}"
    end
    def echo(s='')
      @terminal.print s + "\n"
    end
    def exit
      raise ShellExit.new 'Had enough, exiting...'
    end
  end

  class Executor
    def initialize(terminal)
      @context = ExecutionContext.new(terminal)
    end
    def exec(line)
      @context.instance_eval line.to_s
    end
  end

  class Shell

    def initialize(terminal: Terminal.new, executor: Executor.new(terminal))
      @executor = executor
      @terminal = terminal
    end
    def run(handle_error: false)
      begin
        while true do

          line = LineDiscipline.new

          until line.complete?
            terminal.print line.add(terminal.get_char)
          end

          executor.exec line
        end
      rescue => e
        if e.is_a? ShellExit
          puts "rue has had enough, bye :)"
          return
        end
        if handle_error
          puts "you're just mucking around now, rue has had enough: #{e}"
          return
        end
        raise
      end
    end
    private
    attr_reader :executor, :terminal
  end
end
