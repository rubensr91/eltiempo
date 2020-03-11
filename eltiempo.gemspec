require_relative 'lib/eltiempo/version'

Gem::Specification.new do |spec|
  spec.name          = "eltiempo"
  spec.version       = Eltiempo::VERSION
  spec.authors       = ["Ruben"]
  spec.email         = ["rubensere@gmail.com"]

  spec.summary       = "CLI"
  spec.description   = "CLI in ruby to know the weather of the cities of Barcelona"
  spec.homepage      = "https://github.com/rubensr91/eltiempo"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
