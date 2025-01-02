struct Dir
    x::Int
    y::Int
end

struct Pos
    row::Int
    col::Int
end

prices = []
numThreads = 0

function nextDir1(dir::Dir)
    if dir.x == 0
        Dir(1,0)
    else
        Dir(0,1)
    end
end

function nextDir2(dir::Dir)
    if dir.x == 0
        Dir(-1,0)
    else
        Dir(0,-1)
    end
end

function nextPos(pos::Pos, dir::Dir)
    Pos(pos.row + dir.y, pos.col + dir.x)
end

function getInput(testing)
    if testing
        input = split("#################
#...#...#...#..E#
#.#.#.#.#.#.#.#.#
#.#.#.#...#...#.#
#.#.#.#.###.#.#.#
#...#.#.#.....#.#
#.#.#.#.#.#####.#
#.#...#.#.#.....#
#.#.#####.#.###.#
#.#.#.......#...#
#.#.###.#####.###
#.#.#...#.....#.#
#.#.#.#####.###.#
#.#.#.........#.#
#.#.#.#########.#
#S#.............#
#################", "\n")
    else
        f = open("day16_input.txt")
        input = readlines(f)
    end

    result = Array{String}(undef, length(input), length(input[1]))
    println(length(input))
    println(length(input[1]))

    for i in eachindex(input)
        for j in eachindex(input[i])
            result[i,j] = string(input[i][j])
        end
    end

    return result
end

function main()
    maze = getInput(false)
    maze = blanket(maze, (1,100), (1,100))
    maze = blanket(maze, (80,140),(80,140))
    maze = simplify(maze, 100)
    printMaze(maze)
    mazeDo(maze)
end

function printMaze(maze)
    for i in 1:size(maze)[1]
        println(join(maze[i,:]))
    end
end

function mazeDo(maze)
    for i in 1:size(maze)[1]
        for j in 1:size(maze)[2]
            if maze[i,j] == "S"
                println("$i, $j")
                mazeDo(maze, Pos(i,j), Dir(1,0), 0)
                return
            end
        end
    end
end

function mazeDo(maze, pos, dir, cost)
    global numThreads += 1
    if numThreads == 1200
        printMaze(maze)
    end
    
    #println("t: $(numThreads)")
    
    nPos = nextPos(pos, dir)
    nDir1 = nextDir1(dir)
    nDir2 = nextDir2(dir)
    nPos1 = nextPos(pos, nDir1)
    nPos2 = nextPos(pos, nDir2)

    if nPos.row > 0 && nPos.row <= size(maze)[1] && nPos.col > 0 && nPos.col <= size(maze)[2]
        if maze[nPos.row, nPos.col] == "E"
            #println(maze)
            println("\$$(cost+1)")
            push!(prices, cost+1)
            global numThreads -= 1
            return
        elseif maze[nPos.row, nPos.col] == "."
            cMaze = deepcopy(maze)
            cMaze[nPos.row, nPos.col] = "*"
            mazeDo(cMaze, nPos, dir, cost + 1)
        end
    end    
    if nPos1.row > 0 && nPos1.row <= size(maze)[1] && nPos1.col > 0 && nPos1.col <= size(maze)[2]
        if maze[nPos1.row, nPos1.col] == "E"
            #println(maze)
            println("\$$(cost+1001)")
            push!(prices, cost+1001)
            global numThreads -= 1
            return
        elseif maze[nPos1.row, nPos1.col] == "."
            cMaze = deepcopy(maze)
            cMaze[nPos1.row, nPos1.col] = "*"
            mazeDo(cMaze, nPos1, nDir1, cost + 1001)
        end
    end
    if nPos2.row > 0 && nPos2.row <= size(maze)[1] && nPos2.col > 0 && nPos2.col <= size(maze)[2]
        if maze[nPos2.row, nPos2.col] == "E"
            #println(maze)
            println("\$$(cost+1001)")
            push(prices, cost+1001)
            global numThreads -= 1
            return
        elseif maze[nPos2.row, nPos2.col] == "."
            cMaze = deepcopy(maze)
            cMaze[nPos2.row, nPos2.col] = "*"
            mazeDo(cMaze, nPos2, nDir2, cost + 1001)
        end
    end
    global numThreads -= 1
end

function part2(testing)
    part1 = testing ? 11048 : 89460

    maze = simplify(getInput(testing), 200)
    nMaze = numerify(deepcopy(maze), 0)

    for i in 1:size(maze)[1]
        for j in 1:size(maze)[2]
            if !isnothing(tryparse(Int, nMaze[i,j]))
                if parse(Int, nMaze[i,j]) > part1
                    nMaze[i,j] = "#"
                    maze[i,j] = "#"
                end
            end
        end
    end

    return maze, nMaze
    #return maze
end

function numerify(maze, lastRun)
    complete = true

    for i in 1:size(maze)[1]
        for j in 1:size(maze)[2]
            maze[i,j] == "." ? complete = false : nothing
            maze[i,j] = determineCost(Pos(i,j), maze)
        end
    end
    #complete ? (return maze) : return numerify(maze)

    if complete
        if lastRun > 10
            return maze
        else
            return numerify(maze, lastRun + 1)
        end
    else
        return numerify(maze, 0)
    end
end

function determineCost(index::Pos, maze)
    i = index.row
    j = index.col

    if maze[i,j] == "S"
        return "0"
    elseif maze[i,j] == "#"
        return "#"
    end

    lowestVal = tryparse(Int, maze[i,j])
    isnothing(lowestVal) ? lowestVal = -1 : nothing

    try
        if !isnothing(tryparse(Int, maze[i-1,j]))
            if !isnothing(tryparse(Int, maze[i-2,j])) && parse(Int, maze[i-1,j]) > parse(Int, maze[i-2,j])
                value = parse(Int, maze[i-1,j]) + 1
                lowestVal == -1 ? lowestVal = value : lowestVal = min(lowestVal, value)
            else
                value = parse(Int, maze[i-1,j]) + 1001
                lowestVal == -1 ? lowestVal = value : lowestVal = min(lowestVal, value)
            end
        end
    catch
        nothing
    end

    
    try
        if !isnothing(tryparse(Int, maze[i+1,j]))
            if !isnothing(tryparse(Int, maze[i+2,j])) && parse(Int, maze[i+1,j]) > parse(Int, maze[i+2,j])
                value = parse(Int, maze[i+1,j]) + 1
                lowestVal == -1 ? lowestVal = value : lowestVal = min(lowestVal, value)
            else
                value = parse(Int, maze[i+1,j]) + 1001
                lowestVal == -1 ? lowestVal = value : lowestVal = min(lowestVal, value)
            end
        end
    catch
        nothing
    end

        
    try
        if !isnothing(tryparse(Int, maze[i,j-1]))
            if parse(Int, maze[i,j-1]) == 0
                return "1"
            elseif !isnothing(tryparse(Int, maze[i,j-2])) && parse(Int, maze[i,j-1]) > parse(Int, maze[i,j-2])
                value = parse(Int, maze[i,j-1]) + 1
                lowestVal == -1 ? lowestVal = value : lowestVal = min(lowestVal, value)
            else
                value = parse(Int, maze[i,j-1]) + 1001
                lowestVal == -1 ? lowestVal = value : lowestVal = min(lowestVal, value)
            end
        end
    catch
        nothing
    end

    try
        if !isnothing(tryparse(Int, maze[i,j+1]))
            if !isnothing(tryparse(Int, maze[i,j+2])) && parse(Int, maze[i,j+1]) > parse(Int, maze[i,j+2])
                value = parse(Int, maze[i,j+1]) + 1
                lowestVal == -1 ? lowestVal = value : lowestVal = min(lowestVal, value)
            else
                value = parse(Int, maze[i,j+1]) + 1001
                lowestVal == -1 ? lowestVal = value : lowestVal = min(lowestVal, value)
            end
        end
    catch
        nothing
    end

    lowestVal == -1 ? (return ".") : (return string(lowestVal))
    
end

function simplify(maze, recursionLevel)
    for i in 1:size(maze)[1]
        for j in 1:size(maze)[2]
            if maze[i,j] == "."
                numBounds = 0
                maze[i+1,j] == "#" ? numBounds += 1 : nothing
                maze[i-1,j] == "#" ? numBounds += 1 : nothing
                maze[i,j+1] == "#" ? numBounds += 1 : nothing
                maze[i,j-1] == "#" ? numBounds += 1 : nothing
 
                numBounds >= 3 ? maze[i,j] = "#" : nothing
            end
        end
    end

    if recursionLevel == 1
        return maze
    else
        return simplify(maze, recursionLevel - 1)
    end     
end

function blanket(maze, rowLims, colLims)
    for i in rowLims[1]:rowLims[2]
        for j in colLims[1]:colLims[2]
            maze[i,j] = "#"
        end
    end

    return maze
end
