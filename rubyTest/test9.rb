#!/usr/bin/ruby

def test(a1="Ruby", a2="Perl")

    puts "The programming language is #{a1}"
    puts "The programming language is #{a2}"
    k=0
end

test "c", "c++"
puts test


def test1 
    i = 100
    j = 200
    k = 300
    return i, j, k
end

var = test1
puts var
