# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "onelogin/api/version"

Gem::Specification.new do |s|
  s.name              = "onelogin-ruby-sdk"
  s.version           = OneLogin::Api::VERSION
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["OneLogin"]
  s.email             = ["support@onelogin.com"]
  s.license           = 'MIT'
  s.homepage          = "https://github.com/onelogin/onelogin-ruby-sdk"
  s.rubyforge_project = %q{http://www.rubygems.org/gems/onelogin-ruby-sdk}
  s.summary           = %q{OneLogin's Ruby SDK.}
  s.description       = %q{OneLogin's Ruby SDK. Use this API client to interact with OneLogin's platform}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files             = `git ls-files`.split("\n")
  s.require_paths     = ["lib"]

  s.add_runtime_dependency('httparty', '>=0.13.7')
  s.add_runtime_dependency('nokogiri', '>=1.6.3.1')

  s.required_ruby_version = '>= 1.9.3'
end
