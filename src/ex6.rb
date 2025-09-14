# a)

class Numeric
    @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}

    def method_missing(method_id)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        else
            super
        end
    end

    def in(currency)
        singular_currency = currency.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self / @@currencies[singular_currency]
        else
            super
        end
    end
end

puts 5.dollars.in(:euros) # => 3.8699..
puts 10.euros.in(:rupees) # => 680.0



# b)

class String
    def palindrome?
        letters = self.downcase.gsub(/[^a-z0-9]/, '')
        letters == letters.reverse
    end
end


puts "foo".palindrome? # => false
puts "A man, a plan, a canal -- Panama".palindrome? #=> true
puts "Madam, I'm Adam!".palindrome? # => true
puts "Abracadabra".palindrome? # => false (nil is also ok)



# c)

module Enumerable # enumerable é um modulo NAO é classe
    def palindrome?
        array = self.to_a
        array == array.reverse
    end
end

puts [1,2,3,2,1].palindrome? # => true
puts [1,2,3].palindrome? # => false