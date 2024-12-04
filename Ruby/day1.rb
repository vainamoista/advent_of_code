f = File.open('day1_input.txt')

lines = f.readlines()

sumdiff = 0

list1 = []
list2 = []

lines.each do |line|
  split_line = line.split(" ")

  list1.push(split_line[0].to_i)
  list2.push(split_line[1].to_i)
end

list1.sort!
list2.sort!

for i in 0..list1.length-1
  sumdiff += (list1[i] - list2[i]).abs
end

simscore = 0

list1.each do |l1element|
  list2.each do |l2element|
    if l1element == l2element
      simscore += l2element
    end
  end
end

puts sumdiff
puts simscore
