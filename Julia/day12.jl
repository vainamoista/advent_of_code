### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 804028ac-ba14-11ef-363d-6b4e1cd67750
function getInput()
    input = readlines("day12_input.txt")

    input = split("RRRRIICCFF
RRRRIICCCF
VVRRRCCFFF
VVRCCCJFFF
VVVVCJJCFE
VVIVCCJJEE
VVIIICJJEE
MIIIIIJJEE
MIIISIJEEE
MMMISSJEEE", "\n")

	input = split("EEEEE
EXXXX
EEEEE
EXXXX
EEEEE", "\n"
)

	input = split("AAAA
BBCD
BBCC
EEEC", "\n"
)

    strArray = Array{String}(undef, size(input)[1], length(input[1]))

    for i in 1:size(strArray)[1]
        for j in 1:size(strArray)[2]
            strArray[i,j] = string(input[i][j])
        end
    end

    return strArray
end

# ╔═╡ ef4a3461-fa7d-4efd-8add-92706b30adce
function part2()
	map = getInput()

	println(evalMap2(map))
end

# ╔═╡ 862e51d7-aa72-425f-a382-cb36eee4390f


# ╔═╡ dc3c8a3c-c0a0-4d78-a58d-18509a6bae8b
function evalBlock(map, visited, i, j)
	if i<1 || i>size(map)[1] || j<1 || j>size(map)[2] || visited[i,j] == "."
		return (visited, 0, 0)
	end

	newVisited = deepcopy(visited)
	newVisited[i,j] = "."
    block=1
    perim=0

    if i==1
        perim += 1
	elseif map[i-1,j] != map[i,j]
		perim += 1
	else
		(newVisited, newBlock, newPerim) = evalBlock(map, newVisited, i-1, j)
		block += newBlock
		perim += newPerim
	end

	if i==size(map)[1]
		perim += 1
	elseif map[i+1,j] != map[i,j]
		perim += 1
	else
		(newVisited, newBlock, newPerim) = evalBlock(map, newVisited, i+1, j)
		block += newBlock
		perim += newPerim
	end

	if j==1
		perim += 1
	elseif map[i, j-1] != map[i,j]
		perim += 1
	else
		(newVisited, newBlock, newPerim) = evalBlock(map, newVisited, i, j-1)
		block += newBlock
		perim += newPerim
	end

	if j == size(map)[2]
		perim += 1
	elseif map[i,j+1] != map[i,j]
		perim += 1
	else
		(newVisited, newBlock, newPerim) = evalBlock(map, newVisited, i, j+1)
		block += newBlock
		perim += newPerim
	end
	return (newVisited, block, perim)
end

# ╔═╡ c119974f-7fe8-48f0-a1b8-276b314dc450
function evalMap(map)
	visited = Array{String}(undef, size(map)[1], size(map)[2])
	sided = Array{String}(undef, size(map)[1], size(map)[2])
	for index in eachindex(visited)
		visited[index] = ""
		sided[index] = ""
	end

	cost = 0
	
	for i in 1:size(map)[1]
		for j in 1:size(map)[2]
			if visited[i,j] != "."
				(visited, block, perim) = evalBlock(map, visited, i, j)
				println(map[i,j], ",", block, ",", perim)
				cost += block*perim
			end
		end
	end

	return cost
	
end

# ╔═╡ 47efdb1c-7f57-4ad4-962a-334816a7fc58
function part1()
	map = getInput()

	println(evalMap(map))
end

# ╔═╡ d6149cbf-3b78-48b4-9cb4-001084d51bd8
part1()

# ╔═╡ Cell order:
# ╠═d6149cbf-3b78-48b4-9cb4-001084d51bd8
# ╠═47efdb1c-7f57-4ad4-962a-334816a7fc58
# ╠═ef4a3461-fa7d-4efd-8add-92706b30adce
# ╠═804028ac-ba14-11ef-363d-6b4e1cd67750
# ╠═862e51d7-aa72-425f-a382-cb36eee4390f
# ╠═dc3c8a3c-c0a0-4d78-a58d-18509a6bae8b
# ╠═c119974f-7fe8-48f0-a1b8-276b314dc450
