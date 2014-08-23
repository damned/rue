require_relative 'errors/shell_exit'

module Rue

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

end