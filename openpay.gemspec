# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'version'

Gem::Specification.new do |spec|
  spec.name          = "openpay_copemx"
  spec.version       = Openpay::VERSION
  spec.authors       = ["Openpay","ronnie_bermejo"]
  spec.email         =  ["hola@openpay.mx"]
  spec.description   = %q{ruby client for Openpay API services (version 3.0.0). Is a copy from the original Openpay gem but the version 3 there is no published yet, in this version is enable the use for different countries.}
  spec.summary       = %q{ruby api for openpay resources}
  spec.homepage      = "https://github.com/jazznava/openpay-ruby"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ['lib','lib/openpay','openpay','.']

  spec.add_runtime_dependency 'rest-client'  , '~>2.0'
  spec.add_runtime_dependency 'json', '>= 1.8'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'json_spec'
  spec.post_install_message = 'Thanks for installing openpay. Enjoy!'

  spec.required_ruby_version     = '>= 2.1.0'
end
