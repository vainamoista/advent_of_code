### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ a00287b9-c5dc-45e5-85a9-48ea9d00c87a
begin
	using BenchmarkTools
	@benchmark part2()
end

# ╔═╡ 73264914-8aa8-496f-97ad-a5f5e252fce9
# Given a particular permutation of operators, written in base(operators.length),
# find the result and return true if it equals the first number of the list
function mathEquals(numList, binaryString, operators)
	result = numList[1]
	testResult = numList[2];
	for i in 1:length(binaryString)
		operator = operators[parse(Int, binaryString[i])+1]
		testResult = operator(testResult,numList[i+2])
	end
	if testResult == result
		return true
	else
		return false
	end
end

# ╔═╡ e275b841-f915-41b7-b20b-b75854a1df1d
begin
	# Defining some functions for pairs of strings
	function add(value1::String, value2::String)
		return string(+(parse(Int, value1), parse(Int, value2)))
	end

	function mul(value1::String, value2::String)
		return string(*(parse(Int, value1), parse(Int, value2)))
	end

	function cat(value1::Int, value2::Int)
		return parse(Int, string(value1) * string(value2))
	end
	
end

# ╔═╡ 723b9698-b452-11ef-0365-81ba126f5f47
function getTextAs2DVector()
	# Reads the input file and returns a vector of strings
	file = readlines(open("day7_input.txt"))

	vector = split.(file, " ")
	result = []
	for i in eachindex(vector)
		vector[i] = strip.(vector[i],':')
		push!(result, parse.(Int, strip.(vector[i],':')))
	end

	return result
end

# ╔═╡ 333a4dc5-5446-427d-905e-acdbaefe3dc7
function part1()
	numberList = getTextAs2DVector()

	matchSum = 0;
	for row in numberList
		numOperators = length(row) - 2
		result = row[1]
		ops = [+,*]

		# Checks all x possible permutations of [add,mul] for each set of
		# values, outputing as a binary number in string, i.e. "00101",
		# with the string length equal to the number of operators (number of
		# values less one).
		for i=0:2^numOperators - 1
			strPer = lpad(string(i, base=2),numOperators, "0")
			if mathEquals(row, strPer, ops)
				matchSum += row[1]
				break
			end
		end
	end

	println("Part 1 result: ", matchSum)
end

# ╔═╡ 215e6a83-11ae-4319-a6ec-c3247ac528c4
function part2()
	numberList = getTextAs2DVector()

	matchSum = 0;
	for row in numberList
		numOperators = length(row) - 2
		result = row[1]
		ops = [+,*,cat]

		if result % row[end] != 0
			for i=0:3^(numOperators-1) - 1
				strPer = rpad(lpad(string(i, base=3),numOperators-1, "0"),numOperators, "0")
				strPer2 = rpad(lpad(string(i, base=3),numOperators-1, "0"),numOperators, "2")
				if mathEquals(row, strPer, ops)
					matchSum += row[1]
					break
				elseif mathEquals(row, strPer2, ops)
					matchSum += row[1]
					break
				end
			end
		elseif string(result)[end-length(string(row[end])):end] != string(row[end])
			for i=0:3^(numOperators-1) - 1
				strPer = rpad(lpad(string(i, base=3),numOperators-1, "0"),numOperators, "0")
				strPer2 = rpad(lpad(string(i, base=3),numOperators-1, "0"),numOperators, "1")
				if mathEquals(row, strPer, ops)
					matchSum += row[1]
					break
				elseif mathEquals(row, strPer2, ops)
					matchSum += row[1]
					break
				end
			end
		else
			for i=0:3^numOperators - 1
				strPer = lpad(string(i, base=3),numOperators, "0")
				if mathEquals(row, strPer, ops)
					matchSum += row[1]
					break
				end
			end
		end
	end

	println("Part 2 result: ", matchSum)
end

# ╔═╡ afa20aac-8d6f-4d33-88b8-1adef1c5b867
function main()
	# The driver function
	part1()
	part2()
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"

[compat]
BenchmarkTools = "~1.5.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.2"
manifest_format = "2.0"
project_hash = "61c30062a384602fe87efb278f2fa7342de39e7e"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.BenchmarkTools]]
deps = ["JSON", "Logging", "Printf", "Profile", "Statistics", "UUIDs"]
git-tree-sha1 = "f1dff6729bc61f4d49e140da1af55dcd1ac97b2f"
uuid = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
version = "1.5.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Profile]]
uuid = "9abbd945-dff8-562f-b5e8-e1ebf5ef1b79"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"
"""

# ╔═╡ Cell order:
# ╠═73264914-8aa8-496f-97ad-a5f5e252fce9
# ╠═e275b841-f915-41b7-b20b-b75854a1df1d
# ╠═723b9698-b452-11ef-0365-81ba126f5f47
# ╠═afa20aac-8d6f-4d33-88b8-1adef1c5b867
# ╠═333a4dc5-5446-427d-905e-acdbaefe3dc7
# ╠═215e6a83-11ae-4319-a6ec-c3247ac528c4
# ╠═a00287b9-c5dc-45e5-85a9-48ea9d00c87a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
