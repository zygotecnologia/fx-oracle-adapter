# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fx/oracle_adapter/version"

Gem::Specification.new do |spec|
  spec.name          = "fx-oracle-adapter"
  spec.version       = Fx::OracleAdapter::VERSION
  spec.authors       = ["João Paulo Lethier"]
  spec.email         = ["joaopaulo.lethier@zygotecnologia.com"]
  spec.summary       = %q{Oracle adapter for Fx gem}
  spec.description   = <<-DESCRIPTION
    Adds oracle adapter to Fx gem to enable database migrations and schema
    to work with functions and triggers on applications using
    oracle as database
  DESCRIPTION
  spec.homepage      = "https://github.com/zygotecnologia/fx-oracle-adapter"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", '>= 1.5'
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", '>= 3.3'
  spec.add_development_dependency "activerecord-oracle_enhanced-adapter", "~> 6.0.0"
  spec.add_development_dependency "ruby-oci8", "~> 2.2.8"
  spec.add_development_dependency "pry"

  spec.add_dependency "activerecord", '>= 6.0.0'
  spec.add_dependency "railties", '>= 6.0.0'

  spec.required_ruby_version = "~> 2.7"
end
