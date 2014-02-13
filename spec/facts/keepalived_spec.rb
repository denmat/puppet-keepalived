require 'spec_helper'

describe 'keepalived_active_master', :type => :fact do

  describe 'on windows' do
    it 'should not return a value' do
      Facter.fact(:kernel).stubs(:value).returns('Windows')
      Facter.fact(:keepalived_active_master).value.should == nil
    end
  end
  describe 'on linux' do
    before {
      Facter.clear
      allow(Facter.fact(:kernel)).to receive(:value).and_return('Linux')
    }
    context 'and master' do
      it 'should return a value of true' do
        allow(Facter::Util::Resolution).to receive(:exec).with('ip addr show |grep inet').and_return('inet 192.168.22.254/32 blah')
        Facter.fact(:keepalived_active_master).value.should be_true
      end
    end
    context 'and backup' do
      it 'should return a nil value' do
        allow(Facter::Util::Resolution).to receive(:exec).with('ip addr show |grep inet').and_return('inet 10.168.2.2/32 blah')
        Facter.fact(:keepalived_active_master).value.should be_nil
      end
    end
  end
end
