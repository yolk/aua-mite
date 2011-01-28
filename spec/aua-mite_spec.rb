require 'spec_helper'

describe "Mite Extension" do
  
  EXAMPLES_MITE = {
    # DynaMite
    "DynaMite/2.0.2 CFNetwork/454.11.5 Darwin/10.6.0 (i386) (MacBookPro4%2C1)" => 
      { :type => :ApiClient, :name => :DynaMite, :version => "2.0.2", :os_name => :MacOSX, :os_version => "10.6.6", :platform => :Macintosh },
    "DynaMite/2.0b5 CFNetwork/454.11.5 Darwin/10.6.0 (i386) (iMac10%2C1)" =>
      { :type => :ApiClient, :name => :DynaMite, :version => "2.0b5", :os_name => :MacOSX, :os_version => "10.6.6", :platform => :Macintosh },
    "DynaMite2.0.3 CFNetwork/438.14 Darwin/9.8.0 (i386) (iMac7%2C1)" =>
      { :type => :ApiClient, :name => :DynaMite, :version => "2.0.3", :os_name => :MacOSX, :os_version => "10.5.8", :platform => :Macintosh },
      
    # Billomat
    "Billomat" =>
      { :type => :ApiClient, :name => :Billomat, :version => nil, :os_name => nil, :os_version => nil, :platform => nil },
    
    # All.mite
    "All.mite-v1.4.0.0" =>
      { :type => :ApiClient, :name => :"All.mite", :version => "1.4.0.0", :os_name => nil, :os_version => nil, :platform => nil },
      
    # Standard mite clients
    "mite.php/v1.2" =>
      { :type => :ApiClient, :name => :"mite.php", :version => "v1.2", :os_name => nil, :os_version => nil, :platform => nil },
    "mite.desk/1.2.14" =>
      { :type => :ApiClient, :name => :"mite.desk", :version => "1.2.14", :os_name => nil, :os_version => nil, :platform => nil },
    "mite-rb/0.3.0" =>
      { :type => :ApiClient, :name => :"mite-rb", :version => "0.3.0", :os_name => nil, :os_version => nil, :platform => nil },
    "jmite/0.1" =>
      { :type => :ApiClient, :name => :"jmite", :version => "0.1", :os_name => nil, :os_version => nil, :platform => nil },
    "Redmine2mite/v1.2.1" =>
      { :type => :ApiClient, :name => :"Redmine2mite", :version => "v1.2.1", :os_name => nil, :os_version => nil, :platform => nil },
    "Mantis2mite/v1.2.4" =>
      { :type => :ApiClient, :name => :"Mantis2mite", :version => "v1.2.4", :os_name => nil, :os_version => nil, :platform => nil },
    "GrandTotal/1.6.5b2 CFNetwork/454.11.5 Darwin/10.6.0 (i386) (iMac11%2C1)" =>
      { :type => :ApiClient, :name => :GrandTotal, :version => "1.6.5b2", :os_name => :MacOSX, :os_version => "10.6.6", :platform => :Macintosh },
    "GrandTotal1.6.4 CFNetwork/438.16 Darwin/9.8.0 (i386) (MacBook5%2C2)" =>
      { :type => :ApiClient, :name => :GrandTotal, :version => "1.6.4", :os_name => :MacOSX, :os_version => "10.5.8", :platform => :Macintosh },
    "centralstationcrm" =>
      { :type => :ApiClient, :name => :centralstationcrm, :version => nil, :os_name => nil, :os_version => nil, :platform => nil },
    "Mite-on-rails/0.0.1" =>
      { :type => :ApiClient, :name => :"Mite-on-rails", :version => "0.0.1", :os_name => nil, :os_version => nil, :platform => nil },
    "git2mite/0.0.1" =>
      { :type => :ApiClient, :name => :git2mite, :version => "0.0.1", :os_name => nil, :os_version => nil, :platform => nil },
      
    # mite.go
    "mite.go/1.0 CFNetwork/459 Darwin/10.0.0d3" =>
      { :type => :ApiClient, :name => :"mite.go", :version => "1.0", :os_name => :iOS, :os_version => nil, :platform => :iPhone },
    "mite.go/1.1 (iPhone1,2; iPhone OS 4.2.1; de)" =>
      { :type => :ApiClient, :name => :"mite.go", :version => "1.1", :os_name => :iOS, :os_version => "4.2.1", :platform => :iPhone },
      
    # hearttp
    "hearttp/0.0.1" =>
      { :type => :HttpChecker, :name => :"hearttp", :version => "0.0.1", :os_name => nil, :os_version => nil, :platform => nil}
  }
  
  EXAMPLES_MITE.each do |string, values|
    context "when parsing #{string.inspect}" do
      let(:user_agent) { Aua.parse(string) }
      values.each do |key, value|
        it "should return #{value} for #{key}" do
          user_agent.send(key).should eql(value)
        end
      end
    end
  end
  
end

