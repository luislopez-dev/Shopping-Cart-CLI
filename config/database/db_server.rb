# frozen_string_literal: true

require 'mongo'

# Main lass for database handling
class DBServer
  #  @@url = ENV['DB_URL']
  @@url = 'mongodb+srv://luis:jbGYgEiSL3yvIK5b@cluster0.pva0d.mongodb.net/ShoppingCartCLI?retryWrites=true&w=majority'

  def initialize
    @connection = connect
  end

  def connect
    Mongo::Client.new(@@url)
  end

  def select_collection(name)
    collection = name
    @connection[:"#{collection}"]
  end
end
