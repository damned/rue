require_relative 'spec_helper'
require_relative 'rue_doubles'
require_relative 'rue_matchers'

require_relative '../lib/shell'

include Rue
include Test::RueDoubles

def project_root_dir
  Pathname.new(__FILE__).parent.to_s
end

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
        expect(output_from 'echo "bob"').to comprise 'echo "bob"', 'bob'
      end
    end
    describe 'pwd' do
      xit 'should show current directory' do
        expect(output_from 'pwd').to comprise 'pwd',
                                              project_root_dir
      end
    end
    describe 'ls' do
      it 'should show files in current directory'
    end


    def output_from(commands)
      terminal.simulate commands
      shell.run
      terminal.output
    end
  end

end