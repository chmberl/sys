#!/usr/bin/ruby


class Example
    VAR1 = 100
    VAR2 = 200
    def show
        puts "Value of first Constant is #{VAR1}"
        puts "Value of second Constant is #{VAR2}"
    end
end

object = Example.new()
object.show
a=10
b=20
puts a==b
puts (1..10)===5

puts 1 <=> 3
puts 3.eql?3
puts 2.equal?2

c, d, e = 40, 201, 42

puts c,d,e

puts (1 or 0)
