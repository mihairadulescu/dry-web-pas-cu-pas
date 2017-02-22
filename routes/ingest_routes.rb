require 'roda/rest_api'
require 'dry-monads'
require 'jsonapi-serializers'

module Ingestellar
  class Application
    route do |r|
      r.api do
        r.version 1 do
          r.resource :ingest do
            r.resource :discovered do
              r.index do
                r.resolve('main.transactions.fetch_entries') do |fetch_entries|
                  fetch_entries.call(fancy_name: 'mihai') do |matcher|
                    matcher.success do |value|
                      JSONAPI::Serializer.serialize(value[:entries], is_collection: true)
                    end
                    matcher.failure do
                    end
                  end
                end
              end

              r.resource :entries do |entries|
                entries.save do |atts|
                  {stuff: atts}
                end
                entries.permit :name, :status
              end

            end

          end

        end
      end
    end
  end
end
