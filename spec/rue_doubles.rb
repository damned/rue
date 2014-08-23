require 'rspec'

module Rue
  module Test
    module RueDoubles
      class TerminalDouble #refac extend real Terminal, use StringIO for stream?
        def initialize
          @printed = ''
          @input = []
        end
        def simulate_input(*lines)
          lines.each do |line|
            @input += (line + "\r").chars
          end
        end
        def get_char
          @input.shift
        end
        def print(s)
          @printed += s
        end
        def output
          @printed.split "\n"
        end
      end

      def terminal_double
        TerminalDouble.new
      end
    end
  end
end