Ingestellar::Container.finalize :monitor do |_container|
  init do
    require 'dry/monitor'
    require 'rom/instrumentation'
  end

  start do
    Dry::Monitor::SQL::Logger.new(logger).subscribe(notifications)
  end
end
