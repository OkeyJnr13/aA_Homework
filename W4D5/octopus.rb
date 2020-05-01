# Sluggish Octopus O(n^2)
def nsquared_longest_fish(arr)
    result = ""
    (0...arr.size).each do |idx|
        (idx+1...arr.size).each do |jdx|
            result = arr[jdx] if arr[jdx].size > arr[idx].size
        end
    end
    result
end

# p nsquared_longest_fish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']) #=> "fiiiissshhhhhh"


# Dominant Octopus O(n log n)
def nlogn_longest_fish(arr)
    prc = Proc.new {|a, b| a.size <=> b.size}
    my_merge_sort(arr, &prc).last
end

def my_merge_sort(arr, &prc)
    prc ||= Proc.new {|a, b| a <=> b}
    return arr if arr.size <= 1
    mid = arr.size / 2
    
    left = my_merge_sort(arr.take(mid), &prc)
    right = my_merge_sort(arr.drop(mid), &prc)
    
    my_merge(left, right, &prc)
end

def my_merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1
            result << left.shift
        when 0
            result << left.shift
        when 1
            result << right.shift
        end
    end
    result + left + right
end

# p nlogn_longest_fish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']) #=> "fiiiissshhhhhh"


# Clever Octopus O(n)
def n_longest_fish(arr)
    result = arr.first
    (1...arr.size).each { |idx| result = arr[idx] if arr[idx].size > result.size }
    result
end

# p n_longest_fish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']) #=> "fiiiissshhhhhh"


# Slow Dance O(n)
def slow_dance(dir, arr)
    (0...arr.size).each do |idx|
        return idx if arr[idx] == dir
    end
    nil
end

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)


# Constant Dance! O(1)
def constant_dance(dir, data_structure)
    data_structure[dir]
end

# new_tiles_data_structure = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6, "left-up"=>7}
# p constant_dance("up", new_tiles_data_structure)
# p constant_dance("right-down", new_tiles_data_structure)