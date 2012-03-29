module Aua::Agents::StandardMiteClient
  
  KNOWN_CLIENTS = %w(git2mite Mite-on-rails mite-rb jmite Redmine2mite Mantis2mite Billomat hearttp centralstationcrm mighty-mite-statistics)
  MITE_STANDARD = /^mite\.([a-z]+)/
  
  def self.extend?(agent)
    KNOWN_CLIENTS.include?(agent.app) ||
    agent.app =~ MITE_STANDARD
  end
  
  def type
    return :HttpChecker if app == "hearttp"
    :ApiClient
  end
  
  def name
    @name ||= app.to_sym
  end
  
  def version
    return super unless app == "mite.net"
    versions[2]
  end
  
end