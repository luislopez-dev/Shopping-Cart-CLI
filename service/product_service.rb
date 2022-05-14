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
end
