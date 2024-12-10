function getInput()
    text = split.(readlines(open("day10_input.txt")),"")
    
    test =  split.(split("89010123\n78121874\n87430965\n96549874\n" *
            "45678903\n32019012\n01329801\n10456732", "\n"),"")

    #text = test

    n_rows = length(eachrow(text))
    n_cols = length(text[1])

    intArr = Matrix{Int}(undef, n_rows, n_cols)

    for i in 1:n_rows
        for j in 1:n_cols
            intArr[i,j] = parse(Int, text[i][j])
        end
    end
    
    return intArr
end

function elementAt(map, row, col)
    if row >= 1 && row <= size(map)[1] && col >= 1 && col <= size(map)[2]
        return map[row,col]
    else
        return nothing
    end
end

function followBranch(map, row, col, loc9s, tally)
    value = map[row,col]

    if value == 9
        if length(findall(isequal(tuple(row,col)), loc9s))==0
            push!(loc9s, tuple(row,col))
        else
            tally += 1
        end
        return (loc9s, tally)
    end
    
    if elementAt(map,row-1,col) == value+1
        (loc9s, tally) = followBranch(map, row-1, col, loc9s, tally)
    end
    if elementAt(map,row+1,col) == value+1
        (loc9s, tally) = followBranch(map, row+1, col, loc9s, tally)
    end
    if elementAt(map,row,col+1) == value+1
        (loc9s, tally) = followBranch(map, row, col+1, loc9s, tally)
    end
    if elementAt(map,row,col-1) == value+1
        (loc9s, tally) = followBranch(map, row, col-1, loc9s, tally)
    end
        
    return (loc9s, tally)
end

function main()
    (p1, p2) = part1()
    println("Part 1: ", p1)
    println("Part 2: ", p2)
end

function part1()
    map = getInput()


    result = 0
    tally = 0
    for i_row in 1:size(map)[1]
        for j_col in 1:size(map)[2]
            if map[i_row,j_col] == 0
                (fb, fb2) = followBranch(map, i_row, j_col, [], 0)
                #println(i_row, ",", j_col, " has ", length(fb))
                #println(followBranch(map, i_row, j_col, []))
                result += length(fb)
                tally += fb2
            end
        end
    end
    return (result, result+tally)
end
