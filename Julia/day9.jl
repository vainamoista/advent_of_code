### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 506f6713-35ce-4774-80d9-2093268d4a5d
function getFreeSpaceChunks(blocks)
	result = []
	startIndex = -1
	howMany = -1
	freeSpaceIndices = findall(isequal("."), blocks)
	for i in eachindex(freeSpaceIndices)
		if i > 1
			if freeSpaceIndices[i] == freeSpaceIndices[i-1] + 1
				howMany += 1
			else
				#println("push")
				push!(result, [startIndex, howMany])
				startIndex = freeSpaceIndices[i]
				howMany = 1
			end
		else
			startIndex = freeSpaceIndices[i]
			howMany = 1
		end
	end
	push!(result, [startIndex, howMany])
    result
end

# ╔═╡ 15e9c9f2-3524-4a3e-aad7-7a7d67357c6e
function getInput()
    f = open("day9_input.txt")

    text = readline(f)

    test = "2333133121414131402"

    return test
end

# ╔═╡ a6a8cbff-3e3f-4c29-ab1b-563c19701eae
function simplify(values, lengths)
	index = 1
	while index < length(values)
		if values[index] == values[index+1]
			popat!(values, index)
			lengths[index+1] += lengths[index]
			popat!(lengths, index)
		else
			index += 1
		end
	end

	return (values, lengths)
end

# ╔═╡ 35318d69-9b64-4d80-8faa-3d8fa122a192
function move2(values, lengths, thisValue)
	thisIndex = findfirst(values .== thisValue)
	thisLength = lengths[thisIndex]

	for index in eachindex(values)
		if values[index] != -1 || lengths[index] < thisLength
			continue
		elseif values[index] == -1 && lengths[index] > thisLength
			#println("move2() swapping ", index, " with ", thisIndex)
			values[index] = thisValue
			values[thisIndex] = -1
			break
		else
			#println("move2() swapping smaller ", index, " with ", thisIndex)
			values[index] = thisValue
			values[thisIndex] = -1

			insert!(values, index+1, -1)
			insert!(lengths, index+1, lengths[index] - thisLength)

			lengths[index] = thisLength
			break
		end
	end

	return simplify(values, lengths)
end

# ╔═╡ 3f50b915-f2e9-4cc1-a001-74df83860472
function switch(array, firstIndex, secondIndex, length)
	result = copy(array)

	for i in eachindex(array)
		if i<firstIndex
			continue
		elseif i<firstIndex+length
			#println("switch() ", i, " ", firstIndex, " ", secondIndex)
			result[i] = array[secondIndex+i-firstIndex]
			result[secondIndex+i-firstIndex] = "."
		else
			break
		end
	end

	return result
end

# ╔═╡ 5cd33444-20db-43c6-a317-f4facccfc485
function move(blocks, value)
	chunks = getFreeSpaceChunks(blocks)

	needBlockLength = length(findall(isequal(value), blocks))
	index2 = findfirst(isequal(value), blocks)
	#println("move() index2: ", index2)
	
	for i in eachindex(chunks)
		if chunks[i][2] >= needBlockLength && chunks[i][1] < index2
			#println("move() Must move: (", chunks[i][1], ",", chunks[i][2],
			#	") for number ", value, " and length ", needBlockLength)
			blocks = switch(blocks, chunks[i][1], index2, needBlockLength)
		end
	end

	blocks
end

# ╔═╡ 84dc46be-3e09-485b-96d7-b396505e10e5
function toBlocks(text)
    intVec = parse.(Int, split(text,""))
    numBlocks = sum(intVec)

    result = Array{String}(undef, numBlocks)

    idNumber = 0
    isFile = true
    index = 1
    for item in intVec
        for tally in 1:item
            if isFile
                result[index] = string(idNumber)
            else
                result[index] = "."
            end
            index += 1
        end

        if isFile && index<length(result)
            idNumber += 1
        end
        isFile = !isFile
    end

    return result
end

# ╔═╡ 1ed598e4-fea3-4466-9112-93ded543f95f
function part1()
    input = getInput()
    blocks = toBlocks(input)

    lowIndex = 1
    highIndex = length(blocks)

    while highIndex > lowIndex
        if blocks[highIndex] == "."
            highIndex -= 1
        end
        if blocks[lowIndex] != "."
            lowIndex += 1
        end

        if blocks[highIndex] != "." && blocks[lowIndex] == "."
            blocks[lowIndex] = blocks[highIndex]
            blocks[highIndex] = "."
        end
    end

    result = 0
    
    for index in 1:length(blocks)
        if blocks[index] != "."
            result = result + ((index-1)*parse(Int, blocks[index]))
        end
    end
    result
end

# ╔═╡ 249b16d7-b933-416a-bc10-e1ed971832ef
function part2()
	input = getInput()
	blocks = toBlocks(input)

	#println("part2() ", join(blocks))

	index = lastindex(blocks)
	while blocks[index] == "."
		index -= 1
	end

	maxValue = parse(Int, blocks[index])

	for value in maxValue:-1:1
		#println("Now for value ", value, "! <><><>")
		blocks = move(blocks, string(value))
		#println("Result: ", join(blocks))
	end

		blocks

	result = 0
    
    for index in 1:length(blocks)
        if blocks[index] != "."
            result = result + ((index-1)*parse(Int, blocks[index]))
        end
    end
	println("part2():  ", join(blocks))
    return result
end

# ╔═╡ 8ca2f0eb-2f95-4f64-9ddc-370ea513f165
function main()
	#(("Part 1: " * string(part1())), ("Part 2: " * string(part2())))
	part2()
end

# ╔═╡ 15cc7593-548d-48b3-9b4e-85f162844aae
function toBlocks2(text)
    intVec = parse.(Int, split(text,""))
    numBlocks = length(intVec)

    lengths = copy(intVec)
	values = Vector{Any}(undef, numBlocks)

    idNumber = 0
    isFile = true
    for index in eachindex(intVec)
		values[index] = isFile ? idNumber : -1
		if isFile
			idNumber += 1
		end
		isFile = !isFile
	end

    return (values, lengths)
end

# ╔═╡ 3aa7e902-5f98-4da9-afb4-cc2257d77d11
function part22()
	(values,lengths) = toBlocks2(getInput())

	#println("part22(): ", values)

	maxValue = maximum(values)
	#println("part22(): ", typeof(values))
	#println("part22(): ", typeof(maxValue))

	for value in maxValue:-1:1
		(values, lengths) = move2(values, lengths, value)
	end

	strResult = ""
	for i in eachindex(values)
		if values[i] == -1
			strResult *= repeat(".",lengths[i])
		else
			strResult *= repeat(string(values[i]), lengths[i])
		end
	end

	result = 0

	for index in 1:length(strResult)
        if strResult[index] != '.'
			#println(strResult[index])
			#println(typeof(strResult[index]))
            result = result + ((index-1)*parse(Int, strResult[index]))
        end
    end

	println("part22(): ", strResult)
	return result
end

# ╔═╡ f4540ea2-1bb8-4224-a8cb-767fc0f9bf30
begin
	part2()
	part22()
end

# ╔═╡ Cell order:
# ╠═f4540ea2-1bb8-4224-a8cb-767fc0f9bf30
# ╠═506f6713-35ce-4774-80d9-2093268d4a5d
# ╠═15e9c9f2-3524-4a3e-aad7-7a7d67357c6e
# ╠═8ca2f0eb-2f95-4f64-9ddc-370ea513f165
# ╠═5cd33444-20db-43c6-a317-f4facccfc485
# ╠═35318d69-9b64-4d80-8faa-3d8fa122a192
# ╠═1ed598e4-fea3-4466-9112-93ded543f95f
# ╠═249b16d7-b933-416a-bc10-e1ed971832ef
# ╠═3aa7e902-5f98-4da9-afb4-cc2257d77d11
# ╠═a6a8cbff-3e3f-4c29-ab1b-563c19701eae
# ╠═3f50b915-f2e9-4cc1-a001-74df83860472
# ╠═84dc46be-3e09-485b-96d7-b396505e10e5
# ╠═15cc7593-548d-48b3-9b4e-85f162844aae
