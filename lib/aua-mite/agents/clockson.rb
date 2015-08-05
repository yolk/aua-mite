module Aua::Agents::Clockson

  def self.extend?(agent)
    agent.app == "Clockson" || agent.app == "clockson"
  end

  def type
    :ApiClient
  end

  def version
    (version_of(name) || version_of("clockson")).sub(/^v/, "")
  end

  def name
    :Clockson
  end

  def platform
    @platform ||= begin
      if app_comments.first =~ /^iPod/
        :iPod
      elsif app_comments.first =~ /^iPad/
        :iPad
      else
        :iPhone
      end
    end
  end

  def os_version
    @os_version ||= begin
      if app_comments[1] =~ /iOS ([\d\.]+)/
        $1
      end
    end
  end

  def os_name
    :iOS
  end
end