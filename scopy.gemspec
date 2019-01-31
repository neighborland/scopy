require "./lib/scopy/version"

Gem::Specification.new do |spec|
  spec.name          = "scopy"
  spec.version       = Scopy::VERSION
  spec.authors       = ["Tee Parham"]
  spec.email         = ["tee@neighborland.com"]
  spec.description   = "Rails ActiveRecord scopes for id, created_at, and name"
  spec.summary       = "Rails ActiveRecord scopes for id, created_at, and name"
  spec.homepage      = "https://github.com/neighborland/scopy"
  spec.license       = "MIT"

  spec.files         = Dir["LICENSE.txt", "README.md", "lib/**/*"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3.0"

  spec.add_dependency "activerecord", ">= 4.0"

  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "mocha", "~> 1.4"
  spec.add_development_dependency "sqlite3", "~> 1.3"
end
