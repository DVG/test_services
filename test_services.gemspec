# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'test_services/version'

Gem::Specification.new do |spec|
  spec.name          = "test_services"
  spec.version       = TestServices::VERSION
  spec.authors       = ["Bradley Temple"]
  spec.email         = ["bradley.temple@gmail.com"]
  spec.summary       = %q{TODO: Service Objects for Integration Tests}\
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "capybara"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
