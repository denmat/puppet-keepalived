require 'spec_helper'

describe 'keepalived' do
  include_context 'module_data'

  let(:node) {'fakenode.ops'}
  it { should contain_class('keepalived::install') }
  it { should contain_class('keepalived::config') }
  it { should contain_class('keepalived::service') }

end
