require 'mongo'

class Database

  @@uri = ENV["database_url"]

  def self.connect
    Mongo::Client.new(@@uri)
        client[:products]
  end

end
