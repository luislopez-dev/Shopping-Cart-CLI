# frozen_string_literal: true

require './config/database/db_server'

# Data access object for Product collection
class ProductDAO
  def initialize
    @db = DBServer.new
    @product = @db.select_collection('products')
  end

  def index
    products = []
    @product.find.each do |document|
      products.push(document)
    end
    products
  end
end
