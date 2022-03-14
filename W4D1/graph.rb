class GraphNode
    $VISITED_NODES = []
    attr_accessor :neighbors, :value
    def initialize(value,neighbors = [])
        @value = value
        @neighbors = neighbors
    end

    def bfs(start_node, target_value)
        queue = [start_node]
        until queue.empty?
            node = queue.shift
            return node.value if node.value == target_value
            $VISITED_NODES << node
            node.neighbors.each do |nei|
                queue << nei unless $VISITED_NODES.include?(nei)
            end
        end
        return nil
    end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
p a.bfs(a,'f')