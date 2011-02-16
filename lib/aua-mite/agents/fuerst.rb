module Aua::Agents::Fuerst
  
  PATTERN = /^(DynaMite|GrandTotal|TimeLog)/
  
  def self.extend?(agent)
    agent.app =~ PATTERN
  end
  
  def type
    :ApiClient
  end
  
  def name
    @name ||= app.match(PATTERN)[1].to_sym
  end
  
  def version
    @version ||= begin
      return versions.first if app == "DynaMite" || app == "GrandTotal" || app == "TimeLog"
      app.sub(PATTERN, "")
    end
  end
end