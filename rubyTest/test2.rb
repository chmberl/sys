#!/usr/bin/ruby

class Customer
    @@no_of_customers = 0
    def initialize(id, name, addr)
        @cust_id = id
        @cust_name = name
        @cust_addr = addr
    end

    def display_details()
        puts "customer id #@cust_id"
        puts "customer name #@cust_name"
        puts "customer address #@cust_addr"
    end

    def total_no_of_customers()
        @@no_of_customers += 1
        puts "total number of customer:#@@no_of_customers"
    end
end


cust1 = Customer.new("1", "john", "wisdom")
cust2 = Customer.new("2","poul", "new empire road")

cust1.display_details()
cust1.total_no_of_customers()
cust2.display_details()
cust2.total_no_of_customers()
