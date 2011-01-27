module Aua::Agents::MiteGo
  
  def self.extend?(agent)
    agent.app == "mite.go" && 
    ((agent.products.index("Darwin") && agent.products[agent.products.index("Darwin")] = "NoDarwin") || true)
  end
  
  def type
    :ApiClient
  end
  
  def name
    @name ||= :"mite.go"
  end
  
  def platform
    @platform ||= begin
      if app_comments.first =~ /^iPod/
        :iPod
      else
        :iPhone
      end
    end
  end
  
  def os_version
    @os_version ||= begin
      if app_comments[1] =~ /iPhone OS ([\d\.]+)/
        $1
      end
    end
  end
  
  def os_name
    :iOS
  end
end