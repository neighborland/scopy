source "https://rubygems.org"

group :test do
  if ENV["TRAVIS"]
    gem "coveralls", require: false
  end
end

if RUBY_VERSION < "2.2.2"
  gem "activerecord", "~> 4.0"
end

gemspec
