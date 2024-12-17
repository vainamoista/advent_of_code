### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 804028ac-ba14-11ef-363d-6b4e1cd67750
function getInput()
    input = readlines("day12_input.txt")

    input2 = split("RRRRIICCFF
RRRRIICCCF
VVRRRCCFFF
VVRCCCJFFF
VVVVCJJCFE
VVIVCCJJEE
VVIIICJJEE
MIIIIIJJEE
MIIISIJEEE
MMMISSJEEE", "\n")

	input2 = split("EEEEE
EXXXX
EEEEE
EXXXX
EEEEE", "\n"
)

	input2 = split("AAAAAA
AAABBA
AAABBA
ABBAAA
ABBAAA
AAAAAA", "\n"
)

    strArray = Array{String}(undef, size(input)[1], length(input[1]))

    for i in 1:size(strArray)[1]
        for j in 1:size(strArray)[2]
            strArray[i,j] = string(input[i][j])
        end
    end

    return strArray
end

# ╔═╡ 2ed3d290-178b-4f49-acfc-7725e6ecea42
# same col, but adjacent row
function existsAdjacentX(what, thisArrayThing)
	for item in thisArrayThing
		if item[1] == what[1] + 1 || item[1] == what[1] - 1
			if item[2] == what[2]
				return true
			end
		end
	end

	return false
end

# ╔═╡ c11474a9-807c-42bb-96e0-de76a996c48c
# same row, but adjacent col
function existsAdjacentY(what, thisArrayThing)
	for item in thisArrayThing
		if item[1] == what[1]
			if item[2] == what[2] + 1 || item[2] == what[2] - 1
				return true
			end
		end
	end
	return false
end

# ╔═╡ dc3c8a3c-c0a0-4d78-a58d-18509a6bae8b
function evalBlock(map, visited, row, col, nSides, onLeft, onTop, onRight, onBottom, original)

	if row<1 || row>size(map)[1] || col<1 || col>size(map)[2] || visited[row,col] == "."
		return (visited, 0, 0, nSides, onLeft, onTop, onRight, onBottom)
	end


	newVisited = deepcopy(visited)
	newVisited[row,col] = "."
    block=1
    perim=0


    if row==1
        perim += 1
		push!(onTop, (row,col))
	elseif map[row-1,col] != map[row,col]
		perim += 1
		push!(onTop, (row,col))
	else
		(newVisited, newBlock, newPerim, nSides, onLeft, onTop, onRight, onBottom) = evalBlock(map, newVisited, row-1, col, nSides, onLeft, onTop, onRight, onBottom, false)
		block += newBlock
		perim += newPerim
	end

	if row==size(map)[1]
		perim += 1
		push!(onBottom, (row,col))
	elseif map[row+1,col] != map[row,col]
		perim += 1
		push!(onBottom, (row,col))
	else
		(newVisited, newBlock, newPerim, nSides, onLeft, onTop, onRight, onBottom) = evalBlock(map, newVisited, row+1, col, nSides, onLeft, onTop, onRight, onBottom, false)
		block += newBlock
		perim += newPerim
	end

	if col==1
		perim += 1
		push!(onLeft, (row,col))
	elseif map[row, col-1] != map[row,col]
		perim += 1
		push!(onLeft, (row,col))
	else
		(newVisited, newBlock, newPerim, nSides, onLeft, onTop, onRight, onBottom) = evalBlock(map, newVisited, row, col-1, nSides, onLeft, onTop, onRight, onBottom, false)
		block += newBlock
		perim += newPerim
	end

	if col == size(map)[2]
		perim += 1
		push!(onRight, (row,col))
	elseif map[row,col+1] != map[row,col]
		perim += 1
		push!(onRight, (row,col))
	else
		(newVisited, newBlock, newPerim, nSides, onLeft, onTop, onRight, onBottom) = evalBlock(map, newVisited, row, col+1, nSides, onLeft, onTop, onRight, onBottom, false)
		block += newBlock
		perim += newPerim
	end

	if original
		nSides = 0
		sort!(onTop, by=x->x[1]x[2])
		sort!(onBottom, by=x->x[1]x[2])
		sort!(onLeft, by=x->x[2]x[1])
		sort!(onRight, by=x->x[2]x[1])
	end
	
	for i=1:size(onTop)[1]
		if i==size(onTop)[1]
			nSides += 1
		elseif existsAdjacentY(onTop[i], onTop[i+1:end])
			continue
		else
			nSides += 1
		end
	end

	for i = 1:size(onBottom)[1]
		if i==size(onBottom)[1]
			nSides += 1
		elseif existsAdjacentY(onBottom[i], onBottom[i+1:end])
			continue
		else
			nSides += 1
		end
	end

	for i = 1:size(onLeft)[1]
		if i==size(onLeft)[1]
			nSides += 1
		elseif existsAdjacentX(onLeft[i], onLeft[i+1:end])
			continue
		else
			nSides += 1
		end
	end

	for i = 1:size(onRight)[1]
		if i==size(onRight)[1]
			nSides += 1
		elseif existsAdjacentX(onRight[i], onRight[i+1:end])
			continue
		else
			nSides += 1
		end
	end
	
	return (newVisited, block, perim, nSides, onLeft, onTop, onRight, onBottom)
end

# ╔═╡ 8a6a8916-4a4d-4545-ae98-c2999ebc58c1
function existsX(what, thisArrayThing)
	for item in thisArrayThing
		if item[1] == what
			return true
		end
	end
	return false
end

# ╔═╡ f9df03a7-c092-493d-b1e2-2408d6028ccb
function existsY(what, thisArrayThing)
	for item in thisArrayThing
		if item[2] == what
			return true
		end
	end
	return false
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
	cost2 = 0
	
	for i in 1:size(map)[1]
		for j in 1:size(map)[2]
			if visited[i,j] != "."
				(visited, block, perim, nSides) = evalBlock(map, visited, i, j, 0, [], [], [], [], true)
				cost += block*perim
				cost2 += block*nSides
			end
		end
	end

	return (cost, cost2)
end

# ╔═╡ 47efdb1c-7f57-4ad4-962a-334816a7fc58
println(evalMap(getInput()))

# ╔═╡ Cell order:
# ╠═47efdb1c-7f57-4ad4-962a-334816a7fc58
# ╠═804028ac-ba14-11ef-363d-6b4e1cd67750
# ╠═dc3c8a3c-c0a0-4d78-a58d-18509a6bae8b
# ╠═2ed3d290-178b-4f49-acfc-7725e6ecea42
# ╠═c11474a9-807c-42bb-96e0-de76a996c48c
# ╠═8a6a8916-4a4d-4545-ae98-c2999ebc58c1
# ╠═f9df03a7-c092-493d-b1e2-2408d6028ccb
# ╠═c119974f-7fe8-48f0-a1b8-276b314dc450
