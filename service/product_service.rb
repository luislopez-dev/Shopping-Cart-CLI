# frozen_string_literal: true

require './repository/product_dao'

# Service layer for Product Data access object
class ProductService
  def initialize
    @product_dao = ProductDAO.new
  end

  def all
    @product_dao.all
  end

  def index(products)
    @product_dao.index(products)
  end

  def delete(id)
    @product_dao.delete(id)
  end

  def create(name, price, stock)
    @product_dao.create(name, price, stock)
  end

  def find_by_id(id)
    @product_dao.find_by_id(id)
  end
end
