# frozen_string_literal: true

require './config/database'

# Data access object for Product collection
class ProductDAO
  @collection_name = "products"
  def initialize
    @db = Database.new
    @product = @db.select_collection("products")
  end

  def index
    products = []
    @product.find.each do |document|
      products.push(document)
    end
    products
  end
end
