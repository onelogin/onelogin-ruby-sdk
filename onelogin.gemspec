# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "onelogin/version"

Gem::Specification.new do |spec|
  spec.name              = "onelogin"
  spec.version           = OneLogin::VERSION
  spec.platform          = Gem::Platform::RUBY
  spec.authors           = ["OneLogin"]
  spec.email             = ["support@onelogin.com"]
  spec.license           = 'MIT'
  spec.homepage          = "https://github.com/onelogin/onelogin-ruby-sdk"
  spec.rubyforge_project = %q{http://www.rubygems.org/gems/onelogin-ruby-sdk}
  spec.summary           = %q{OneLogin's Ruby SDK.}
  spec.description       = %q{OneLogin's Ruby SDK. Use this API client to interact with OneLogin's platform}
  spec.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_runtime_dependency('httparty', '>=0.13.7')
  spec.add_runtime_dependency('nokogiri', '>=1.6.3.1')

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
