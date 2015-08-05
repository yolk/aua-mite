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
    "MiteBoard" => :MiteBoard,
    "MiteFM" => :"MiteFM",
    "mitecommander" => :"mitecommander",
    "mityvoice" => :mityvoice,
    "MiteYourMite" => :MiteYourMite,
    "mite" => :mite,
    "mitevaluator" => :mitevaluator,
    "mitetracking" => :mitetracking,
    "miteTestv1" => :"miteTestv1",
    "mitesh" => :mitesh,
    "mite+scopevisio" => :"mite+scopevisio",
    "miter" => :miter,
    "miteNX" => :"miteNX",
    "mitemigrate" => :mitemigrate,
    "mitematemarser" => :mitematemarser,
    "MiteliciousToday" => :MiteliciousToday,
    "Mitelicious" => :Mitelicious,
    "mite_invoice" => :"mite-invoice"
  }

  GIT2MITE_PATTERN = /^git(lab)?2mitev([\d\.]+)/
  JIRAMITE_PATTERN = /^jira-mite-([\d\.]+)$/
  MITE_STD_PATTERN = /^[Mm]ite-[\-a-zA-Z]+$/

  def self.extend?(agent)
    !!CLIENTS[agent.app] || agent.app =~ MITE_STD_PATTERN || agent.app =~ GIT2MITE_PATTERN || agent.app =~ JIRAMITE_PATTERN
  end

  def type
    :ApiClient
  end

  def name
    return :git2mite if app =~ GIT2MITE_PATTERN
    return :jiramite if app =~ JIRAMITE_PATTERN
    return app.to_sym if app =~ MITE_STD_PATTERN
    CLIENTS[app]
  end

  def version
    return $2 if app =~ GIT2MITE_PATTERN
    return $1 if app =~ JIRAMITE_PATTERN
    v = (super || version_of(app) || "").split(";", 2)[0]
    v =~ /^com\./ ? nil : (v ? v.sub(/^v/, "") : v)
  end
end