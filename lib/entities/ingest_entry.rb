require 'dry-struct'
module Entities
  module Types
    include Dry::Types.module
  end
  class IngestEntry < Dry::Struct
    attribute :id, Types::Int
    attribute :package_name, Types::String.optional
  end
end
