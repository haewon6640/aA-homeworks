class Stack

    def initialize
        @stack = Array.new(0)
    end

    def push(el)
        @stack << el
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end

end

class Queue

    def initialize
        @queue = Array.new(0)
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        queue[0]
    end
end

class Map

    def initialize
        @key = Array.new(0)
        @value = Array.new(0)
    end

    def set(key,value)
        if @key.include?(key)
            @value[@key.index(key)] = value
        else
            @key << key
            @value << value
        end
    end

    def get(key)
         if @key.include?(key)
            return @value[@key.index(key)]
         else
            return nil
         end
    end

    def delete(key)
        if @key.include?(key)
            loc = @key.index(key)
            @key.delete_at(loc)
            @value.delete_at(loc)
        end
    end

    def show
        result = ""
        (0...@key.length).each do |i|
            result += "#{@key[i].to_s} #{@value[i].to_s} \n"
        end
        puts result
    end 
end

map = Map.new()
map.set("jerry", 5)
map.set("jerryer", 20)
map.delete("jerry")
map.show