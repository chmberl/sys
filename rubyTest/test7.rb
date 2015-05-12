#!/usr/bin/ruby

=begin
这是一个多行注释
可扩展至任意数量的行
但=begin和=end只能出现在第一行和最后一行
=end


x=1

if x > 2
    puts "x is greater than 2"
elsif x <= 2 and x != 0
    puts "x is 1"
else
    puts "I can't guess the number"
end

$debug=1
puts "debug\n" if $debug


x = 1
unless x > 2
    puts "x is less than 2"
else
    puts "x is greater than 2"
end

$var = false
print "2 -- value is set \n" unless $var




$age = 5
case $age
when 0..2
    puts "baby"
when 3..6
    puts "little child"
when 7..12
    puts "child"
when 13..18
    puts "youth"
else
    puts "adult"
end


$i = 0
$num = 5

begin 
    puts("Inside the loop i = #$i")
    $i += 1
end while $i < $num


$i=0
$num = 5

until $i > $num do
    puts("Inside the loop i = #$i")
    $i += 1;
end


for i in 0..5
    puts "Value of local variable is #{i}"
end
