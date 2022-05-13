require 'securerandom'
require './src/services/product_service'

class ProductDAO

  def initialize(product_service: ProductService)
    @service = ProductService.new
  end

  def index
    @service.index
  end

  def create(product)
    @service.create(product)
  end

  def to_hash
    hash = {}
    self.instance_variables.each do |var|
      hash[var.to_s.delete("@")] = self.instance_variable_get(var)
    end
    hash
  end

end
