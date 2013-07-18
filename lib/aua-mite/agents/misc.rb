module Aua::Agents::Misc

  CLIENTS = {
    "OpenResearch-Dashboard" => "OpenResearch-Dashboard",
    "Mitey" => "Mitey",
    "my_app_name" => "my_app_name",
    "mite_summary" => "mite_summary"
  }

  def self.extend?(agent)
    !!CLIENTS[agent.app]
  end

  def type
    :ApiClient
  end

  def name
    CLIENTS[app].to_sym
  end

  def version
    nil
  end
end