# frozen_string_literal: true

require './repository/product_dao'

# Service layer for Product Data access object
class ProductService
  def initialize
    @product_dao = ProductDAO.new
  end

  def index
    @product_dao.index
  end
end
