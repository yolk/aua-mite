module Aua::Agents::Anytime

  def self.extend?(agent)
    agent.app == "Anytime" || agent.app == "anytime"
  end

  def type
    :ApiClient
  end

  def name
    :Anytime
  end

  def version
    products[1] || version_of("anytime") || version_of("Anytime")
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
    @os_version ||= if comments[1] && (comments[1][1] || "") =~ /iPhone OS ([\d\.]+)/
      $1
    elsif app_comments[1] =~ /iOS ([\d\.]+)/
      $1
    end
  end

  def os_name
    :iOS
  end
end