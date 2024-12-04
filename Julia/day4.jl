### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 1642e15a-3178-444f-b543-3c4ec9f9f0de
begin
	function search_direction(text, row, column, to_right, to_down)
	
		if to_right == 1
			if column >= length(text[row]) - 3
				return false
			end
		elseif to_right == -1
			if column <= 3
				return false
			end
		end

		if to_down == 1
			if row >= length(text) - 3
				return false
			end
		else
			if to_down == -1
				return false
			end
		end
		
		isM = text[row + to_down*1][column + to_right*1] == 'M'
		isA = text[row + to_down*2][column + to_right*2] == 'A'
		isS = text[row + to_down*3][column + to_right*3] == 'S'

		return isM && isA && isS
		
	end
	
	function east(text, row, column)
		return search_direction(text, row, column, 1, 0)
	end

	function south_east(text, row, column)
		return search_direction(text, row, column, 1, 1)
	end

	function south(text, row, column)
		return search_direction(text, row, column, 0, 1)
	end

	function south_west(text, row, column)
		return search_direction(text, row, column, -1, 1)
	end

	function west(text, row, column)
		return search_direction(text, row, column, -1, 0)
	end

	function north_west(text, row, column)
		return search_direction(text, row, column, -1, -1)
	end

	function north(text, row, column)
		return search_direction(text, row, column, 0, -1)
	end

	function north_east(text, row, column)
		return search_direction(text, row, column, 1, -1)
	end
end

# ╔═╡ c3d69fa5-317c-46cd-beb4-1609064458a9
begin
	function count_xmas(input_text)
		lines = split(input_text,"\n")
		count = 0
		for i in eachindex(lines)
			for j in eachindex(lines[i])
				if lines[i][j] == 'X'
					println("ij: " *string(i)*string(j))
					east(lines, i, j) ? count += 1 : println("no e")
					south_east(lines,i,j) ? count += 1 : println("no se")
					south(lines,i,j) ? count += 1 : println("no s")
					south_west(lines,i,j) ? count += 1 : println("no sw")
					west(lines,i,j) ? count += 1 : println("no w")
					north_west(lines,i,j) ? count += 1 : println("no nw")
					north(lines,i,j) ? count += 1 : println("no n")
					north_east(lines,i,j) ? count += 1 : println("no ne")
				end
			end
		end
		count
	end
end

# ╔═╡ aa43f3b2-b239-11ef-3b47-bd8788d92361
begin
	test_input = "MMMSXXMASM\nMSAMXMSMSA\nAMXSXMAAMM\nMSAMASMSMX\nXMASAMXAMM\nXXAMMXXAMA\nSMSMSASXSS\nSAXAMASAAA\nMAMMMXMMMM\nMXMXAXMASX"

	test_input_s = "MSAMXMSMSA\nAMXSXMAAMM\nMSAMASMSMX\nXMASAMXAMM"

	count_xmas(test_input_s)
end

# ╔═╡ 3f5ff917-bf3a-47ec-8f3d-81da994b159a
typeof(nothing)

# ╔═╡ Cell order:
# ╠═aa43f3b2-b239-11ef-3b47-bd8788d92361
# ╠═1642e15a-3178-444f-b543-3c4ec9f9f0de
# ╠═c3d69fa5-317c-46cd-beb4-1609064458a9
# ╠═3f5ff917-bf3a-47ec-8f3d-81da994b159a
