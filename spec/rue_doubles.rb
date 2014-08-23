require 'rspec'

module Rue
  module Test
    module RueDoubles
      class TerminalDouble #refac extend real Terminal, use StringIO for stream?
        def initialize
          @printed = ''
          @input = []
        end
        def simulate(*lines)
          lines << 'exit'
          simulate_input *lines
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
        def output(skip_exit: true)
          @printed.split("\n") - ['exit']
        end
      end

      def terminal_double
        TerminalDouble.new
      end
    end
  end
end