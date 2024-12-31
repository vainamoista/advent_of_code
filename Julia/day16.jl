### A Pluto.jl notebook ###
# v0.20.4

using Markdown
using InteractiveUtils

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
end

# ╔═╡ 8cc04ce0-d0b8-4cec-96bb-e0320fa6f711
part1(true)

# ╔═╡ Cell order:
# ╠═8cc04ce0-d0b8-4cec-96bb-e0320fa6f711
# ╠═f19df63a-8616-4be7-9cd3-8641d0fa68cf
# ╠═fc94f06f-34f1-4997-ae6e-75391c4fb09b
# ╠═320cd164-bf17-11ef-3aae-3d71496d5770
