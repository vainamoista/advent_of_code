### A Pluto.jl notebook ###
# v0.20.4

using Markdown
using InteractiveUtils

# ╔═╡ 12731cb6-eb86-44a2-9a75-f7545cdfa71b
function prettyPrint(kartta)
	row1 = "   "
	row2 = "   "
	for j=1:size(kartta)[2]
		strⱼ = string(j)
		if length(strⱼ) == 2
			if j%10 == 0
				row1 *= strⱼ[1]
			else
				row1 *= " "
			end
			row2 *= strⱼ[2]
		else
			row1 *= " "
			row2 *= strⱼ[1]
		end
	end

	println(row1)
	println(row2)
	
    for i = 1:size(kartta)[1]
		strᵢ = string(i)
		line = ""
		if length(strᵢ) == 2
			if i%10 == 0
				line *= strᵢ[1]
			else
				line *= " "
			end
			line *= strᵢ[2]
		elseif length(strᵢ) == 1
			line *= " "
			line *= strᵢ[1]
		end
        println(line * " " * join(kartta[i,:]))
    end
    println()
end

# ╔═╡ 29da9340-5897-4344-88bb-3702bc533a81
function canMoveUpDown(kartta, position, instruction)
	uusiKartta = deepcopy(kartta)
	
    if instruction == "^"
        newRow = position[1] - 1
    elseif instruction == "v"
        newRow = position[1] + 1
    end

    if uusiKartta[newRow, position[2]] == "#"
		
        return false, kartta
    elseif uusiKartta[newRow, position[2]] == "."
		uusiKartta[newRow, position[2]] = uusiKartta[position[1], position[2]]
		uusiKartta[position[1], position[2]] = "."
        return true, uusiKartta
    else
		if uusiKartta[newRow, position[2]] == "["
        	pos1 = (newRow, position[2])
        	pos2 = (newRow, position[2]+1)
		elseif uusiKartta[newRow, position[2]] == "]"
			pos1 = (newRow, position[2]-1)
        	pos2 = (newRow, position[2])
		else
			@error "In canMoveUpDown: " * instruction
		end
		
		trueOrFalse, uusiKartta = canMoveUpDown(uusiKartta, pos1, instruction)
		
		if trueOrFalse
			trueOrFalse, uusiKartta = canMoveUpDown(uusiKartta, pos2, instruction)
			if trueOrFalse
				uusiKartta[newRow, position[2]] = uusiKartta[position[1], position[2]]
				uusiKartta[position[1], position[2]] = "."
				return true, uusiKartta
			end
		end
        return false, kartta
	end
end

# ╔═╡ 98baf438-ff3c-4bfa-8471-eb0e641bac45
function applyInstruction(instruction, kartta)
    row, col = findfirst(kartta .== "@").I
	#println("(", row, ",", col, ")")

    isSpace = false

	instruction = string(instruction)

    if instruction == "<"
        for j in reverse(1:col-1)
            if kartta[row, j] == "."
                for k in j:col-1
                    kartta[row, k] = kartta[row, k+1]
                end
                kartta[row, col] = "."
                break
            elseif kartta[row, j] == "#"
                break
            end
        end
    elseif instruction == "^"
        for i in reverse(1:row-1)
            if kartta[i, col] == "."
                for k in i:row-1
                    kartta[k, col] = kartta[k+1, col]
                end
                kartta[row, col] = "."
                break
            elseif kartta[i, col] == "#"
                break
            end
        end
    elseif instruction == ">"
        for j in col+1:size(kartta)[2]
            if kartta[row, j] == "."
                for k in reverse(col+1:j)
                    kartta[row, k] = kartta[row, k-1]
                end
                kartta[row, col] = "."
                break
            elseif kartta[row, j] == "#"
                break
            end
        end
    elseif instruction == "v"
        for i in row+1:size(kartta)[1]
            if kartta[i, col] == "."
                for k in reverse(row+1:i)
                    kartta[k, col] = kartta[k-1, col]
                end
                kartta[row, col] = "."
                break
            elseif kartta[i, col] == "#"
                break
            end
        end
    end

    #prettyPrint(kartta)
    return kartta
end

# ╔═╡ db5979c8-3f80-4601-a613-20d53a26be5c
function applyInstruction2(instruction, kartta)
	instruction = string(instruction)
	
	position = findfirst(kartta .== "@").I

	position == (5,8) ? verbose = true : verbose = false
	
	if instruction == ">"
		kartta = applyInstruction(instruction, kartta)
	elseif instruction == "<"
		kartta = applyInstruction(instruction, kartta)
	elseif instruction == "^"
		result, tryKartta = canMoveUpDown(kartta, position, instruction)

		if result
			kartta = tryKartta
			kartta[position[1]-1, position[2]] = "@"
			kartta[position[1], position[2]] = "."
			return kartta
		else
			return kartta
		end
	elseif instruction == "v"
		result, tryKartta = canMoveUpDown(kartta, position, instruction)
		if result
			kartta = tryKartta
			kartta[position[1]+1,position[2]] = "@"
			kartta[position[1], position[2]] = "."
			return kartta
		else
			return kartta
		end
	else
		@error "Not a valid instruction: " * string(instruction)
		return kartta
	end
end

# ╔═╡ 77e3e174-bec6-11ef-20e2-f147c35c4485
function getInput(testing)
    testInput = split("########
#..O.O.#
##@.O..#
#...O..#
#.#.O..#
#...O..#
#......#
########

<^^>>>vv<v>>v<<", "\n\n")

    testInput = split("##########
#..O..O.O#
#......O.#
#.OO..O.O#
#..O@..O.#
#O#..O...#
#O..O..O.#
#.OO.O.OO#
#....O...#
##########

<vv>^<v^>v>^vv^v>v<>v^v<v<^vv<<<^><<><>>v<vvv<>^v^>^<<<><<v<<<v^vv^v>^vvv<<^>^v^^><<>>><>^<<><^vv^^<>vvv<>><^^v>^>vv<>v<<<<v<^v>^<^^>>>^<v<v><>vv>v^v^<>><>>>><^^>vv>v<^^^>>v^v^<^^>v^^>v^<^v>v<>>v^v^<v>v^^<^^vv<<<v<^>>^^^^>>>v^<>vvv^><v<<<>^^^vv^<vvv>^>v<^^^^v<>^>vvvv><>>v^<<^^^^^^><^><>>><>^^<<^^v>>><^<v>^<vv>>v>>>^v><>^v><<<<v>>v<v<v>vvv>^<><<>^><^>><>^v<><^vvv<^^<><v<<<<<><^v<<<><<<^^<v<^^^><^>>^<v^><<<^>>^v<v^v<v^>^>>^v>vv>^<<^v<>><<><<v<<v><>v<^vv<<<>^^v^>^^>>><<^v>>v^v><^^>>^<>vv^<><^^>^^^<><vvvvv^v<v<<>^v<v>v<<^><<><<><<<^^<<<^<<>><<><^^^>^^<>^>v<>^^>vv<^v^v<vv>^<><v<^v>^^^>>>^^vvv^>vvv<>>>^<^>>>>>^<<^v>^vvv<>^<><<v>v^^>>><<^^<>>^v^<v^vv<>v^<<>^<^v^v><^<<<><<^<v><v<>vv>>v><v^<vv<>v^<<^", "\n\n")

	testInput2 = split("#######
#...#.#
#.....#
#..OO@#
#..O..#
#.....#
#######

<vv<<^^<<^^", "\n\n")


    input = split(read("day15_input.txt", String),"\n\n")

    testing ? input = testInput : nothing
    
    karttaString = split(input[1], "\n")
    instructions = input[2]

    kartta = Matrix{String}(undef, size(karttaString)[1], length(karttaString[1]))

    for i in 1:size(kartta)[1]
        for j in 1:size(kartta)[2]
            kartta[i,j] = string(karttaString[i][j])
        end
    end

    return kartta, instructions
end

# ╔═╡ 8868c20c-579a-4e93-8585-3fa0c7cae5f3
function part1(testing)
    kartta, instructions = getInput(testing)

	println("Part 1 instructions length: ", length(instructions))

	testing ? prettyPrint(kartta) : nothing

    for inst in instructions
        kartta = applyInstruction(inst, kartta)
    end

	testing ? prettyPrint(kartta) : nothing

    gps = 0

    for row in 1:size(kartta)[1]
        for col in 1:size(kartta)[2]
            if kartta[row,col] == "O"
                gps += 100*(row-1) + col-1
            end
        end
    end

    return gps
end

# ╔═╡ c264c6ce-a4af-42e6-bb5f-56af803a3e31
function getInput2(testing)
    kartta, instructions = getInput(testing)

	#prettyPrint(kartta)

    uusiKartta = Matrix{String}(undef, size(kartta)[1], 2*size(kartta)[2])
	#prettyPrint(uusiKartta)

    for i in 1:size(kartta)[1]
        for j in 1:size(kartta)[2]
            j21 = 2*j - 1
            j22 = 2*j
            
            if kartta[i,j] == "@"
                uusiKartta[i,j21] = "@"
                uusiKartta[i,j22] = "."
            elseif kartta[i,j] == "O"
                uusiKartta[i,j21] = "["
                uusiKartta[i,j22] = "]"
            else
                uusiKartta[i,j21] = kartta[i,j]
                uusiKartta[i,j22] = kartta[i,j]
            end
        end
    end

	#prettyPrint(uusiKartta)

    return uusiKartta, instructions
end

# ╔═╡ da0ce9af-cacc-445c-9320-494bf2617831
function part2(testing)
    kartta, instructions = getInput2(testing)

    for inst in instructions
		kartta = applyInstruction2(string(inst), kartta)
	end
	
	gps = 0

	for row in 1:size(kartta)[1]
        for col in 1:size(kartta)[2]
            if kartta[row,col] == "["
                gps += 100*(row-1) + col-1
            end
        end
    end

	return gps
end

# ╔═╡ 5e82ceb5-86f2-4150-8864-87140f54e5e9
part2(false)

# ╔═╡ Cell order:
# ╠═5e82ceb5-86f2-4150-8864-87140f54e5e9
# ╠═da0ce9af-cacc-445c-9320-494bf2617831
# ╠═db5979c8-3f80-4601-a613-20d53a26be5c
# ╠═8868c20c-579a-4e93-8585-3fa0c7cae5f3
# ╠═12731cb6-eb86-44a2-9a75-f7545cdfa71b
# ╠═29da9340-5897-4344-88bb-3702bc533a81
# ╠═98baf438-ff3c-4bfa-8471-eb0e641bac45
# ╠═c264c6ce-a4af-42e6-bb5f-56af803a3e31
# ╠═77e3e174-bec6-11ef-20e2-f147c35c4485
