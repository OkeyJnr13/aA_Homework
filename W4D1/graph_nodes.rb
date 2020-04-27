require "set"

class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end

    def add_neighbor(node)
        self.neighbors << node
    end

    def bfs(start_node, target_val)
        queue = [start_node]
        visited = Set.new

        while !queue.empty?
            node = queue.shift
            if !visited.include?(node)
                return node.val if node.val == target_val
                visited.add(node)
                queue += node.neighbors
            end
        end
  
        return nil
    end
end
