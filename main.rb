# frozen_string_literal: true

require './config/CLI/cli_server'

# main class
class Main
  @cli = CLIServer.new
  def self.run_cli
    @cli.start
  end
end

# Start command line interface
Main.run_cli
