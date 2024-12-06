# The functions are listed alphabetically, not logically. The final line of
# code calls function main()

# Reads the input data and puts it into a 2-dimensional String Array
function getTextMap()
    f = open("day6_input.txt")
    textMap = readlines(f)

    result = Array{String}(undef, length(textMap), length(textMap[1]))

    for i in 1:length(textMap)
        for j in 1:length(textMap[i])
            result[i,j] = string(textMap[i][j])
        end
    end

    return result
end


# This is a helper function for Part 2. It places a "test obstruction" at point 
# newObs, and checks if it causes the guard to get stuck in a loop. It decides
# that 1000 consecutive steps of getting nowhere new must mean a loop. For the record
# 100 consecutive steps also got me the correct result, but only 10 resulted in a
# much larger result.
function isLoop(newObs, startPos)
    dirVec = Dict(
                  "N"=>[-1,0],
                  "E"=>[0,1],
                  "S"=>[1,0],
                  "W"=>[0,-1])
    changeDir = Dict(
                     "N"=>"E",
                     "E"=>"S",
                     "S"=>"W",
                     "W"=>"N")


    textArray = getTextMap()
    (len1, len2) = size(textArray)
    textArray[newObs[1],newObs[2]] = "#"
    pos = startPos
    dir = "N"
    numTrues = 0

    # The loop exits if the guard has 1000 consecutive steps in places she's 
    # already been, or if she exits the entire box.
    while numTrues < 1000
        textArray[pos[1],pos[2]]="X"
        testPos = pos + dirVec[dir]
        if testPos[1]<1 || testPos[1]>len1 || testPos[2]<1 || testPos[2]>len2
            return false
        elseif textArray[testPos[1],testPos[2]]=="#"
            dir = changeDir[dir]
            continue
        else
            if textArray[testPos[1],testPos[2]]=="X"
                numTrues += 1
            else
                numTrues = 0
            end
            pos = testPos
        end
    end

    return true
end


# Is the first call of the program, and just calls parts1 and 2
function main()
    println(part1()[1])
    println(part2())
end


# Returns a 2-part result: the sum total of spots the guard has walked, and
# the marked array itself, which is used by function part2()
function part1()
    textArray = getTextMap()
    len1 = size(textArray)[1]
    len2 = size(textArray)[2]

    dirVec = Dict(
               "N"=>[-1,0],
               "E"=>[0,1],
               "S"=>[1,0],
               "W"=>[0,-1])
    changeDir = Dict(
                     "N"=>"E",
                     "E"=>"S",
                     "S"=>"W",
                     "W"=>"N")

    pos = [-1,-1]
    dir = "N"

    for i in eachindex(IndexCartesian(), textArray)
        if textArray[i] == "^"
            pos = [i[1],i[2]]
            break
        end
    end

    while true
        textArray[pos[1],pos[2]]="X"
        testPos = pos + dirVec[dir]
        if testPos[1]<1 || testPos[1]>len1 || testPos[2]<1 || testPos[2]>len2
            break
        elseif textArray[testPos[1],testPos[2]]=="#"
            dir = changeDir[dir]
            continue
        else
            pos = testPos
        end
    end

    sum = 0
    for element in textArray
        if element == "X"
            sum += 1
        end
    end

    return (sum, textArray)
end


# From part1()'s array showing where the guard has walked, try replacing
# each "X" with a "#" to see if it results in the guard following a
# repetitive loop.
function part2()

    startPos = [-1,-1]
    dir = "N"

    textArray = getTextMap()

    for i in eachindex(IndexCartesian(), textArray)
        if textArray[i] == "^"
            startPos = [i[1],i[2]]
            break
        end
    end

    part1Array = part1()[2]
    sum = 0

    for i in eachindex(IndexCartesian(), part1Array)
        if part1Array[i] == "X"
            isLoop([i[1],i[2]], startPos) ? sum+=1 : nothing
        end
    end

    return sum
end


# Outside of all functions now, so in script-land. Call function main() and
# start the fun
main()
