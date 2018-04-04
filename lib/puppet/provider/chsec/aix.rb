Puppet::Type.type(:chsec).provide(:aix) do
  desc "Provides support for managing /etc/security files in AIX."
  confine :operatingsystem => [:aix]

  commands :chsec => '/usr/bin/chsec',
           :lssec => '/usr/bin/lssec'

  def create
    begin
      command = chsec('-f', resource[:file], '-s', resource[:stanza], '-a', "#{resource[:attribute]}=#{resource[:value]}") 
    rescue Puppet::ExecutionFailure => e
      fail "chsec for #{resource[:stanza]}:#{resource[:attribute]} of #{resource[:file]} failed."
    else
      notice "Changed #{resource[:file]} #{resource[:stanza]}:#{resource[:attribute]} to #{resource[:value]}"
    end
  end

  def destroy
    # Not sure if we would ever really be here.
    notice "No provision for removing #{resource[:attribute]}"
  end

  def exists?
    begin
      command = lssec('-f', resource[:file], '-s', resource[:stanza], '-a', resource[:attribute])

    if command[/="?(.+?)"?$/, 1] != resource[:value]
      return false
    else
      return true
    end

    rescue Puppet::ExecutionFailure
      return false
    end

  end

end
