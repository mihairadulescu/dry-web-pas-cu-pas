require "rom-sql"

module ROM
  class Relation
    # Monkey patch ROM::SQL to support query logs until an official API is available
    module Instrumentation
      def self.included(klass)
        klass.option :notifications, reader: true, optional: false, default: proc {
          Ingestellar::Container[:notifications]
        }
      end

      def to_a
        notifications.instrument(:sql, name: name.relation, query: dataset.sql) do
          super
        end
      end
    end

    SQL::Relation.include(Instrumentation)
  end
end
