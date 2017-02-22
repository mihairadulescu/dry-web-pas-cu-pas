require 'dry/web/umbrella'
require_relative 'settings'

module Ingestellar
  class Container < Dry::Web::Umbrella
    configure do
      config.name = :ingestellar
      config.default_namespace = 'ingestellar'
      config.settings_loader = Ingestellar::Settings
      config.listeners = true

      config.auto_register = %w(
        lib/persistence
        lib/operations
        lib/entities
      )
    end

    load_paths! 'lib', 'system'

    def self.settings
      config.settings
    end
  end
end
