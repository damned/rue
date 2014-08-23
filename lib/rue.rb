require 'io/console'

require_relative 'terminal'
require_relative 'line_discipline'

module Rue

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

    def initialize(executor: Executor.new, terminal: Terminal.new)
      @executor = executor
      @terminal = terminal
    end
    def run
      begin
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
end
