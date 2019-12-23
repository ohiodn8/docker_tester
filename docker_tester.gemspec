lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "docker_tester/version"

Gem::Specification.new do |spec|
  spec.name          = "docker_tester"
  spec.version       = DockerTester::VERSION
  spec.authors       = ["Odion Ohio"]
  spec.email         = ["ohiodn8@gmail.com"]

  spec.summary       = "Ruby gem to check to see if docker is installed and if docker-api works"
  spec.description   = "Ruby gem to check to see if docker is installed and if docker-api works"
  spec.homepage      = "http://www.gitub.com/ohiodn8/docker_tester"

  spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/ohiodn8/docker_tester"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.github.com/ohiodn8/docker_tester"
  spec.metadata["changelog_uri"] = "https://www.github.com/ohiodn8/docker_tester/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "docker-api", "~> 1.28"  
end
