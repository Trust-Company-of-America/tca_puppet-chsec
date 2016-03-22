require 'puppet'
require 'puppet/type/chsec'
require 'spec_helper'

# Really should test this... But I'm not sure
# how to test it when using non-aix machines to write
# the code since the provider uses AIX specific commands. 
provider_class = Puppet::Type.type(:chsec).provider(:aix)
describe provider_class do

  let(:tmpfile) { tmpfilename("chsec_test_file") }
  let(:chsec_params) {{
    :title => 'test_root_file',
    :path => tmpfile,
    :section => 'root',
    :setting => 'fsize',
    :value => '-1',
  }}

  def validate_file(expected_content, tmpfile = tmpfile)
    File.read(tmpfile).should == expected_content
  end


  before :each do
    File.open(tmpfile, 'w') do |fh|
      fh.write("")
    end
  end

  it "should add a new stanza for root with an fsize setting" do
    provider = described_class.new(resource)
    provider.exists?.should be false
    provider.create
    validate_file(<<-EOS
root:
  fsize = -1
EOS
)
  end

end
