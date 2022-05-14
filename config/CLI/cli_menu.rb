# frozen_string_literal: true

require './config/CLI/menu_options'

# Module for command line interface menu
module CLIMenu

  include MenuOptions

  def initialize
    @product_service = ProductService.new
    @cart_service = CartService.new
  end

  def start
    puts 'Welcome to shopping cart CLI'
    loop do
      input = gets.chomp
      case input
      when 'all' # Display all products
        all
      when 'delete' # Delete product by Item
        delete
      when 'find_by_id'
        find_by_id
      when 'create'
        create
      when 'cart'
        cart
      when 'add_to_cart'
        add_to_cart
      when 'show_cart'
        show_cart
      when 'remove_from_cart'
        remove_from_cart
      when 'get_order'
        get_order
      when 'checkout'
        checkout
      when ''
        empty
      when 'clear'
        clear
      when 'exit'
        break
      else
        puts 'Command not found'
      end
    end
  end
end
