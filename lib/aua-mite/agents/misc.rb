module Aua::Agents::Misc

  CLIENTS = {
    "OpenResearch-Dashboard" => :"OpenResearch-Dashboard",
    "Mitey" => :Mitey,
    "my_app_name" => :my_app_name,
    "mite_summary" => :mite_summary,
    "Fire2mite" => :Fire2mite,
    "jira-mite" => :jiramite,
    "ledger2mite" => :ledger2mite,
    "Mite2Excel" => :Mite2Excel,
    "mite2mail" => :mite2mail,
    "mite2pdf" => :mite2pdf,
    "mite-backup" => :"mite-backup",
    "mite-AlfredApp" => :"mite-AlfredApp",
    "MiteBoard" => :MiteBoard,
    "mite-cli" => :"mite-cli"
  }

  GIT2MITE_PATTERN = /^git(lab)?2mitev([\d\.]+)/
  JIRAMITE_PATTERN = /^jira-mite-([\d\.]+)$/

  def self.extend?(agent)
    !!CLIENTS[agent.app] || agent.app =~ GIT2MITE_PATTERN || agent.app =~ JIRAMITE_PATTERN
  end

  def type
    :ApiClient
  end

  def name
    return :git2mite if app =~ GIT2MITE_PATTERN
    return :jiramite if app =~ JIRAMITE_PATTERN
    CLIENTS[app]
  end

  def version
    return $2 if app =~ GIT2MITE_PATTERN
    return $1 if app =~ JIRAMITE_PATTERN
    super
  end
end