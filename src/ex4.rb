class Dessert
    def initialize(name, calories)
        @name = name
        @calories = calories
    end

    def healthy?
        if @calories < 200
            return true
        end
        false
    end

    def delicious?
        true
    end

    # getters and setters
    def name
        @name
    end

    def name=(name)
        @name = name
    end

    def calories
        @calories
    end

    def calories=(calories)
        @calories = calories
    end

end


class JellyBean < Dessert
    def initialize(name, calories, flavor)
        super(name, calories)
        @flavor = flavor
    end

    def delicious?
        if @flavor == "black licorice"
            return false
        end
        super
    end

    # getter and setter
    def flavor
        @flavor
    end

    def flavor=(flavor)
        @flavor = flavor
end


puts Dessert.new("cake", 100).healthy? # => true
puts Dessert.new("cake", 300).healthy? # => false
puts Dessert.new("cake", 300).delicious? # => true
puts JellyBean.new("jelly", 100, "black licorice").delicious? # => false
puts JellyBean.new("jelly", 100, "cherry").delicious? # => true