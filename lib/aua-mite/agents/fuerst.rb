module Aua::Agents::Fuerst
  
  def self.extend?(agent)
    agent.app == "DynaMite" || agent.app == "GrandTotal" || 
    agent.app =~ /^DynaMite/ || agent.app =~ /^GrandTotal/ 
  end
  
  def type
    :ApiClient
  end
  
  def name
    @name ||= app =~ /^GrandTotal/ ? :GrandTotal : :DynaMite
  end
  
  def version
    @version ||= begin
      return versions.first if app == "DynaMite" || app == "GrandTotal"
      app.sub(/^DynaMite|GrandTotal/, "")
    end
  end
end