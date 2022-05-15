# frozen_string_literal: true

require './config/CLI/cli_actions'

# Command line interface server class
class CLIServer

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
        show_products # Display all products available
      when 'create_product'
        create_product # Create product
      when 'delete_product'
        delete_product # Delete product
      when 'find_product_by_id'
        find_product_by_id # Find product by it's identifier
      when 'add_to_cart'
        add_to_cart # Add product to cart
      when 'show_cart'
        show_cart # Display cart
      when 'remove_from_cart'
        remove_from_cart # Remove product from cart
      when 'clear_cart'
        clear_cart # Clear cart
      when 'show_order'
        show_order # Display order
      when ''
        empty # Display warning message
      when 'clear' # Clear console
        clear
      when 'exit' # Exit command line interface
        break
      else
        puts 'Command not found'
      end
    end
  end
end
