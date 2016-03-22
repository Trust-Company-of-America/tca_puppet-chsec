require 'puppet'
require 'puppet/type/chsec'

#RSpec.configure { |config| config.mock_framework = :mocha }

#describe 'The aix provider for aix_secfil type' do

  this_name = "maxage"
  this_value = "3"
  this_file = "/etc/security/user"
  this_stanza = "default"
#  let(:resource) { Puppet::Type::Aix_secfile.new({:name => this_name, :value => this_value, :file => this_file, :stanza => this_stanza, :ensure => :present}) }
#  subject { Puppet::Type.type(:chsec).provider(:aix).new(resource) }

#end

testsec = double( this_name, :value => this_value, :file => this_file, :stanza => this_stanza )
