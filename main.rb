require './src/cli_server'

class Main

  def initialize
    @cli = CLI_server.new
  end

  def init_cli
    @cli.start
  end
end

a = Main.new
a.init_cli