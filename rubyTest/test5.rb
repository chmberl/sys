#!/usr/bin/ruby

print <<EOF
    this is the first way of creating
    here document ie.
    hfskh    sdfsdf
                sfhdkfs
            sdfhsdkj
            <html>
EOF


print <<`EOF`
    echo hi here 
EOF

puts 'escape using "\\"';
puts 'that\'s right';


puts "multiplication value : #{24*60*60}";


class Customer
    @@no_of_customers=0

    def hello()
        puts "#@@no_of_customers";
    end
end

cust1 = Customer.new
cust2 = Customer.new
cust1.hello
