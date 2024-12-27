using LinearAlgebra

function solveIt(threeLines, isPart2)
	buttonA = split(split(threeLines[1], ": ")[2], ", ")
	buttonB = split(split(threeLines[2], ": ")[2], ", ")

	buttonAx = parse(Int, chop(buttonA[1], head=1, tail=0))
	buttonAy = parse(Int, chop(buttonA[2], head=1, tail=0))
	buttonBx = parse(Int, chop(buttonB[1], head=1, tail=0))
	buttonBy = parse(Int, chop(buttonB[2], head=1, tail=0))

	goal = parse.(Int, chop.(split(split(threeLines[3], ": ")[2], ", "), head=2, tail=0))
	
	if isPart2
		goal = 10000000000000 .+ goal
	end

	M = [buttonAx buttonBx goal[1]; buttonAy buttonBy goal[2]]

	A = [buttonAx buttonBx; buttonAy buttonBy]
	b = goal

	sol = lu(A) \ b

	if abs(sol[1] - round(sol[1])) < 0.001 && abs(sol[2] - round(sol[2])) < 0.001
		return round(sol[1])*3 + round(sol[2])*1
	else
		return 0
	end
end

function getInput()
	result = readlines("day13_input.txt")
	result2 = split("Button A: X+94, Y+34
Button B: X+22, Y+67
Prize: X=8400, Y=5400

Button A: X+26, Y+66
Button B: X+67, Y+21
Prize: X=12748, Y=12176

Button A: X+17, Y+86
Button B: X+84, Y+37
Prize: X=7870, Y=6450

Button A: X+69, Y+23
Button B: X+27, Y+71
Prize: X=18641, Y=10279","\n")

	return result
end

function part1()
	input = getInput()

	startIndices = findall(contains.(input, "Button A"))

	cost = 0
	cost2 = 0

	for index in startIndices
		
		cost += solveIt(input[index:index+2], false)
		cost2 += solveIt(input[index:index+2], true)
	end

	println(cost)
	println(cost2)

	#solveIt(input[startIndices[which]:startIndices[which]+2])
end

