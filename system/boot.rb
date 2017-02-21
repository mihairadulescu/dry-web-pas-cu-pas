require "byebug" if ENV["RACK_ENV"] == "development"
require "pry" if ENV["RACK_ENV"] == "development"

require_relative "ingestellar/container"

Ingestellar::Container.finalize!

require "ingestellar/application"

require "ingestellar/transactions"
Ingestellar::Container.require "transactions/**/*.rb"
