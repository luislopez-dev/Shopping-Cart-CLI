# frozen_string_literal: true

require 'mongo'

# Main lass for database management
class DBServer
  @@url = ENV['DB_URL']
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
