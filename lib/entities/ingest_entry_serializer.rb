require 'entities/base_serializer'

module Entities
  class IngestEntrySerializer < BaseSerializer
    attribute :id
    attribute :package_name
  end
end