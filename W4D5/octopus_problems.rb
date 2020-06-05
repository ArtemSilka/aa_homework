# Big O-ctopus and Biggest Fish
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"
# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def bubble_sort(array)
    sorted = false

    while !sorted
        sorted = true
        array.each_with_index do |ele, i|
            next if i + 1 == array.length
            j = i + 1
            if array[i].length > array[j].length
                array[i], array[j] = array[j], array[i]
                sorted = false
            end
        end
    end
    array.last
end

# p bubble_sort(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']) # => "fiiiissshhhhhh"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. Remember that Big O is classified by the dominant term.

def merge_sort(array)
    return array if array.length <= 1

    mid = array.length / 2
    left_sorted = merge_sort(array.take(mid))
    right_sorted = merge_sort(array.drop(mid))
    merge(left_sorted, right_sorted)
end

def merge(left, right)
    merged = []
    until left.empty? || right.empty?
        case left.first.length <=> right.first.length
        when 1
            merged << right.shift
        else
            merged << left.shift
        end
    end

    merged.concat(left)
    merged.concat(right)
end

arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
result = merge_sort(arr).last
# p result # => "fiiiissshhhhhh"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def longest_fish(array)
    longest = array.first

    array.each do |fish|
        if fish.length > longest.length
            longest = fish
        end
    end

    longest
end

# p longest_fish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']) # => "fiiiissshhhhhh"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(move, tiles_array)
    tiles_array.each_with_index do |tile, i|
        if tile == move
            return i
        end
    end
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# p slow_dance("up", tiles_array)
# > 0

# p slow_dance("right-down", tiles_array)
# > 3


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

def fast_dance(move, new_tiles_data_structure)
    new_tiles_data_structure.index(move)
end

new_tiles_data_structure = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# p fast_dance("up", new_tiles_data_structure)
# > 0

# p fast_dance("right-down", new_tiles_data_structure)
# > 3