module Aua::Agents::Misc

  STD_CLIENTS = %w(OpenResearch-Dashboard Mitey my_app_name mite_summary Fire2mite ledger2mite Mite2Excel mite2mail mite2pdf MiteBoard MiteFM mitecommander mityvoice MiteYourMite mite mitevaluator mitetracking miteTestv1 mitesh mite+scopevisio miter miteNX mitemigrate mitematemarser MiteliciousToday Mitelicious)

  CLIENTS = (STD_CLIENTS.reduce({}) {|clients, key| clients[key] = key.to_sym; clients }).merge({
    "jira-mite" => :jiramite,
    "mite_invoice" => :"mite-invoice"
  })

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
    return app.to_sym if app =~ MITE_STD_PATTERN
    return :git2mite if app =~ GIT2MITE_PATTERN
    return :jiramite if app =~ JIRAMITE_PATTERN
    CLIENTS[app]
  end

  def version
    return $2 if app =~ GIT2MITE_PATTERN
    return $1 if app =~ JIRAMITE_PATTERN
    v = (super || version_of(app) || "").split(";", 2)[0]
    v =~ /^com\./ ? nil : (v ? v.sub(/^v/, "") : v)
  end
end