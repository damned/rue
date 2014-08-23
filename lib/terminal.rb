require 'io/console'
module Rue

  class Terminal
    def initialize
      @input = STDIN
      @input.raw!
      @output = STDOUT
    end
    def get_char
      input.getch
    end
    def print(s)
      output.print s
      output.flush
    end
    private
    attr_reader :input, :output
  end

end