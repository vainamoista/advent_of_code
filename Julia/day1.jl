f = open("day1_input.txt")

lines = readlines(f)

sumdiff = 0

list1 = []
list2 = []

for line in lines
    sline = split(line)

    push!(list1, parse(Int, sline[1]))
    push!(list2, parse(Int, sline[2]))
end

sort!(list1)
sort!(list2)

for i in 1:length(list1)
    global sumdiff += abs(list1[i] - list2[i])
end

simscore = 0

for l1element in list1
    for l2element in list2
        if l1element == l2element
            global simscore += l2element
        end
    end
end

println(sumdiff)
println(simscore)
