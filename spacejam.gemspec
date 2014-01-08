# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spacejam/version'

Gem::Specification.new do |spec|
  spec.name          = "spacejam"
  spec.version       = Spacejam::VERSION
  spec.authors       = ["Colin Mitchell"]
  spec.email         = ["colin@muffinlabs.com"]
  spec.description   = %q{Check on the status of a website}
  spec.summary       = %q{Check on the status of a website}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.2.1"
  spec.add_dependency "curb"
end
