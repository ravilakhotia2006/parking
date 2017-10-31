# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "parking/version"

Gem::Specification.new do |spec|
  spec.name          = "parking"
  spec.version       = Parking::VERSION
  spec.authors       = ["ravilakhotia2006"]
  spec.email         = ["ravilakhotia2006@gmail.com"]

  spec.summary       = "Summary"
  spec.description   = "Description"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
