require 'bundler/setup'

require 'byebug' unless ENV['RACK_ENV'] == 'production'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :spec
  task default: [:spec]
rescue LoadError
end

require_relative 'system/ingestellar/container'

require 'rom/sql/rake_task'
require 'sequel'
namespace :db do
  task :setup do
    Ingestellar::Container.boot! :rom
  end

  # The following migration tasks are adapted from https://gist.github.com/kalmbach/4471560
  Sequel.extension :migration
  DB = Sequel.connect(Ingestellar::Container.settings.database_url)

  desc 'Prints current schema version'
  task :version do
    version = if DB.tables.include?(:schema_migrations)
                DB[:schema_migrations].order(:filename).last[:filename]
    end || 'not available'

    puts "Current schema version: #{version}"
  end

  namespace :structure do
    desc 'Dump database structure to db/structure.sql'
    task :dump do
      require 'uri'
      uri = URI(DB.url)

      dump = `pg_dump -h #{uri.hostname} -s -x -O #{uri.path.tr('/', '')}`
      File.open 'db/structure.sql', 'w' do |file|
        file.write dump
      end
    end
  end

  task :check_migrations_exist do
    unless Dir['db/migrate/*.rb'].any?
      puts 'No migrations found'
      exit 1
    end
  end

  # Enhance the migration task provided by ROM
  desc 'Perform migration up to latest migration available'
  task migrate: [:check_migrations_exist] do
    # Once db:migrate finishes, dump the db structure:
    Rake::Task['db:structure:dump'].execute

    # And print the current migration version:
    Rake::Task['db:version'].execute
  end

  desc 'Perform rollback to specified target'
  task :rollback, :target do |_t, args|
    Sequel::Migrator.run(DB, 'db/migrate', target: args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc 'Load seed data into the database'
  task :seed do
    seed_data = File.join('db', 'seed.rb')
    load(seed_data) if File.exist?(seed_data)
  end

  desc 'Load a small, representative set of data so that the application can start in a useful state (for development).'
  task :sample_data do
    sample_data = File.join('db', 'sample_data.rb')
    load(sample_data) if File.exist?(sample_data)
  end
end
