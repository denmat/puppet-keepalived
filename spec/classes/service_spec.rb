require 'spec_helper'

describe 'keepalived::service' do
  include_context 'module_data'

  let(:node) {'fakenode.ops'}

  context 'with serivce disabled' do 
    let(:params)  { { :enable => false,
                      :ensure => false
                  } }
    it { should contain_service('keepalived::service').with( {
      :enable => 'false',
      :ensure => 'false',
      } )
    }
  end
  context 'with serivce enabled' do 
    let(:params)  { { :enable => true,
                      :ensure => true
                  } }
    it { should contain_service('keepalived::service').with( {
      :enable => 'true',
      :ensure => 'true',
      } )
    }
  end
end
