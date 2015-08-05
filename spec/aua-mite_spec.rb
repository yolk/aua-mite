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
    "mite.air/0.93 (Windows Vista)" =>
      { :type => :ApiClient, :name => :"mite.air", :version => "0.93", :os_name => :Windows, :os_version => "V", :platform => :Windows },
    "mite.air/0.93 (Mac OS 10.5.8)" =>
      { :type => :ApiClient, :name => :"mite.air", :version => "0.93", :os_name => nil, :os_version => nil, :platform => nil },
    "mite.enterprise/0.1 (simple)" =>
      { :type => :ApiClient, :name => :"mite.enterprise", :version => "0.1", :os_name => nil, :os_version => nil, :platform => nil },
    "mite.mobile/1.2 CFNetwork/485.12.7 Darwin/10.4.0" =>
      { :type => :ApiClient, :name => :"mite.mobile", :version => "1.2", :os_name => :MacOSX, :os_version => "10.6.4", :platform => :Macintosh },
    "mite.net - connector/1.2.1.0 (Microsoft Windows NT 6.1.7600.0)" =>
      { :type => :ApiClient, :name => :"mite.net", :version => "1.2.1.0", :os_name => :Windows, :os_version => "NT 6.1.7600.0", :platform => :Windows },
    "TimeLog/4.5.7 CFNetwork/454.11.5 Darwin/10.6.0 (i386) (MacBookPro6%2C1)" =>
      { :type => :ApiClient, :name => :TimeLog, :version => "4.5.7", :os_name => :MacOSX, :os_version => "10.6.6", :platform => :Macintosh },

    # mite.go
    "mite.go/1.0 CFNetwork/459 Darwin/10.0.0d3" =>
      { :type => :ApiClient, :name => :"mite.go", :version => "1.0", :os_name => :iOS, :os_version => nil, :platform => :iPhone },
    "mite.go/1.1 (iPhone1,2; iPhone OS 4.2.1; de)" =>
      { :type => :ApiClient, :name => :"mite.go", :version => "1.1", :os_name => :iOS, :os_version => "4.2.1", :platform => :iPhone },

    # Anytime
    "anytime/1.0 (iPhone; iOS 7.0.2; Scale/2.00)" =>
      { :type => :ApiClient, :name => :Anytime, :version => "1.0", :os_name => :iOS, :os_version => "7.0.2", :platform => :iPhone },
    "Anytime 1.0 (iPhone Simulator; iPhone OS 4.2; en_US)" =>
      { :type => :ApiClient, :name => :Anytime, :version => "1.0", :os_name => :iOS, :os_version => "4.2", :platform => :iPhone },
    "Anytime 1.0 (iPhone; iPhone OS 4.2.1; de_DE)" =>
      { :type => :ApiClient, :name => :Anytime, :version => "1.0", :os_name => :iOS, :os_version => "4.2.1", :platform => :iPhone },

    # hearttp
    "hearttp/0.0.1" =>
      { :type => :HttpChecker, :name => :"hearttp", :version => "0.0.1", :os_name => nil, :os_version => nil, :platform => nil},

    # Eon
    "Eon/223 CFNetwork/520.3.2 Darwin/11.3.0 (x86_64) (iMac12%2C2)" =>
      { :type => :ApiClient, :name => :"Eon", :version => "223", :os_name => :Darwin, :os_version => "11.3.0", :platform => :Darwin},
    "Eon/316 CFNetwork/520.3.2 Darwin/11.3.0 (x86_64) (MacBookPro4%2C1)" =>
      { :type => :ApiClient, :name => :"Eon", :version => "316", :os_name => :Darwin, :os_version => "11.3.0", :platform => :Darwin},
    "Eon/331 CFNetwork/520.3.2 Darwin/11.3.0 (x86_64) (MacBookPro8%2C2)" =>
      { :type => :ApiClient, :name => :"Eon", :version => "331", :os_name => :Darwin, :os_version => "11.3.0", :platform => :Darwin},

    # mighty-mite-statistics
    "mighty-mite-statistics/0.0.1" =>
      { :type => :ApiClient, :name => :"mighty-mite-statistics", :version => "0.0.1", :os_name => nil, :os_version => nil, :platform => nil},

    # MightyMite
    "MightyMite 2.3.2 (Macintosh; Mac OS X 10.8.4; de_AT)" =>
      { :type => :ApiClient, :name => :MightyMite, :version => "2.3.2", :os_name => nil, :os_version => nil, :platform => nil},
    "mighty-mite/0.1 CFNetwork/672.0.2 Darwin/12.5.0" =>
      { :type => :ApiClient, :name => :MightyMite, :version => "0.1", :os_name => :MacOSX, :os_version => "10.8.5", :platform => :Macintosh},

    # Clockson
    "Clockson/1.01 (iPhone; iOS 7.1.1; Scale/2.00)" =>
      { :type => :ApiClient, :name => :Clockson, :version => "1.01", :os_name => :iOS, :os_version => "7.1.1", :platform => :iPhone },
    "Clockson/1.01 (iPhone; iOS 7.1.1; Scale/2.00),clockson/v1.0 (http://ninjaconcept.com/clockson)" =>
      { :type => :ApiClient, :name => :Clockson, :version => "1.01", :os_name => :iOS, :os_version => "7.1.1", :platform => :iPhone },
    "Clockson/1.0 CFNetwork/672.0.8 Darwin/14.0.0" =>
      { :type => :ApiClient, :name => :Clockson, :version => "1.0", :os_name => :Darwin, :os_version => "14.0.0", :platform => :Darwin },
    "Clockson/1.0 (iPad; iOS 7.1.1; Scale/2.00)" =>
      { :type => :ApiClient, :name => :Clockson, :version => "1.0", :os_name => :iOS, :os_version => "7.1.1", :platform => :iPhone },
    "Clockson/1.0 (iPhone; iOS 8.0.2; Scale/2.00)" =>
      { :type => :ApiClient, :name => :Clockson, :version => "1.0", :os_name => :iOS, :os_version => "8.0.2", :platform => :iPhone },
    "Clockson/1.1 (iPhone; iOS 9.0; Scale/2.00),clockson/v1.0 (http://ninjaconcept.com/clockson)" =>
      { :type => :ApiClient, :name => :Clockson, :version => "1.1", :os_name => :iOS, :os_version => "9.0", :platform => :iPhone },
    "Clockson/1.1 (iPhone Simulator; iOS 8.1; Scale/2.00),clockson/v1.0 (http://ninjaconcept.com/clockson)" =>
      { :type => :ApiClient, :name => :Clockson, :version => "1.1", :os_name => :iOS, :os_version => "8.1", :platform => :iPhone },
    "clockson/v0.2 (https://github.com/basiszwo)" =>
      { :type => :ApiClient, :name => :Clockson, :version => "0.2", :os_name => :iOS, :os_version => nil, :platform => :iPhone },
    "clockson/v1.0 (http://ninjaconcept.com/clockson)" =>
      { :type => :ApiClient, :name => :Clockson, :version => "1.0", :os_name => :iOS, :os_version => nil, :platform => :iPhone },

    # Misc Mobiles
     "BytepoetsMite 1.0 (iPhone; iPhone OS 6.0; de_AT)" =>
      { :type => :ApiClient, :name => :BytepoetsMite, :version => "1.0", :os_name => :iOS, :os_version => "6.0", :platform => :iPhone },
    "com.bytepoets.mightymite/1.0 (unknown, iPhone OS 6.0.2, iPhone, Scale/2.000000)" =>
      { :type => :ApiClient, :name => :BytepoetsMite, :version => "1.0", :os_name => :iOS, :os_version => "6.0.2", :platform => :iPhone },
    "com.bytepoets.MightyMite/2.3.2 (unknown)" =>
      { :type => :ApiClient, :name => :BytepoetsMite, :version => "2.3.2", :os_name => :iOS, :os_version => nil, :platform => :iPhone },
    "MightyMiteToday/1 (iPhone; iOS 8.1.1; Scale/2.00)" =>
      { :type => :ApiClient, :name => :MightyMiteToday, :version => "1", :os_name => :iOS, :os_version => "8.1.1", :platform => :iPhone },
    "MiteClocks/1.0 (iPhone; iOS 7.0.4; Scale/2.00)" =>
      { :type => :ApiClient, :name => :MiteClocks, :version => "1.0", :os_name => :iOS, :os_version => "7.0.4", :platform => :iPhone },
    "MiteClocks/1.0 CFNetwork/672.0.8 Darwin/14.0.0" =>
      { :type => :ApiClient, :name => :MiteClocks, :version => "1.0", :os_name => :Darwin, :os_version => "14.0.0", :platform => :Darwin },

    # Misc.
    "OpenResearch-Dashboard" =>
      { :type => :ApiClient, :name => :"OpenResearch-Dashboard", :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
    "Mitey" =>
      { :type => :ApiClient, :name => :Mitey, :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
    "my_app_name" =>
      { :type => :ApiClient, :name => :my_app_name, :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
    "mite_summary" =>
      { :type => :ApiClient, :name => :mite_summary, :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
    "Fire2mite/v0.9 (nils.waldherr@filemakergarage.com)" =>
      { :type => :ApiClient, :name => :Fire2mite, :version => "v0.9", :os_name => nil, :os_version => nil, :platform => nil},
    "git2mitev0.1.0(Ondrej Brinkel <info@anzui.de>)" =>
      { :type => :ApiClient, :name => :git2mite, :version => "0.1.0", :os_name => nil, :os_version => nil, :platform => nil},
    "gitlab2mitev0.0.1(Ondrej Brinkel <info@anzui.de>)" =>
      { :type => :ApiClient, :name => :git2mite, :version => "0.0.1", :os_name => nil, :os_version => nil, :platform => nil},
    "gitlab2mitev0.0.4(Ondrej Brinkel <info@anzui.de>)" =>
      { :type => :ApiClient, :name => :git2mite, :version => "0.0.4", :os_name => nil, :os_version => nil, :platform => nil},
    "jira-mite-0.1 (werding.parkside@gmail.com)" =>
      { :type => :ApiClient, :name => :jiramite, :version => "0.1", :os_name => nil, :os_version => nil, :platform => nil},
    "jira-mite" =>
      { :type => :ApiClient, :name => :jiramite, :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
    "ledger2mite/v0.1" =>
      { :type => :ApiClient, :name => :ledger2mite, :version => "v0.1", :os_name => nil, :os_version => nil, :platform => nil},
    "Mite2Excel" =>
      { :type => :ApiClient, :name => :Mite2Excel, :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
    "mite2mail" =>
      { :type => :ApiClient, :name => :mite2mail, :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
    "mite2pdf" =>
      { :type => :ApiClient, :name => :mite2pdf, :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
    "mite-backup/v1.0 (https://github.com/yolk)" =>
      { :type => :ApiClient, :name => :"mite-backup", :version => "v1.0", :os_name => nil, :os_version => nil, :platform => nil},
    "mite-backup/0.1.1" =>
      { :type => :ApiClient, :name => :"mite-backup", :version => "0.1.1", :os_name => nil, :os_version => nil, :platform => nil},
    "mite-AlfredApp integration/v0.0.1 (http://mjays.net)" =>
      { :type => :ApiClient, :name => :"mite-AlfredApp", :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
    "mite-cli" =>
      { :type => :ApiClient, :name => :"mite-cli", :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
    "MiteBoard 1.0 rv:1 (Macintosh; Mac OS X 10.6.7; de_DE)" =>
      { :type => :ApiClient, :name => :MiteBoard, :version => nil, :os_name => nil, :os_version => nil, :platform => nil},
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

