require 'rspec'

module Rue
  module Test
    module RueDoubles
      module TerminalDoubleExtensions
        def simulate_input(line)
          self.stub(:get_char).and_return *(line + "\r").chars
        end
      end

      def terminal_double
        double('terminal', print: nil).extend TerminalDoubleExtensions
      end
    end
  end
end