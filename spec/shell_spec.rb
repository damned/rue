require_relative 'spec_helper'
require_relative 'rue_doubles'
require_relative 'rue_matchers'

require_relative '../lib/rue'

include Rue
include Test::RueDoubles

describe Shell do

  let(:terminal) { terminal_double }
  let(:shell) { Shell.new terminal: terminal }

  it 'should not blow up... and exit when asked' do
    terminal.simulate_input 'exit'
    shell.run
  end

  describe 'basic commands' do
    describe 'echo' do
      it 'should echo string input' do
        terminal.simulate 'echo "bob"'
        shell.run
        expect(terminal.output).to comprise 'echo "bob"',
                                            'bob'
      end
    end
    describe 'pwd' do
      xit 'should show current directory' do
        terminal.simulate 'pwd'

        shell.run

        expect(terminal.output).to comprise 'pwd',
                                            Pathname.new(__FILE__).parent.to_s
      end
    end
    describe 'ls' do
      it 'should show files in current directory'
    end


  end

end