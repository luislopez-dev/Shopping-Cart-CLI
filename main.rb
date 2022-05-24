# frozen_string_literal: true

require './controller/CLI/cli_controller'

# main class
class Main
  @cli = CLIController.new
  def self.run_cli
    @cli.start
  end
end

# Start command line interface
Main.run_cli
