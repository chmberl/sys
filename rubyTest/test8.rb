#!/usr/bin/ruby

for i in 0..5
    if i > 2 then
       next 
    end
    puts "value of local variable is #{i}"
end


for i in 0..5
    if i < 2 then
        puts "value of local variable is #{i}"
        i += 1
        redo
    end
end
