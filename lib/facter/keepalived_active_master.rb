require 'facter'

def is_gateway?(ips)
  ips.each do |ip|
    return true if ip.match(/192\.\d{1,3}\.\d{1,3}\.254/)
 end
 return nil
end



Facter.add(:keepalived_active_master) do 
  confine :kernel => %w{Linux}
  setcode do
    ips = Facter::Util::Resolution.exec('ip addr show |grep inet').split("\n")
    is_gateway?(ips)
  end   
end