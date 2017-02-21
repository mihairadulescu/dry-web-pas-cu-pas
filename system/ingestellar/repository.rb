require "rom-repository"
require "ingestellar/container"
require "ingestellar/import"

Ingestellar::Container.boot! :rom

module Ingestellar
  class Repository < ROM::Repository::Root
    include Ingestellar::Import.args["persistence.rom"]
  end
end
