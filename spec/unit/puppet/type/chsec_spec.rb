require 'puppet'
require 'puppet/type/chsec'
describe Puppet::Type.type(:chsec) do
  subject { Puppet::Type.type(:chsec).new(:name => 'maxage') }

  it 'should accept ensure' do
    subject[:ensure] = :present
    subject[:ensure].should == :present
  end

  it 'should require a value' do
    subject[:value] = "testing"
    subject[:value].should == "testing"
  end

  it 'should not accept a missing value' do
    expect { subject[:value] = '' }.to raise_error(Puppet::Error, /value/)
  end

  it 'should require a file' do
    subject[:file] = "/etc/security/limits"
    subject[:file].should == "/etc/security/limits"
  end

  it 'should not accept a missing file' do
    expect { subject[:file] = '' }.to raise_error(Puppet::Error, /file/)
  end


  it 'should require a stanza' do
    subject[:stanza] = "default"
    subject[:stanza].should == "default"
  end

  it 'should not accept a missing stanza' do
    expect { subject[:stanza] = '' }.to raise_error(Puppet::Error, /stanza/)
  end

end
