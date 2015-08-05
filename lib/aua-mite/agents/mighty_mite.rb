module Aua::Agents::MightyMite

  def self.extend?(agent)
    agent.app == "MightyMite" || agent.app == "mighty-mite"
  end

  def type
    :ApiClient
  end

  def name
    :MightyMite
  end

  def version
    @version ||= app == "MightyMite" ? parts[1] && parts[1][0] : version_of("mighty-mite")
  end
end