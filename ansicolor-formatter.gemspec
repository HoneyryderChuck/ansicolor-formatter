# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ansicolor/formatter/version',__FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tiago Cardoso"]
  gem.email         = ["cardoso_tiago@hotmail.com"]
  gem.description   = File.read 'README.md'
  gem.summary 	    = "process string into outputable formats, like html or json"
  gem.author        = ["Tiago Cardoso"]
  gem.homepage      = "https://github.com/libnoc_grp/noc-colors/"

  gem.platform 	    = Gem::Platform::RUBY
  gem.required_ruby_version = '>= 2.0.0'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{|path| File.basename(path) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- test/*`.split("\n")
  gem.name          = "noc-colors"
  gem.require_paths = ["lib"]
  gem.version       = ANSIColor::Formatter::VERSION
  gem.add_dependency             'term-ansicolor',     ">= 1.2.2"
  gem.add_development_dependency 'rspec',              "~> 3.0.0"
  gem.add_development_dependency 'rspec-html-matchers',"~> 0.7.0"
  gem.add_development_dependency 'rspec-json_expectations', "~> 1.4.0"
  gem.add_development_dependency 'rake',               "~> 10.1.0"  
  gem.add_development_dependency 'yard',               "~> 0.8.7"
  gem.add_development_dependency 'simplecov',          "~> 0.7.1"
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-byebug'
end



