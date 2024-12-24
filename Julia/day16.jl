### A Pluto.jl notebook ###
# v0.20.4

using Markdown
using InteractiveUtils

# ╔═╡ 259058e4-ed13-4231-9597-5eefe805e17b
function nextDir(currentDir)
	if currentDir[2] == 0
		return [(0,1), (0,-1)]
	else
		return [(1,0), (-1,0)]
	end
end

# ╔═╡ 19d7669b-59e4-4c1e-b33d-690b5d50ff52
function doMaze(maze, position, direction, currentCost)
	costMap = Array{Int}(undef, size(maze)[1], size(maze)[2])
	location = findfirst(maze .== "S")
	direction = (0,1)
	
end

# ╔═╡ ea186ad4-d52c-4910-aff6-2d67cf163d10
function followThread(maze, position, direction, costMap)
	row = position[1]
	col = position[2]
	while row > 1 && row < size(maze)[1] && col > 1 && col < size(maze)[2]
		row += direction[1]
		col += direction[2]

		
		if (row, col) + nextDir(direction)[1] == "."
			dir1 = nextDir(direction)[1]
			pos1 = (row, col) + dir1
			costMap[pos1[1],pos1[2]]
			costMap = followThread(maze, pos1, dir1, costMap)
		end

		if (row, col) + nextDir(direction)[2] == "."
			dir2 = nextDir(direction)[2]
			pos2 = (row, col) + dir2
			costMap = followThread(maze, pos2, dir2, costMap)
		end

		
	end
end

# ╔═╡ ac48eaa7-1814-456e-86db-97b8f9fae3df
undef == undef

# ╔═╡ fc94f06f-34f1-4997-ae6e-75391c4fb09b
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

# ╔═╡ 320cd164-bf17-11ef-3aae-3d71496d5770
function getInput(testing)
	testText = split("###############
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

	testing ? text = testText : nothing

	result = Array{String}(undef, length(text[1]), size(text)[1])

	for i in 1:size(result)[1]
		for j in 1:size(result)[2]
			result[i,j] = string(text[i][j])
		end
	end

	return result
end

# ╔═╡ f19df63a-8616-4be7-9cd3-8641d0fa68cf
function part1(testing)
	maze = getInput(testing)

	prettyPrint(maze)

	costs = []

	doMaze(maze)
end

# ╔═╡ 8cc04ce0-d0b8-4cec-96bb-e0320fa6f711
part1(true)

# ╔═╡ Cell order:
# ╠═8cc04ce0-d0b8-4cec-96bb-e0320fa6f711
# ╠═f19df63a-8616-4be7-9cd3-8641d0fa68cf
# ╠═259058e4-ed13-4231-9597-5eefe805e17b
# ╠═19d7669b-59e4-4c1e-b33d-690b5d50ff52
# ╠═ea186ad4-d52c-4910-aff6-2d67cf163d10
# ╠═ac48eaa7-1814-456e-86db-97b8f9fae3df
# ╠═fc94f06f-34f1-4997-ae6e-75391c4fb09b
# ╠═320cd164-bf17-11ef-3aae-3d71496d5770
