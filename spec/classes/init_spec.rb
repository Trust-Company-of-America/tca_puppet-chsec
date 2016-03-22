require 'spec_helper'
describe 'chsec' do

  context 'with defaults for all parameters' do
    it { should contain_class('chsec') }
  end
end
