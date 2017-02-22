
module Persistence
  module Relations
    class IngestEntries < ROM::Relation[:sql]
      schema(:ingest_entry, infer: true)
    end
  end
end
