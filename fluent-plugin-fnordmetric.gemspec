# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "fluent-plugin-fnordmetric"
  gem.version     = File.read("VERSION").strip 
  gem.authors     = ["Eduardo Aceituno"]
  gem.email       = ["achied@gmail.com"]
  gem.homepage    = "https://github.com/achied/fluent-plugin-fnordmetric"
  gem.summary     = %q{fnordmetric plugin for fluent, an event collector}
  gem.description = %q{fnordmetric plugin for fluent, an event collector}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency "fluentd", ">= 0.10.7"
  gem.add_dependency "fnordmetric", "1.0.0"
  
  gem.add_development_dependency "rake", ">= 0.9.2"
  gem.add_development_dependency "rr", ">= 1.0.0"
end
