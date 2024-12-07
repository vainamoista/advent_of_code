### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

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

	function cat(value1::String, value2::String)
		return value1*value2
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
		push!(result, String.(strip.(vector[i],':')))
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

		# Checks all x possible permutations of [add,mul] for each set of
		# values, outputing as a binary number in string, i.e. "00101",
		# with the string length equal to the number of operators (number of
		# values less one).
		for i=0:2^numOperators - 1
			strPer = lpad(string(i, base=2),numOperators, "0")
			if mathEquals(row, strPer, [add,mul])
				matchSum += parse(Int, row[1])
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

		# Same logic as part1(), but now there are 3 possibilities for each
		# operator, so we change to base 3 and adjust the array of possible
		# operators. Interesting side note: you can pass the same list of 3
		# operators to part1() and it continues to work normally, because 
		# the string binary only has 0s and 1s, so element 3 is never called 
		# in mathEquals()
		for i=0:3^numOperators - 1
			strPer = lpad(string(i, base=3),numOperators, "0")
			if mathEquals(row, strPer, [add,mul,cat])
				matchSum += parse(Int, row[1])
				break
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

# ╔═╡ a00287b9-c5dc-45e5-85a9-48ea9d00c87a
main()

# ╔═╡ Cell order:
# ╠═73264914-8aa8-496f-97ad-a5f5e252fce9
# ╠═e275b841-f915-41b7-b20b-b75854a1df1d
# ╠═723b9698-b452-11ef-0365-81ba126f5f47
# ╠═afa20aac-8d6f-4d33-88b8-1adef1c5b867
# ╠═333a4dc5-5446-427d-905e-acdbaefe3dc7
# ╠═215e6a83-11ae-4319-a6ec-c3247ac528c4
# ╠═a00287b9-c5dc-45e5-85a9-48ea9d00c87a
