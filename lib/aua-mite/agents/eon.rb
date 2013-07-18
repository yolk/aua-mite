module Aua::Agents::Eon

  def self.extend?(agent)
    agent.app == "Eon"
  end

  def type
    :ApiClient
  end

  def name
    :Eon
  end
end