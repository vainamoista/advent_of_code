function getInput(testing)
    input = readlines("day14_input.txt")
    height = 103
    width = 101
    if testing
        input = split("p=0,4 v=3,-3
p=6,3 v=-1,-3
p=10,3 v=-1,2
p=2,0 v=2,-1
p=0,0 v=1,3
p=3,0 v=-2,-2
p=7,6 v=-1,-3
p=3,0 v=-1,-2
p=9,3 v=2,3
p=7,3 v=-1,2
p=2,4 v=2,-3
p=9,5 v=-3,-3","\n")

        height = 7
        width = 11
    end

    pv = split.(input, " ")

    orderedList = map(x->parse.(Int,split(join(chop.(x, head=2, tail=0),","),",")), pv)
    
    return orderedList, height, width
end



function part1(testing)
    robots, height, width = getInput(testing)
    println(length(robots))

    for thisStep in 1:100
        for i in 1:size(robots)[1]
            robots[i][1], robots[i][2] = step(robots[i], height, width)
        end
    end

    cutoffHeightLow = floor(height/2)
    cutoffHeightHigh = ceil(height/2)
    cutoffWidthLow = floor(width/2)
    cutoffWidthHigh = ceil(width/2)

    println(cutoffHeightLow)
    println(cutoffHeightHigh)
    println(cutoffWidthLow)
    println(cutoffWidthHigh)

    q1Tally = 0
    q2Tally = 0
    q3Tally = 0
    q4Tally = 0

    for robot in robots
        if robot[1] < cutoffWidthLow && robot[2] < cutoffHeightLow
            print("Q1: ")
            q1Tally += 1
        elseif robot[1] >= cutoffWidthHigh && robot[2] >= cutoffHeightHigh
            print("Q3: ")
            q3Tally += 1
        elseif robot[1] < cutoffWidthLow && robot[2] >= cutoffHeightHigh
            print("Q4: ")
            q4Tally += 1
        elseif robot[1] >= cutoffWidthHigh && robot[2] < cutoffHeightLow
            print("Q2: ")
            q2Tally += 1
        end
        println(robot[1], ",", robot[2])
    end

    println(q1Tally, ", ", q2Tally, ", ", q3Tally, ", ", q4Tally)

    return robots
end


function part2(testing, numIterations)
    robots, height, width = getInput(testing)
    println(length(robots))

    for thisStep in 1:numIterations
        q1Tally = 0
        q2Tally = 0
        q3Tally = 0
        q4Tally = 0
        
        cutoffHeightLow = floor(height/2)
        cutoffHeightHigh = ceil(height/2)
        cutoffWidthLow = floor(width/2)
        cutoffWidthHigh = ceil(width/2)
        
        for i in 1:size(robots)[1]
            robots[i][1], robots[i][2] = step(robots[i], height, width)
            if robots[i][1] < cutoffWidthLow && robots[i][2] < cutoffHeightLow
                q1Tally += 1
            elseif robots[i][1] >= cutoffWidthHigh && robots[i][2] >= cutoffHeightHigh
                q3Tally += 1
            elseif robots[i][1] < cutoffWidthLow && robots[i][2] >= cutoffHeightHigh
                q4Tally += 1
            elseif robots[i][1] >= cutoffWidthHigh && robots[i][2] < cutoffHeightLow
                q2Tally += 1
            end
        end

        if abs(q1Tally - q2Tally) / q1Tally < 0.01 && abs(q3Tally - q4Tally) / q3Tally < 0.01
            println(thisStep)
        end
    end
    
end

function step(robotPosVel, maxHeight, maxWidth)
    x = robotPosVel[1]
    y = robotPosVel[2]
    vx = robotPosVel[3]
    vy = robotPosVel[4]
    res_x = x + vx
    res_y = y + vy

    if res_x < 0
        res_x = maxWidth + res_x
    elseif res_x >= maxWidth
        res_x = res_x - maxWidth
    end

    if res_y < 0
        res_y = maxHeight + res_y
    elseif res_y >= maxHeight
        res_y = res_y - maxHeight
    end

    return res_x, res_y
end

function drawBots(robots, height, width)
    botPos = map(x->x[1:2], robots)
    for i=1:height
        for j=1:width
            if exists((i-1, j-1), botPos)
                print("*")
            else
                print(" ")
            end
        end
        println();
    end
end

function cycleTo(testing, toCycleNumber)
    # cycle 6644 gives the christmas tree
    bots, height, width = getInput(testing)
    cycleNumber = 0
    for i in 1:toCycleNumber
        for iBot in 1:size(bots)[1]
            bots[iBot][1], bots[iBot][2] = step(bots[iBot], height, width)
        end
    end

    drawBots(bots, height, width)
end

function cycle(bots, height, width, cycleNumber)
    cycleNumber += 1
    println("Cycle: ", cycleNumber)
    for i in 1:size(bots)[1]
        bots[i][1], bots[i][2] = step(bots[i], height, width)
    end
    
    drawBots(bots, height, width)

    return bots, cycleNumber
end

function exists(thisThing, listOfThings)
    for thing in listOfThings
        if thisThing[1] == thing[1] && thisThing[2] == thing[2]
            return true
        end
    end

    return false
end
