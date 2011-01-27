Dir["#{File.dirname(__FILE__)}/agents/*.rb"].each do |agent| 
  require(agent)
end

Aua::Agents.default << Aua::Agents::Fuerst << Aua::Agents::MiteGo <<
                       Aua::Agents::StandardMiteClient << Aua::Agents::AllMite