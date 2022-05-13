require 'securerandom'
require './src/services/product_service'
require '../config/database'

class ProductDAO

  def initialize
    @db = Database.new
    @product = @db
  end

  def index

  end

  def create

  end

  def show

  end

  def delete

  end

  def update

  end

  def to_hash
    hash = {}
    self.instance_variables.each do |var|
      hash[var.to_s.delete("@")] = self.instance_variable_get(var)
    end
    hash
  end

end
