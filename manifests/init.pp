# This module is distributed under the GNU Affero General Public License:
#
# Smartmontools module for puppet
# Copyright (C) 2010 Sarava Group
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class smartmontools {
  package { 'smartmontools':
    ensure => installed,
  }

  file { '/etc/default/smartmontools':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    notify  => Service['smartmontools'],
    source  => 'puppet:///modules/smartmontools/default/smartmontools',
  }

  service { 'smartmontools':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    pattern    => '/usr/sbin/smartd',
    require    => [ File['/etc/default/smartmontools'], Package['smartmontools'] ],
  }
}
