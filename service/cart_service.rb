require './service/product_service'

class CartService
  @@products = []

  def initialize
    @product_service = ProductService.new
  end

  def add(id)
    @@products << id
  end

  def all
    @product_service.index(@@products)
  end

  def delete(id)
    @@products.delete(id)
  end

  def clear
    @@products.clear
  end

end
