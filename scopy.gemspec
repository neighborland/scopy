# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scopy/version'

Gem::Specification.new do |spec|
  spec.name          = "scopy"
  spec.version       = Scopy::VERSION
  spec.authors       = ["Tee Parham"]
  spec.email         = ["tee@neighborland.com"]
  spec.description   = %q{Rails ActiveRecord model concerns for common scopes}
  spec.summary       = %q{Rails ActiveRecord common utility scopes for id, created_at, and name}
  spec.homepage      = "https://github.com/neighborland/scopy"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 1.9.3"

  spec.add_dependency "activerecord", ">= 3.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "minitest", "~> 4.7"
  spec.add_development_dependency "mocha", "~> 0.14"
  spec.add_development_dependency "sqlite3", "~> 1.3"
end
