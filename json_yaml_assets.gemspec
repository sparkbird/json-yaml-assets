$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "json_yaml_assets/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "json_yaml_assets"
  s.version     = JsonYamlAssets::VERSION
  s.authors     = ["Julian Scheid"]
  s.email       = ["hello@sparkbird.com"]
  s.homepage    = "https://github.com/sparkbird/json_yaml_assets"
  s.summary     = "YAML to JSON conversion for the Rails 3 asset pipeline."
  s.description = %q{Transparently converts YAML files named foo.json.yaml
to JSON files named foo.json.  Useful for hand-written files since YAML
files are easier to edit and maintain compared to JSON.}

  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "README.md"]

  s.add_dependency "rails", ">= 3.2"
end
