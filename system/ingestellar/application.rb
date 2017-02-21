require "dry/web/roda/application"
require_relative "container"

module Ingestellar
  class Application < Dry::Web::Roda::Application
    configure do |config|
      config.container = Container
      config.routes = "routes".freeze
    end

    plugin :rest_api
    plugin :json

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    use Rack::Session::Cookie, key: "ingestellar.session", secret: Ingestellar::Container.settings.session_secret

    load_routes!
  end
end
