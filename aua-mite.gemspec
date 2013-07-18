# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aua-mite/version"

Gem::Specification.new do |s|
  s.name        = "aua-mite"
  s.version     = AuaMite::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sebastian Munz"]
  s.email       = ["sebastian@yo.lk"]
  s.license     = 'MIT'
  s.homepage    = "https://github.com/yolk/aua-mite"
  s.summary     = %q{Extension for aua to recognize custom mite api clients by there user agent string.}
  s.description = %q{Extension for aua (https://github.com/yolk/aua) to recognize custom mite api clients by there user agent string. Not very useful for anyone outside of mite/yolk. But maybe handy as a example of extending aua.}

  s.rubyforge_project = "aua-mite"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'aua',       '>= 0.2'

  s.add_development_dependency 'rspec',       '>= 2.4.0'
  s.add_development_dependency 'guard-rspec', '>=0.1.9'
  s.add_development_dependency 'growl',       '>=1.0.3'
  s.add_development_dependency 'rb-fsevent',  '>=0.3.9'
end