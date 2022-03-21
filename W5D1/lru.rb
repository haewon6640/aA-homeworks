class LRUCache
    attr_accessor :arr, :max_size
    def initialize(n)
        @max_size = n
        @arr = Array.new(0)
    end

    def count
        @arr.length
    end

    def add(el)
        if arr.include?(el)
            arr.delete(el)
            arr.push(el)
            return el
        end
        if arr.length == max_size
            arr.shift
            arr.push(el)
        else
            arr.push(el)
        end
    end

    def show
        p arr
    end
end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2