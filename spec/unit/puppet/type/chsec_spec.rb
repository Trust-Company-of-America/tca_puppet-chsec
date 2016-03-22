require 'puppet'
require 'puppet/type/chsec'
require 'spec_helper'
describe Puppet::Type.type(:chsec) do
  subject { Puppet::Type.type(:chsec).new(:name => 'maxage') }

  it 'should accept ensure' do
    subject[:ensure] = :present
    expect { subject[:ensure].to eq(:present) }
  end

  it 'should require a value' do
    subject[:value] = "testing"
    expect { subject[:value].to eq("testing") }
  end

  it 'should not accept a missing value' do
    expect { subject[:value] = nil }.to raise_error(Puppet::Error, /value/)
  end

  it 'should require a file' do
    subject[:file] = "/etc/security/limits"
    expect { subject[:file].to eq("/etc/security/limits") }
  end

  it 'should not accept a missing file' do
    expect { subject[:file] = nil }.to raise_error(Puppet::Error, /file/)
  end


  it 'should require a stanza' do
    subject[:stanza] = "default"
    expect { subject[:stanza].to eq("default") }
  end

  it 'should not accept a missing stanza' do
    expect { subject[:stanza] = nil }.to raise_error(Puppet::Error, /stanza/)
  end

end
