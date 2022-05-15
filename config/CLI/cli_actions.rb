# frozen_string_literal: true

require 'io/console'
require './service/product_service'
require './service/cart_service'
require 'terminal-table'

# Actions / Methods for command line interface
module CLIActions
  def show_products
    products = @product_service.all
    rows = []
    products.each_with_index do |item, idx|
      rows << [idx + 1, item['name'], "Q#{item['price']}", item['brand'], item['_id']]
    end
    puts Terminal::Table.new :title => "Productos", :headings => ['', 'Nombre', 'Precio', 'Marca', 'ID'], :rows => rows
  end

  def create_product
    puts 'Enter product name:'
    name = gets.chomp
    puts 'Enter product price:'
    price = gets.chomp
    puts 'Enter product brand'
    brand = gets.chop
    @product_service.create(name, price, brand)
    puts 'Product successfully created'
  end

  def delete_product
    puts 'Enter product ID'
    id = gets.chomp
    @product_service.delete(id)
    puts 'Product successfully deleted'
  end

  def find_product_by_id
    puts 'Enter the product ID'
    id = gets.chomp
    product = @product_service.find_by_id(id)
    rows = [[product['name'], product['price'], product['brand'], product['_id']]]
    puts Terminal::Table.new :headings => ['Nombre', 'Precio', 'Marca', 'ID'], :rows => rows
  end

  def add_to_cart
    puts 'Enter product ID'
    id = gets.chomp
    @cart_service.add(id)
    show_cart
    puts 'Product successfully added to cart'
  end

  def show_cart
    products = @cart_service.all
    rows = []
    products.each_with_index do |item, idx|
      rows << [idx + 1, item['name'], "Q#{item['price']}", item['brand'], item['_id']]
    end
    puts Terminal::Table.new :title => 'Carito', :headings => ['', 'Nombre', 'Precio','Marca', 'Identificador'], :rows => rows
  end

  def remove_from_cart
    puts 'Enter product ID'
    id = gets.chomp
    @cart_service.delete(id)
    show_cart
    puts 'Product successfully removed from cart'
  end

  def clear_cart
    @cart_service.clear
    puts 'Cart successfully cleared'
    show_cart
  end

  def show_order
    products = @cart_service.all
    rows = []
    sub_total = 0
    products.each do |item|
      rows << [item['name'], "Q#{item['price']}"]
      sub_total += item['price'].to_f
    end
    taxes = ((5 * sub_total) / 100).round(2) # 5% of sub total
    shipping = 30.00
    total = (sub_total + shipping + taxes).round(2)
    sub_total_row = ['SUB TOTAL', "Q#{sub_total}"]
    shipping_row = ['ENVIO', "Q#{shipping}"]
    taxes_row = ['IMPUESTOS', "Q#{taxes}"]
    total_row = ['TOTAL', "Q#{total}"]
    rows.push(sub_total_row, shipping_row, taxes_row, total_row)
    puts Terminal::Table.new :title => 'Orden de la compra', :rows => rows
  end

  def empty
    puts 'Enter a command or enter "exit" to leave'
  end

  def clear
    $stdout.clear_screen
  end
end
