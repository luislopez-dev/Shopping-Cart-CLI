#require 'yaml'
#require 'terminal-table'
require '././config/database'

class ProductService

  def initialize
    @db = Database.connect
  end

  def index
    products = []
    @db.find.each { |product| products.push(product) }
    products
  end

  def create(product)
    doc = {name:"cocacola", price: 745, stock: 47}
    @db.insert_one(doc)
  end

end