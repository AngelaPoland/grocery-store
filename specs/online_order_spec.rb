require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

# TODO: uncomment the next line once you start wave 3
require_relative '../lib/online_order'
# You may also need to require other classes here

# Because an OnlineOrder is a kind of Order, and we've
# already tested a bunch of functionality on Order,
# we effectively get all that testing for free! Here we'll
# only test things that are different.

xdescribe "OnlineOrder" do
  describe "#initialize" do
    it "Is a kind of Order" do

      all_orders.class.must_equal Array

      all_orders.each do |order|
        order.must_be_instance_of Grocery::Order
      end

      all_orders.count.must_equal 100
    end
    end

    xit "Can access Customer object" do
      # TODO: I did not create a Customer class.
    end

    it "Can access the online order status" do
      @online_order.status.must_be_instance_of Symbol

    end
  end

  xdescribe "#total" do
    it "Adds a shipping fee" do
      # TODO: Your test code here!
    end

    it "Doesn't add a shipping fee if there are no products" do
      # TODO: Your test code here!
    end
  end

  describe "#add_product" do
    it "Does not permit action for processing, shipped or completed statuses" do
      # TODO: Your test code here!
    end

    it "Permits action for pending and paid satuses" do
      # TODO: Your test code here!
    end
  end

  describe "OnlineOrder.all" do
    xit "Returns an array of all online orders" do
      all_orders = Grocery::OnlineOrder.all
      # all_orders.must_be_kind_of Array
      all_orders.class.must_equal Array

      all_orders.each do |order|
        order.must_be_instance_of Grocery::OnlineOrder
      end

      all_orders.count.must_equal 100
    end
    end

    xit "Returns accurate information about the first online order" do
      all_orders = Grocery::OnlineOrder.all

      all_orders[0].id.must_equal 1

      all_orders[0].products.must_be_kind_of Hash
    end

    xit "Returns accurate information about the last online order" do
      all_orders = Grocery::OnlineOrder.all

      all_orders[-1].id.must_equal 100
      all_orders[-1].products.must_be_kind_of Hash
    end
  end

  xdescribe "OnlineOrder.find" do
    xit "Will find an online order from the CSV" do
      # TODO: Your test code here!
    end

    xit "Raises an error for an online order that doesn't exist" do
      # TODO: Your test code here!
    end
  end

  describe "OnlineOrder.find_by_customer" do
    xit "Returns an array of online orders for a specific customer ID" do
      # TODO: Your test code here!
    end

    xit "Raises an error if the customer does not exist" do
      # TODO: Your test code here!
    end

    xit "Returns an empty array if the customer has no orders" do
      # TODO: Your test code here!
    end
  end
end
