# frozen_string_literal: true

require './config/cli_server'
# main class
class Main
  @cli = CLI_server.new
  def self.run_cli
    counter
    @cli.start
  end
end

# Start command line interface
Main.run_cli
