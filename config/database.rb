require 'mongo'

class Database

  @@uri = ENV["database_url"]

  def initialize
    @connection = connect
  end

  private
  def connect
    Mongo::Client.new(@@uri)
  end

  def select_collection(collection)
    a = "a"
    collection = "#{a}"
    @connection[:]
  end

end
