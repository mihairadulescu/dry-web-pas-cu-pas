require 'dry/monads/either'
require 'ingestellar/import'

module Operations
  class FetchEntries
    include Ingestellar::Import['persistence.repositories.entries']

    def call(input)
      input[:entries] = entries.listing.to_a
      Dry::Monads.Right(input)
    end
  end
end
