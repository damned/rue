require_relative 'spec_helper'
require_relative 'rue_doubles'

require_relative '../lib/rue'

include Rue
include Test::RueDoubles

describe Shell do

  let(:terminal) { terminal_double }
  let(:shell) { Shell.new terminal: terminal }

  it 'should not blow up' do
    terminal.simulate_input 'exit'
    shell.run
  end
end