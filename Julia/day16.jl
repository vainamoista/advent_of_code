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

function getInput(testing)
    if testing
        input = split("###############
#.......#....E#
#.#.###.#.###.#
#.....#.#...#.#
#.###.#####.#.#
#.#.#.......#.#
#.#.#####.###.#
#...........#.#
###.#.#####.#.#
#...#.....#.#.#
#.#.#.###.#.#.#
#.....#...#.#.#
#.###.#.#.#.#.#
#S..#.....#...#
###############", "\n")
        inpuv = split("#################
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

function part2(testing)
    part1 = testing ? 11048 : 89460
    endPoint = testing ? Pos(2,16) : Pos(2,140)

    maze = simplify(getInput(testing), 200)
    nMaze = numerify(deepcopy(maze), 0)
    
    #testing ? (maze[2,15]="#") : nothing

    for i=1:10
        maze, nMaze = removeLocalMaxima(maze, nMaze)
    end
    
    return maze, nMaze
    #return maze
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

function isLocalMaximum(maze, pos::Pos)
    numLess = 0
    row = pos.row
    col = pos.col

    if row == 99 && col == 6
        flag = true
    else
        flag = false
    end
    
    val = tryparse(Int, maze[row,col])

    isnothing(val) ? (return false) : nothing
    
    a = tryparse(Int, maze[row-1,col])
    b = tryparse(Int, maze[row+1,col])
    c = tryparse(Int, maze[row,col-1])
    d = tryparse(Int, maze[row,col+1])

    if flag
        println("val: $val, a: $a, b: $b, c: $c, d: $d")
    end

    if !isnothing(a)
        if a < val
            numLess += 1
        else
            return false
        end
    end
    
    if !isnothing(b)
        if b < val 
            numLess += 1
        else
            return false
        end
    end
    
    if !isnothing(c)
        if c < val
            numLess += 1
        else
            return false
        end
    end

    if !isnothing(d)
        if d < val
            numLess += 1
        else
            return false
        end
    end

    if !isnothing(a) && !isnothing(b)
        if abs(a-b) == 2
            if isnothing(tryparse(Int, maze[row-2,col])) && isnothing(tryparse(Int, maze[row+2,col]))
                return true
            elseif abs(val-a)+abs(val-b) == 2000
                if abs(val - value(maze[row-2,col])) == 2 || abs(val - value(maze[row+2,col])) == 2
                    return false
                else
                    return true
                end
            else
                return false
            end
        elseif abs(a-b) == 0
            return true
        end
    end

    if !isnothing(c) && !isnothing(d)
        if abs(c-d) == 2
            if value(maze[row,col-2])==-1 && value(maze[row,col+2])==-1
                return true
            elseif abs(val-c)+abs(val-d) == 2000
                if abs(val-value(maze[row,col-2]))==2 || abs(val-value(maze[row,col+2]))==2
                    return false
                else
                    return true
                end
            else
                return false
            end
        elseif abs(c-d) == 0
            return true
        end
    end

    if numLess >= 2
        return true
    else
        return false
    end
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

function prnt(maze)
    for row in eachrow(maze)
        println(join(row))
    end
end

function removeLocalMaxima(maze, nMaze)
    
    for i in 2:size(maze)[1]-1
        for j in 2:size(maze)[2]-1
            if isLocalMaximum(nMaze, Pos(i,j))
                maze[i,j] = "#"
                nMaze[i,j] = "#"
            end

        end
    end

    maze, nMaze = simplify(maze, nMaze, 200)

    return maze, nMaze
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

function simplify(maze, nMaze, recursionLevel)
    maze = simplify(maze, recursionLevel)

    for i in 1:size(maze)[1]
        for j in 1:size(maze)[2]
            if maze[i,j] == "#"
                nMaze[i,j] = "#"
            end
        end
    end

    return maze, nMaze
end

function value(item)
    result = tryparse(Int, item)

    isnothing(result) ? (return -1) : (return result)
end
