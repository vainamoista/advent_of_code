=begin
text = "....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#..."
splitText = text.split("\n")
=end

class 

splitText = File.read("day6_input.txt").split

movement = {
  "n": [-1,0],
  "s": [1,0],
  "e": [0,1],
  "w": [0,-1]
}
nextDir = {
  n: :e,
  e: :s,
  s: :w,
  w: :n
}

i = nil
j = nil
dir = :n

splitText.each_with_index { | line, index |
  j = line.index("^")
  if j != nil
    i = index
    break
  end
}

while true
  new_i = i + movement[dir][0]
  new_j = j + movement[dir][1]

  if new_i<0 || new_i>=splitText.length() || j<0 || j>=splitText[0].length()
    break
  end
  
  if splitText[new_i][new_j] == "#"
    dir = nextDir[dir]
  else
    splitText[new_i][new_j] = "X"
    i = new_i
    j = new_j
  end
end

count = 0
splitText.each { | line |
  line.each_char { | char |
    if char == "X"
      count += 1
    end
  }
}

puts count

def addy(n1, n2)
  n1 + n2
end

addy(7,6)
