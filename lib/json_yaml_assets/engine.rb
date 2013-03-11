require 'multi_json'

module JsonYamlAssets

  class Engine < ::Rails::Engine

    config.json_yaml_assets = ActiveSupport::OrderedOptions.new

    class Template < Tilt::Template

      class << self
        attr_accessor :global_options
      end

      def prepare
      end

      def evaluate(scope, locals = { }, &block)
        if /.json.yaml(?:$|\.)/.match(file)
          @output ||= MultiJson.dump(YAML.load(data),
                                     Template.global_options.clone)
        else
          data
        end
      end
    end

    initializer('sprockets.json_yaml_assets',
                :group => :all,
                :after => 'sprockets.environment') do |app|
      next unless app.assets
      app.assets.register_engine '.yaml', Template
      Template.global_options = app.config.json_yaml_assets
    end
  end
end
