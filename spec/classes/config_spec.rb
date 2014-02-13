require 'spec_helper'

describe 'keepalived::config' do
  include_context 'module_data'

  let(:node) { 'fakenode.ops' }

  it { should contain_class('keepalived::install')}
  it { should contain_file('/etc/keepalived/keepalived.conf').with(
    :ensure => 'present',
    :owner  => 'root',
    :group  => 'root',
    :mode   => '0640'
    ) }
  it { should contain_file('/etc/keepalived/keepalived.conf').with_content(/external/)}

  context 'is MASTER' do
    it { should contain_file('/etc/keepalived/keepalived.conf').with_content(/state MASTER/) }
    it { should contain_file('/etc/keepalived/keepalived.conf').with_content(/priority 150/) }
    it { should_not contain_file('/etc/keepalived/keepalived.conf').with_content(/state BACKUP/) }
    it { should_not contain_file('/etc/keepalived/keepalived.conf').with_content(/priority 100/) }
  end
#  
#  context 'is BACKUP' do
#    let(:hiera_data) { { 
#      'keepalived_groups' => { 
#        'vrrp_config' => { 
#          'vrrp_group' => {
#            'VG1' => {
#              'state' => 'BACKUP'
#            }
#          }
#        }
#      }
#    } }
#        
#    it { should contain_file('/etc/keepalived/keepalived.conf').with_content(/state BACKUP/) }
#    it { should contain_file('/etc/keepalived/keepalived.conf').with_content(/priority 100/) }
#  end

end
