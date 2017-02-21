require 'rom-repository'
require "ingestellar/repository"
require "entities/ingest_entry"

module Persistence
  module Repositories
    class Entries < Ingestellar::Repository[:ingest_entry]
      def listing(page: 1, per_page: 20)
         ingest_entry.as(Entities::IngestEntry)
      end
    end
  end
end
