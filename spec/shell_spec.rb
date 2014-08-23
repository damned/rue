require_relative 'spec_helper'

require_relative '../lib/rue'

describe Shell do

  let(:shell) { Shell.new }

  it 'should not blow up' do
    shell
  end
end