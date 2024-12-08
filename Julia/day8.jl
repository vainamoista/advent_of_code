### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ d149b860-b561-11ef-3bac-27431fd95291
function inputText()
	text = readlines("day8_input.txt")

	
	test = split("............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............", "\n")

	return text
end

# ╔═╡ 8ef477fe-b8b8-4f02-bf2b-fa70d7f070cd
function findAntinodes(text, char, antinodes)
	positions = []

	for rowᵢ in eachindex(text)
		for colⱼ in eachindex(text[rowᵢ])
			if isequal(text[rowᵢ][colⱼ], char)
				push!(positions, [rowᵢ,colⱼ])
			end
		end
	end

	for i in eachindex(positions)
		for j in eachindex(positions)
			if isequal(j,i)
				continue
			else
				newAntinode = 2 .* (positions[j] .- positions[i]) + positions[i]
				
				if newAntinode[1] >= 1 && newAntinode[1] <= length(text) &&
				   newAntinode[2] >= 1 && newAntinode[2] <= length(text[1])
					antinodes = union(antinodes, [newAntinode])
				end
			end
		end
	end
	
	return antinodes
end

# ╔═╡ 4da4354c-9af1-4ecc-b8b9-78887b7ac1fa
function findAntinodesResonant(text, char, antinodes)
	positions = []

	for rowᵢ in eachindex(text)
		for colⱼ in eachindex(text[rowᵢ])
			if isequal(text[rowᵢ][colⱼ], char)
				push!(positions, [rowᵢ,colⱼ])
			end
		end
	end

	for i in eachindex(positions)
		pᵢ = positions[i]
		for j in eachindex(positions)
			pⱼ = positions[j]
			if isequal(j,i)
				continue
			else
				pⱼᵢ = pⱼ - pᵢ
				v = lcm(pⱼᵢ) .* pⱼᵢ ./ abs.( pⱼᵢ .* reverse(pⱼᵢ))

				tmp = pᵢ + v

				while tmp[1] >= 1 && tmp[1] <= length(text) &&
				   tmp[2] >= 1 && tmp[2] <= length(text[1])
					antinodes = union(antinodes, [tmp])
					tmp = tmp + v
				end
			end
		end
	end
	
	return antinodes
end

# ╔═╡ 92d5fd97-cf87-488f-b7a6-50ff41bfdfc2
function part1()
	text = inputText()

	usedVars = "."
	antinodes = []
	
	for row in text
		for char in row
			if !contains(usedVars,char)
				usedVars = usedVars*char
				antinodes = findAntinodes(text, char, antinodes)
			end
		end
	end

	println(length(antinodes))
				
end

# ╔═╡ 9287c22a-55a9-475d-9666-f6315092fed4
function part2()
	text = inputText()

	usedVars = "."
	antinodes = []
	
	for row in text
		for char in row
			if !contains(usedVars,char)
				usedVars = usedVars*char
				antinodes = findAntinodesResonant(text, char, antinodes)
			end
		end
	end

	println(length(antinodes))
				
end

# ╔═╡ 63dae02d-fe54-45c3-bd51-fe0e6df7224f
function main()
	part1()
	part2()
end

# ╔═╡ 1ac4976f-c4e3-496c-99b0-07c1372328a5
main()

# ╔═╡ 41eec4bf-b790-43e5-b151-8da3f8ba28d4
begin
	v = [8,-12]

	v = [(v[1]/abs(v[1]))*
		lcm(v)/abs(v[2]),
		(v[2]/abs(v[2]))*
		lcm(v)/abs(v[1])
	]
end

# ╔═╡ 45acc716-70bc-4da2-8b69-ec0acccfc2ff
begin
	vn = [8,-12]

	vn = lcm(vn) .* vn ./ abs.(vn .* reverse(vn))
end

# ╔═╡ 4bee521e-aa83-4598-8e32-24d18feceb59
reverse([1,3])

# ╔═╡ Cell order:
# ╠═d149b860-b561-11ef-3bac-27431fd95291
# ╠═8ef477fe-b8b8-4f02-bf2b-fa70d7f070cd
# ╠═4da4354c-9af1-4ecc-b8b9-78887b7ac1fa
# ╠═63dae02d-fe54-45c3-bd51-fe0e6df7224f
# ╠═92d5fd97-cf87-488f-b7a6-50ff41bfdfc2
# ╠═9287c22a-55a9-475d-9666-f6315092fed4
# ╠═1ac4976f-c4e3-496c-99b0-07c1372328a5
# ╠═41eec4bf-b790-43e5-b151-8da3f8ba28d4
# ╠═45acc716-70bc-4da2-8b69-ec0acccfc2ff
# ╠═4bee521e-aa83-4598-8e32-24d18feceb59
