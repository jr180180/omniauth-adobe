require_relative 'lib/omniauth/adobe/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-adobe"
  spec.version       = Omniauth::Adobe::VERSION
  spec.authors       = ["John Sanchez"]
  spec.email         = ["jr180180@gmail.com"]

  spec.summary       = %q{Adobe.io strategy for OmniAuth}
  spec.description   = %q{Adobe.io strategy for OmniAuth}
  spec.homepage      = "https://github.com/jr180180/omniauth-adobe"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.5'
end