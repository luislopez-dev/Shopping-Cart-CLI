# frozen_string_literal: true

require './controller/CLI/cli_actions'

# Command line interface server class
class CLIController

  include CLIActions

  def initialize
    @product_service = ProductService.new
    @cart_service = CartService.new
  end

  def start
    puts 'Welcome to shopping cart CLI!'
    loop do
      input = gets.chomp
      case input
      when 'show_products'
        show_products # Displays all available products
      when 'create_product'
        create_product # Creates a new product
      when 'delete_product'
        delete_product # Deletes product by ID
      when 'find_product_by_id'
        find_product_by_id # Finds product by ID
      when 'add_to_cart'
        add_to_cart # Add product to cart
      when 'show_cart'
        show_cart # Displays cart
      when 'remove_from_cart'
        remove_from_cart # Removes product from cart
      when 'clear_cart'
        clear_cart # Clear cart
      when 'show_order'
        show_order # Display order
      when ''
        empty # Display warning message
      when 'clear' # Clear console
        clear
      when 'exit' # Closes command line interface
        break
      else
        puts 'Command not found'
      end
    end
  end
end
