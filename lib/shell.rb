require 'io/console'

require_relative 'terminal'
require_relative 'line_discipline'
require_relative 'execution_context'
require_relative 'executor'

require_relative 'errors/shell_exit'


module Rue

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
