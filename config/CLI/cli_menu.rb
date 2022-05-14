# frozen_string_literal: true

require 'io/console'
require './service/product_service'
require 'terminal-table'

# Module for command line interface menu
module CLIMenu

  def initialize
    @product_service = ProductService.new
  end

  def start
    puts 'Welcome to shopping cart CLI'
    loop do
      input = gets.chomp
      case input
      when 'all' # Display all products
        products = @product_service.all
        rows = []
        products.each_with_index do |item, idx|
          rows << [idx + 1, item['name'], item['price'], item['stock'], item['_id']]
        end
        table = Terminal::Table.new :title => "Productos", :headings => ['', 'Nombre', 'Precio', 'Unidades disponibles', 'Identificador'], :rows => rows
        puts table
      when 'delete'
        puts 'Enter product ID'
        id = gets.chomp
        puts id
      when 'find_by_price'
        puts 'Enter the maximum price'
        max_price = gets.chomp
        puts "Enter the minimun price"
        min_price = gets.chomp
      when 'find_by_name'
        puts 'Enter name: '
        name = gets.chomp
      when 'find_by_id'
        puts 'Enter product ID'
        id = gets.chomp
        puts id
      when 'create'
        puts 'Enter product name: '
        name = gets.chomp
        puts 'Enter product price: '
        price = gets.chomp
        puts 'Enter product initial Stock'
        stock = gets.chop
        puts 'Product succesfully created'
      when 'cart'
        puts 'all items in cart'
      when 'add_to_cart'
        puts 'Enter product ID'
        id = gets.chomp
      when 'get_order'
        puts 'Order'
      when 'checkout'
        puts 'Enter shipping address'
        address = gets.chomp
        puts 'Enter your credit card number:'
        cc = gets.chomp
        puts 'Enter the credit card CCV code'
        ccv = gets.chomp
        puts 'Enter your email'
        email = gets.chomp
        puts 'Your invoice'
      when ''
        puts 'Enter a command o enter "exit" to leave'
      when 'clear'
        $stdout.clear_screen
      when 'exit'
        break
      else
        puts 'Command not found'
      end
    end
  end
end
