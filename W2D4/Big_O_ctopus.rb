require 'byebug'
octopus = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'].shuffle

def sluggish_octopus(octopus)
  longest = ""
  octopus.each do |octo|
    longest = octo if octo.length > longest.length
  end

  longest
end

puts sluggish_octopus(octopus)

def dominant_octopus(octopus)
  return octopus if octopus.count <= 1
  middle = octopus.count / 2
  left = dominant_octopus(octopus[0...middle]) || []
  right = dominant_octopus(octopus[middle..-1]) || []

  sorted = merge(left, right)
  return sorted.last if sorted.length == 8
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first.length < right.first.length
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + right + left
end

puts dominant_octopus(octopus)



def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end


tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
