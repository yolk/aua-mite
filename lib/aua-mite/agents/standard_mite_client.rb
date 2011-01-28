module Aua::Agents::StandardMiteClient
  
  KNOWN_CLIENTS = %w(git2mite Mite-on-rails mite.php mite.desk mite-rb jmite Redmine2mite Mantis2mite Billomat hearttp centralstationcrm)
  
  def self.extend?(agent)
    KNOWN_CLIENTS.include?(agent.app)
  end
  
  def type
    return :HttpChecker if app == "hearttp"
    :ApiClient
  end
  
  def name
    @name ||= app.to_sym
  end
  
  def version
    super 
  end
end