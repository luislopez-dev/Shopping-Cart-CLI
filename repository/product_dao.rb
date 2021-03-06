# frozen_string_literal: true

require './config/database/db_client'

# Data access object for Product collection
class ProductDAO
  def initialize
    @db = DBClient.new
    @product = @db.select_collection('products')
  end

  def all
    @product.find.map { |document| document }
  end

  def index(ids)
    bson_ids = ids.map { |item| BSON.ObjectId(item) }
    query = @product.find({ '_id': { '$in': bson_ids } })
    query.map { |product| product }
  end

  def delete(id)
    @product.delete_one({ "_id": BSON.ObjectId(id) })
  end

  def find_by_id(id)
    @product.find({ "_id": BSON.ObjectId(id) }).first
  end

  def create(name, price, brand)
    doc = {
      name: name,
      price: price,
      brand: brand
    }
    @product.insert_one(doc)
  end
end
