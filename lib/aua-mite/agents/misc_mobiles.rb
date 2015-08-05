module Aua::Agents::MiscMobiles

  def self.extend?(agent)
    BYTEPOETS.include?(agent.app) ||
    agent.app == "MightyMiteToday" ||
    agent.app == "MiteClocks"
  end

  BYTEPOETS = ["BytepoetsMite", "com.bytepoets.mightymite", "com.bytepoets.MightyMite"]
  IOS_VERSION_PATTERN = /(iOS|iPhone OS) ([\d\.]+)/

  def type
    :ApiClient
  end

  def version
    version_of(name) || (parts[1] && parts[1][0] =~ /^[\d\.]+$/ ? parts[1][0] : nil) || version_of(app)
  end

  def name
    BYTEPOETS.include?(app) ? :BytepoetsMite : app.to_sym
  end

  def platform
    :iPhone
  end

  def os_version
    @os_version ||= begin
      if  app_comments[0] =~ IOS_VERSION_PATTERN ||
          app_comments[1] =~ IOS_VERSION_PATTERN ||
          comments[1] && comments[1][1] =~ IOS_VERSION_PATTERN
        $2
      end
    end
  end

  def os_name
    :iOS
  end

  def app_comments
    org = super
    if org && org != ""
      org
    else
      comments[1]
    end
  end
end