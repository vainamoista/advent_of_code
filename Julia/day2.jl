### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 0b45e6b4-b04f-11ef-362e-af2184fe9986
begin
	function isSafe(list)
		diff = list[2:end] - list[1:end-1]
		allSameSign = all(diff.>0) || all(diff.<0)

		allLessThree = all(abs.(diff).<=3)

		return allSameSign && allLessThree
	end
end

# ╔═╡ da52e607-77ab-4374-b1a5-cf3c8e0dd03f
begin
	list1 = [7,6,4,2,1]
	list2 = [1,2,7,8,9]
	list3 = [9,7,6,2,1]
	list4 = [1,3,2,4,5]
	list5 = [8,6,4,4,1]
	list6 = [1,3,6,7,9]
	
	println(isSafe(list1))
	println(isSafe(list2))
	println(isSafe(list3))
	println(isSafe(list4))
	println(isSafe(list5))
	println(isSafe(list6))
end

# ╔═╡ d380f00f-68e6-45c4-b77f-4ede4f8eeaa6
begin
	data = open("day2_input.txt")

	lines = readlines(data)

	safeReports = 0
	for line in lines
		pline = parse.(Int, split(line))
		if isSafe(pline)
			safeReports += 1
		else
			for i in eachindex(pline)
				tpline = deleteat!(copy(pline), i)
				if isSafe(tpline)
					safeReports += 1
					break
				end
			end
		end
	end

	println(safeReports)
end

# ╔═╡ 815ec847-813a-485a-a72d-a293f688671f
begin
	tlist = [1,4,2,1]
	plist = copy(tlist)

	deleteat!(plist,2)

	tlist
	plist
end

# ╔═╡ Cell order:
# ╠═0b45e6b4-b04f-11ef-362e-af2184fe9986
# ╠═da52e607-77ab-4374-b1a5-cf3c8e0dd03f
# ╠═d380f00f-68e6-45c4-b77f-4ede4f8eeaa6
# ╠═815ec847-813a-485a-a72d-a293f688671f
