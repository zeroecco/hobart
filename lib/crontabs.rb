require 'json'

Facter.add('crontabs') do
  setcode do
    operating_system = Facter.value(:operatingsystem)
    case operating_system
    when 'Darwin'
      installed_packages = ''
    when 'redhat'
      installed_packages = %x('/bin/rpm -qa').split().to_json
    when 'debian'
      installed_packages = ''
    end
    installed_packages
  end
end
