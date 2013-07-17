require 'spec_helper'

describe 'smartmontools', :type => :class do
  let(:title) { 'smartmontools' }

  it do
    should contain_package('smartmontools').with({
      'ensure' => 'installed',
    })
  end

  it do
    should contain_file('/etc/default/smartmontools').with({
      'ensure'  => 'present',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
      'source'  => 'puppet:///modules/smartmontools/default/smartmontools',
    })
  end
  
  it do
    should contain_service('smartmontools').with({
      'ensure'      => 'running',
      'enable'      => true,
      'hasrestart'  => true,
      'pattern'     => '/usr/sbin/smartd',
    })
  end
end
