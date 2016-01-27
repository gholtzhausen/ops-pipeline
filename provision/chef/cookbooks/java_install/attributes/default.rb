case node[:platform]
when 'redhat', 'centos'
  default['java_install']['packages'] = ['tar', 'gzip']
when 'ubuntu', 'debian'
  default['java_install']['packages'] = ['tar', 'gzip']
end

default['java_install']['java7'] = true
default['java_install']['java8'] = true
default['java_install']['default'] = 7

default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '7'
default['java']['oracle']['accept_oracle_download_terms'] = true
