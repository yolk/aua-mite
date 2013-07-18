module Aua::Agents::AllMite

  PATTERN = /^All\.mite\-v([\d\.]+)/

  def self.extend?(agent)
    agent.app =~ PATTERN
  end

  def type
    :ApiClient
  end

  def name
    @name ||= :"All.mite"
  end

  def version
    @version ||= app =~ PATTERN && $1
  end
end