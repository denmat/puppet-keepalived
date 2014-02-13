require 'spec_helper'

describe 'keepalived::install' do 
  include_context 'module_data'

  let(:node) {'fakenode.ops'}
  it { should contain_package('keepalived').with_ensure('latest') }
end
