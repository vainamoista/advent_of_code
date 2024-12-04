### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 3e5d0bcc-dc31-483d-8a3b-c0f30302bf63
function mul(v1, v2)
	v1*v2
end

# ╔═╡ 2ebae3fa-bbc9-4cf9-a0c5-7e0d73a151c6
function emp(val)
	eval(Meta.parse(val))
end

# ╔═╡ b2e638b6-1396-4206-848c-faa0ace60b13
function mul(text)
	result = 0
	for line in text
		m = eachmatch(r"(mul\(\d+,\d+\))", line)
		cm = collect(m)
		
		for element in cm
			result += emp(element[1])
		end
	end

	return result
end

# ╔═╡ 14fc2db7-351c-417b-a2db-e8cbbb3c7040
function muldodont(text)
	result = 0
	isDo = true
	
	for line in text
		m = eachmatch(r"(mul\(\d+,\d+\))|(do\(\))|(don't\(\))", line)
		cm = collect(m)
		
		for element in cm
			if element.match == "don't()"
				isDo = false
				continue
			elseif element.match == "do()"
				isDo = true
				continue
			end

			if isDo
				result += emp(element.match)
			end
		end
	end

	return result
end

# ╔═╡ 045f6cc6-b167-11ef-1e4c-f328cd4de1c3
begin

	text = readlines(open("/Users/malanari/Documents/Programming/Julia/day3-input.txt"));

	println("part 1 sum: " * string(mul(text)))
	println("part 2 sum: " * string(muldodont(text)))
end

# ╔═╡ Cell order:
# ╠═3e5d0bcc-dc31-483d-8a3b-c0f30302bf63
# ╠═2ebae3fa-bbc9-4cf9-a0c5-7e0d73a151c6
# ╠═b2e638b6-1396-4206-848c-faa0ace60b13
# ╠═14fc2db7-351c-417b-a2db-e8cbbb3c7040
# ╠═045f6cc6-b167-11ef-1e4c-f328cd4de1c3
