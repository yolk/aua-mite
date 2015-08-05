module Aua::Agents::MiteGo

  def self.extend?(agent)
    (agent.app == "mite.go" || agent.app == "MiteGo") &&
    ((agent.products.index("Darwin") && agent.products[agent.products.index("Darwin")] = "NoDarwin") || true)
  end

  def type
    :ApiClient
  end

  def name
    @name ||= :"mite.go"
  end

  def version
    super || version_of(app)
  end

  def platform
    @platform ||= begin
      if app_comments.first =~ /^iPod/
        :iPod
      elsif app_comments.first =~ /^iPad/
        :iPad
      else
        :iPhone
      end
    end
  end

  def os_version
    @os_version ||= begin
      if app_comments[1] =~ /(iPhone OS|iOS) ([\d\.]+)/
        $2
      end
    end
  end

  def os_name
    :iOS
  end
end