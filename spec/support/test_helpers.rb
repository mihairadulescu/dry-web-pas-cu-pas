module TestHelpers
  module_function

  def app
    Ingestellar::Application.app
  end

  def rom
    Ingestellar::Container['persistence.rom']
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
