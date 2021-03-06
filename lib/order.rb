require 'awesome_print'
require 'csv'



# manually choose the data from the first line of the CSV file and ensure you can create a new instance of your Order using that data

module Grocery


  class Order
    attr_reader :id, :products
    # id: Integer, represents unique identifier
    # input_products: hash that represents products with keys of product name and values of price (Float)

    def initialize(id, products)
      @id = id
      @products = products
    end

    # "../support/orders.csv " #change path back to this when opening this file in ruby instead of through rake


    def self.all
      array_of_orders = []
      CSV.open("support/orders.csv", 'r').each do |line|
        # for each line I need to take the index[0] and make it a key of a hash and the value of that hash is then another hash (which is index[1] of the array) with key: product name , value: product price
        # first step is turning two elements of an array into a hash. second step is taking the value of that hash and turning it into another hash

        product_list = line[1].split(';')
        product_hash = {}
        product_list.each do |item|
          product = item.split(':')
          product_hash[product[0]] = product[1]
        end
        array_of_orders << Grocery::Order.new(line[0].to_i, product_hash)
      end
      array_of_orders
    end

    def self.find(id)
      # returns an instance of Order where the value of the id field in the CSV matches the passed parameter.
      #to call this Class method: Grocery::Order.find(id)

      all_orders = Grocery::Order.all

      order = nil

      all_orders.each do |single_order|

        if single_order.id == id
          order = single_order
        end
      end
      return order
    end



    def total
      subtotal = @products.values.sum
      sum = subtotal + (subtotal * 0.075).round(2)
      return sum
    end

    def add_product(product_name, product_price)

      return false if @products.has_key?(product_name)
      @products[product_name] = product_price
      return true
    end #end of add_product method


    #	• Add a remove_product method to the Order class which will take in one parameter, a product name, and remove the product from the collection
		# It should return true if the item was successfully remove and false if it was not

    def remove_product(product_name)
      #p @products
      if @products.key?(product_name)
        @products.delete(product_name)
        return true
      else
        return false
      end
    end

  end #end of Order class


end #end of module
