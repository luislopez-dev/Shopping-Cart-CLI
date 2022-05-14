# frozen_string_literal: true

require 'mongo'

# Main lass for database handling
class DBServer
  #  @url = ENV['db_url']

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
