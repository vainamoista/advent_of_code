### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 1642e15a-3178-444f-b543-3c4ec9f9f0de
begin
	function search_mas(text, row, column, to_right, to_down)
		if row < 1 || row > length(text)
			return false
		elseif column < 1 || column > length(text[row])
			return false
		end
		
		if to_right == 1
			if column > length(text[row]) - 2
				return false
			end
		elseif to_right == -1
			if column < 3
				return false
			end
		end

		if to_down == 1
			if row > length(text) - 2
				return false
			end
		elseif to_down == -1
			if row < 3
				return false
			end
		end

		isM = text[row + to_down*0][column + to_right*0] == 'M'
		isA = text[row + to_down*1][column + to_right*1] == 'A'
		isS = text[row + to_down*2][column + to_right*2] == 'S'

		return isM && isA && isS
	end
	
	function east(text, row, column)
		return search_mas(text, row, column, 1, 0)
	end

	function south_east(text, row, column)
		return search_mas(text, row, column, 1, 1)
	end

	function south(text, row, column)
		return search_mas(text, row, column, 0, 1)
	end

	function south_west(text, row, column)
		return search_mas(text, row, column, -1, 1)
	end

	function west(text, row, column)
		return search_mas(text, row, column, -1, 0)
	end

	function north_west(text, row, column)
		return search_mas(text, row, column, -1, -1)
	end

	function north(text, row, column)
		return search_mas(text, row, column, 0, -1)
	end

	function north_east(text, row, column)
		return search_mas(text, row, column, 1, -1)
	end

	function search_x_mas(text, row, column)
		if south_east(text, row, column)
			if north_east(text, row+2, column)
				println("se ", row, ",", column)
				println("ne ", row+2, ",", column)
				return true
			elseif south_west(text, row, column+2)
				println("se ", row, ",", column)
				println("sw ", row, ",", column+2)
				return true
			end
		elseif south_west(text, row, column)
			if north_west(text, row+2, column)
				println("sw ", row, ",", column)
				println("nw ", row+2, ",", column)
				return true
			end
		elseif north_east(text, row, column)
			if north_west(text, row, column+2)
				println("ne ", row, ",", column)
				println("nw ", row, ",", column+2)
				return true
			end
		end
		return false
	end

	function stoopid_search(text_lines)
		result = 0
		nrows = length(text_lines)
		ncolumns = length(text_lines[1])
		for i in 2:nrows-1
			for j in 2:ncolumns-1
				mat9 = [text_lines[i-1][j-1:j+1],text_lines[i][j-1:j+1],text_lines[i+1][j-1:j+1]]
				check9(mat9) ? result += 1 : nothing
			end
		end
		return result
	end

	function check9(block)
		if block[2][2] != 'A'
			return false
		end

		if contains.(block[1][1]*block[3][3],["M","S"]) == [true,true]
			if contains.(block[3][1]*block[1][3],["M","S"]) == [true,true]
				return true
			end
		end

		return false
	end
end

# ╔═╡ c3d69fa5-317c-46cd-beb4-1609064458a9
begin
	function count_xmas(lines)
		#lines = split(input_text,"\n")
		count = 0
		countmas = 0
		for i in eachindex(lines)
			for j in eachindex(lines[i])
				if lines[i][j] == 'X'
					east(lines,i,j+1) ? count += 1 : nothing
					south_east(lines,i+1,j+1) ? count += 1 : nothing
					south(lines,i+1,j) ? count += 1 : nothing
					south_west(lines,i+1,j-1) ? count += 1 : nothing
					west(lines,i,j-1) ? count += 1 : nothing
					north_west(lines,i-1,j-1) ? count += 1 : nothing
					north(lines,i-1,j) ? count += 1 : nothing
					north_east(lines,i-1,j+1) ? count += 1 : nothing
				elseif lines[i][j] == 'M'
					search_x_mas(lines,i,j) ? countmas += 1 : nothing
					#println("**")
				end
			end
			
		end
		(count, countmas)
	end
end

# ╔═╡ aa43f3b2-b239-11ef-3b47-bd8788d92361
begin
	test_input_1 = split("MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX",'\n')
	
	test_input_2 = split(".M.S......
..A..MSMS.
.M.S.MAA..
..A.ASMSM.
.M.S.M....
..........
S.S.S.S.S.
.A.A.A.A..
M.M.M.M.M.
..........",'\n')

	test_input_3 = "M.S\n.A.\nS.M"

	println(test_input_3)
	test_input_3 = split(test_input_3, "\n")

	#test_input_s = "XMAS\nMMPP\nAPAP\nSSSS"
	#println(test_input_s)

	real_input = readlines(open("day4_input.txt"))

	(xmas, x_mas) = count_xmas(test_input_3)
	println("part 1 result: " * string(xmas))
	println("part 2 result: " * string(x_mas))
	println(stoopid_search(real_input))
end

# ╔═╡ 3f5ff917-bf3a-47ec-8f3d-81da994b159a
begin
	m = []
	push!(m, [1,2,3])
	push!(m, [4,5,6])
	m[2][1:2]
	m == [[1,2,3],[4,5,6]]
end

# ╔═╡ Cell order:
# ╠═aa43f3b2-b239-11ef-3b47-bd8788d92361
# ╠═1642e15a-3178-444f-b543-3c4ec9f9f0de
# ╠═c3d69fa5-317c-46cd-beb4-1609064458a9
# ╠═3f5ff917-bf3a-47ec-8f3d-81da994b159a
