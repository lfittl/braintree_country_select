# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "braintree_country_select/version"

Gem::Specification.new do |s|
  s.name        = "braintree_country_select"
  s.version     = BraintreeCountrySelect::VERSION
  s.authors     = ["Lukas Fittl"]
  s.email       = ["lukas@fittl.com"]
  s.homepage    = ""
  s.summary     = %q{Braintree Country Select Plugin}
  s.description = %q{Rails Helper to get an HTML select list of countries. Uses country data from the braintree gem.}
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "braintree"
  s.add_runtime_dependency "braintree"
end
