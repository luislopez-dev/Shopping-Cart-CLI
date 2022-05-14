# frozen_string_literal: true

require 'io/console'
require './service/product_service'
require './service/cart_service'
require 'terminal-table'

# Actions / Methods for command line interface
module CLIActions
  def all
    products = @product_service.all
    rows = []
    products.each_with_index do |item, idx|
      rows << [idx + 1, item['name'], item['price'], item['stock'], item['_id']]
    end
    table = Terminal::Table.new :title => "Productos", :headings => ['', 'Nombre', 'Precio', 'Unidades disponibles', 'Identificador'], :rows => rows
    puts table
  end

  def delete
    puts 'Enter product ID'
    id = gets.chomp
    @product_service.delete(id)
    puts 'Product successfully deleted'
  end

  def find_by_price
    puts 'Enter the maximum price'
    max_price = gets.chomp
    puts "Enter the minimun price"
    min_price = gets.chomp
  end

  def find_by_id
    puts 'Enter product ID'
    id = gets.chomp
    product = @product_service.find_by_id(id)
    rows = [[product['name'], product['price'], product['stock'], product['_id']]]
    table = Terminal::Table.new :headings => ['Nombre', 'Precio', 'Unidades disponibles', 'Identificador'], :rows => rows
    puts table
  end

  def create
    puts 'Enter product name: '
    name = gets.chomp
    puts 'Enter product price: '
    price = gets.chomp
    puts 'Enter product initial Stock'
    stock = gets.chop
    @product_service.create(name, price, stock)
    puts 'Product successfully created'
  end

  def cart
    puts 'all items in cart'
    @cart_service.list
  end

  def add_to_cart
    puts 'Enter product ID'
    id = gets.chomp
    @cart_service.add(id)
    puts 'Product successfully added to cart'
  end

  def show_cart
    products = @cart_service.all
    rows = []
    products.each_with_index do |item, idx|
      rows << [idx + 1, item['name'], item['price'], item['_id']]
    end
    table = Terminal::Table.new :title => "Carito", :headings => ['', 'Nombre', 'Precio', 'Identificador'], :rows => rows
    puts table
  end

  def remove_from_cart
    puts 'Enter product ID'
    id = gets.chomp
    @cart_service.delete(id)
    'Product successfully removed from cart'
  end

  def get_order
    puts 'Order'
    table = Terminal::Table.new :title => "Orden", :headings => ['', '', '', 'Total'], :rows => rows
    puts table
  end

  def checkout
    puts 'Enter shipping address'
    address = gets.chomp
    puts 'Enter your credit card number:'
    cc = gets.chomp
    puts 'Enter the credit card CCV code'
    ccv = gets.chomp
    puts 'Enter your email'
    email = gets.chomp
    puts 'Your invoice'
  end

  def empty
    puts 'Enter a command or enter "exit" to leave'
  end

  def clear
    $stdout.clear_screen
  end
end
