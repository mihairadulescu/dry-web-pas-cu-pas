require 'rom-repository'
require "ingestellar/repository"
require "entities/ingest_entries"

module Persistence
  module Repositories
    class Entries < Ingestellar::Repository[:ingest_entry]
      def listing(page: 1, per_page: 20)
        stuff = ingest_entry.as(Entities::IngestEntries)

      end
    end
  end
end
