# frozen_string_literal: true

require_relative "lib/descent_demosaic/version"

Gem::Specification.new do |spec|
  spec.name          = "descent_demosaic"
  spec.version       = DescentDemosaic::VERSION
  spec.authors       = ["Michael Emhofer"]
  spec.email         = ["michael@emhofer.net"]

  spec.summary       = "A gem that can be used to demosaic images from the Mars 2020 Descent-stage \"down look\" camera."
  spec.homepage      = "https://github.com/michaelem/descent_demosaic"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/michaelem/descent_demosaic"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "chunky_png", "~> 1.4"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
