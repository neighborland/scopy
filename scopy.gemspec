# coding: utf-8
require './lib/scopy/version'

Gem::Specification.new do |spec|
  spec.name          = "scopy"
  spec.version       = Scopy::VERSION
  spec.authors       = ["Tee Parham"]
  spec.email         = ["tee@neighborland.com"]
  spec.description   = %q{Rails ActiveRecord scopes for id, created_at, and name}
  spec.summary       = %q{Rails ActiveRecord scopes for id, created_at, and name}
  spec.homepage      = "https://github.com/neighborland/scopy"
  spec.license       = "MIT"

  spec.files         = Dir["LICENSE.txt", "README.md", "lib/**/*"]
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 1.9.3"

  spec.add_dependency "activerecord", ">= 3.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "mocha", "~> 1.0"
  spec.add_development_dependency "sqlite3", "~> 1.3"
end
