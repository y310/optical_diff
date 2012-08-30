# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require 'optical_diff/version'

Gem::Specification.new do |gem|
  gem.authors       = ["Yusuke Mito"]
  gem.email         = ["y310.1984@gmail.com"]
  gem.description   = %q{This gem can check whether HTMLs are optically the same or not by ignoring specified html elements by parsing input as HTML.}
  gem.summary       = %q{This gem can check whether HTMLs are optically the same or not by ignoring specified html elements by parsing input as HTML.}
  gem.homepage      = "https://github.com/y310/optical_diff"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "optical_diff"
  gem.require_paths = ["lib"]
  gem.version       = OpticalDiff::VERSION

  gem.add_dependency 'diffy', '~> 2.0'
  gem.add_dependency 'nokogiri', '~> 1.5'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'guard-rspec'
end
