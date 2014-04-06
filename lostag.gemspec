# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lostag/version'

Gem::Specification.new do |spec|
  spec.name          = "lostag"
  spec.version       = Lostag::VERSION
  spec.authors       = ["gregory"]
  spec.email         = ["greg2502@gmail.com"]
  spec.description   = %q{Handle all the paiment logic}
  spec.summary       = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rack", "~> 1.5.2"
  spec.add_dependency "grape", "~> 0.6.1"
  spec.add_dependency 'json'
  spec.add_dependency "roar"
  spec.add_dependency "wisper", "~> 1.2.1"
  spec.add_dependency "interactor", "~> 2.1.0"
  spec.add_dependency "charlatan", "~> 0.1.0"
  spec.add_dependency "hashie", " ~> 2.0.5"
  spec.add_dependency "sendgrid", " ~> 1.2.0"
  spec.add_dependency "pony", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rack-test"
end
