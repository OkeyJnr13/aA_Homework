class Map
    def initialize
        @map_array = []
    end

    def set(key, value)
        if @map_array.assoc(key).nil?
            @map_array.push([key, value])
        else
            @map_array.each do |sub_arr|
                sub_arr[1] = value if sub_arr.first == key
            end
        end
        value
    end

    def get(key)
        @map_array.assoc(key)[1]
        nil
    end

    def delete(key)
        (0...@map_array.size).each do |idx|
            @map_array.delete_at(idx) if @map_array[idx][0] == key
        end
    end

    def show
        @map_array
    end
end
