module Aua::Agents::MightyMite

  def self.extend?(agent)
    agent.app == "MightyMite"
  end

  def type
    :ApiClient
  end

  def name
    :MightyMite
  end

  def version
    @version ||= parts[1] && parts[1][0]
  end
end