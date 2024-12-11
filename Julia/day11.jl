using BenchmarkTools

function main()
    input = readline("day11_input.txt")
    #input = "125 17"


    #@benchmark part1(input, 25)
    
    println(part1(input, 25))
    println(part2(input, 75))

    

    #for i in 1:45
    #    println("    elseif numSteps==", i)
    #    println("        return ", part1("0", i))
    #end

end

function blink(value, currentBlink, maxBlink)
    #println(value)
    if currentBlink > maxBlink
        #println("Reached limit with value ", value)
        return 1
    elseif value == "0"
        return blink("1", currentBlink+1, maxBlink)
    elseif iseven(length(value))
        len2 = Int(length(value)/2)
        val1 = string(parse(Int, value[1:len2]))
        val2 = string(parse(Int, value[len2+1:end]))
        return blink(val1, currentBlink+1, maxBlink) + blink(val2, currentBlink+1, maxBlink)
    else
        return blink(string(parse(Int, value)*2024), currentBlink+1, maxBlink)
    end
end

function blink2(value::Int, currentBlink::Int, maxBlink::Int)
    #println(value)
    if currentBlink > maxBlink
        return 1
    elseif value == 0
        #println("0 ", currentBlink, " ", maxBlink)
        if maxBlink - currentBlink <= 45 && maxBlink - currentBlink >= 1
            return zeroIn(maxBlink-currentBlink + 1)
        else
            return blink2(1, currentBlink+1, maxBlink)
        end
    elseif value == 1
        #println("1!")
        if maxBlink - currentBlink <= 44 && maxBlink - currentBlink >= 0
            return zeroIn(maxBlink-currentBlink + 2)
        else
            return blink2(2024, currentBlink+1, maxBlink)
        end
    elseif iseven(length(digits(value)))
        len2 = Int(length(digits(value))/2)
        val1 = Int(floor(value / (10^len2)))
        val2 = Int(value % (10^len2))
        return blink2(val1, currentBlink+1, maxBlink) + 
                blink2(val2, currentBlink+1, maxBlink)
    else
        return blink2(value*2024, currentBlink+1, maxBlink)
    end
end

function zeroIn(numSteps)
    if numSteps==1
        return 1
    elseif numSteps==2
        return 1
    elseif numSteps==3
        return 2
    elseif numSteps==4
        return 4
    elseif numSteps==5
        return 4
    elseif numSteps==6
        return 7
    elseif numSteps==7
        return 14
    elseif numSteps==8
        return 16
    elseif numSteps==9
        return 20
    elseif numSteps==10
        return 39
    elseif numSteps==11
        return 62
    elseif numSteps==12
        return 81
    elseif numSteps==13
        return 110
    elseif numSteps==14
        return 200
    elseif numSteps==15
        return 328
    elseif numSteps==16
        return 418
    elseif numSteps==17
        return 667
    elseif numSteps==18
        return 1059
    elseif numSteps==19
        return 1546
    elseif numSteps==20
        return 2377
    elseif numSteps==21
        return 3572
    elseif numSteps==22
        return 5602
    elseif numSteps==23
        return 8268
    elseif numSteps==24
        return 12343
    elseif numSteps==25
        return 19778
    elseif numSteps==26
        return 29165
    elseif numSteps==27
        return 43726
    elseif numSteps==28
        return 67724
    elseif numSteps==29
        return 102131
    elseif numSteps==30
        return 156451
    elseif numSteps==31
        return 234511
    elseif numSteps==32
        return 357632
    elseif numSteps==33
        return 549949
    elseif numSteps==34
        return 819967
    elseif numSteps==35
        return 1258125
    elseif numSteps==36
        return 1916299
    elseif numSteps==37
        return 2886408
    elseif numSteps==38
        return 4414216
    elseif numSteps==39
        return 6669768
    elseif numSteps==40
        return 10174278
    elseif numSteps==41
        return 15458147
    elseif numSteps==42
        return 23333796
    elseif numSteps==43
        return 35712308
    elseif numSteps==44
        return 54046805
    elseif numSteps==45
        return 81997335
    elseif numSteps==46
        return 125001266
    elseif numSteps==47
        return 189148778
    elseif numSteps==48
        return 288114305
    elseif numSteps==49
        return 437102505
    else
        println(numSteps)
        return "not valid"
    end
end

function part1(input, numBlinks)
    values = split(input, " ")

    result = 0
    for value in values
        result += blink(value, 1, numBlinks)
    end
    return result
end

function part2(input, numBlinks)
    values = parse.(Int,split(input, " "))

    result = 0
    for value in values
        result += blink2(value, 1, numBlinks)
    end
    return result
end

#main()
#input = "125 17"

#@benchmark part1(input, 25)
