# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'queri/version'

Gem::Specification.new do |spec|
  spec.name          = "queri"
  spec.version       = Queri::VERSION
  spec.authors       = ["Brad Rice"]
  spec.email         = ["bradley_rice@mac.com"]
  spec.description   = %q{Queuemetrics Reporting Interface}
  spec.summary       = %q{Send requests to QM's XMLRPC client and receive human-readable responses}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.files         -= ["spec/config.yml"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
