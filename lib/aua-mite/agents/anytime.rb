module Aua::Agents::Anytime

  def self.extend?(agent)
    agent.app == "Anytime"
  end

  def type
    :ApiClient
  end

  def name
    :Anytime
  end

  def version
    products[1]
  end

  def platform
    @platform ||= app_comments.first =~ /^iPod/ ? :iPod : :iPhone
  end

  def os_version
    @os_version ||= $1 if comments[1] && (comments[1][1] || "") =~ /iPhone OS ([\d\.]+)/
  end

  def os_name
    :iOS
  end
end