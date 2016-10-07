# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'table_transformer/version'

Gem::Specification.new do |spec|
  spec.name          = "table_transformer"
  spec.version       = TableTransformer::VERSION
  spec.authors       = ["Akito Ueno"]
  spec.email         = ["satsudai200411078@yahoo.co.jp"]

  spec.summary       = %q{This tool transform from array or hash data to table data.}
  spec.description   = %q{This tool transform from array or hash data to table data.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
