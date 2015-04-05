require 'json'

Facter.add('installed_packages') do
  setcode do
    operating_system = Facter.value(:operatingsystem)
    case operating_system
    when 'Darwin'

      packages = ''
    when 'redhat'
      installed_packages = %x('/bin/rpm -qa').split().to_json
    end
    installed_packages
  end
end
