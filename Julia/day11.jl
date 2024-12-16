using BenchmarkTools

function main()
    input = readline("day11_input.txt")
    println(input)
    #input = "125 17"


    #@benchmark part1(input, 25)
    
    #println(part1(input, 25))
    #println(part2(input, 75))

    
    f = open("30.txt","w")
    for i in 3:4096
        line = string(part2(string(i), 35)) * "\n"
        write(f, string(i) * " " * line)
    end
    close(f)

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
        if maxBlink - currentBlink <= 59 && maxBlink - currentBlink >= 1
            return zeroIn(maxBlink-currentBlink + 1)
        else
            return blink2(1, currentBlink+1, maxBlink)
        end
    elseif value == 1
        #println("1!")
        if maxBlink - currentBlink <= 58 && maxBlink - currentBlink >= 0
            return zeroIn(maxBlink-currentBlink + 2)
        else
            return blink2(2024, currentBlink+1, maxBlink)
        end
    elseif value == 2
        if maxBlink - currentBlink <= 57 && maxBlink - currentBlink >= 0
            return twoIn(maxBlink-currentBlink +1)
        else
            return blink2(2*2024, currentBlink+1, maxBlink)
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
    elseif numSteps==50
        return 663251546
    elseif numSteps==51
        return 1010392024
    elseif numSteps==52
        return 1529921658
    elseif numSteps==53
        return 2327142660
    elseif numSteps==54
        return 3537156082
    elseif numSteps==55
        return 5362947711
    elseif numSteps==56
        return 8161193535
    elseif numSteps==57
        return 12380334344
    elseif numSteps==58
        return 18810542532
    elseif numSteps==59
        return 28593873985
    elseif numSteps==60
        return 43369895096
    else
        println(numSteps)
        return "not valid"
    end
end # zeroIn

function twoIn(numSteps)
    if numSteps==1
        return 1
    elseif numSteps==2
        return 2
    elseif numSteps==3
        return 4
    elseif numSteps==4
        return 4
    elseif numSteps==5
        return 6
    elseif numSteps==6
        return 12
    elseif numSteps==7
        return 16
    elseif numSteps==8
        return 19
    elseif numSteps==9
        return 30
    elseif numSteps==10
        return 57
    elseif numSteps==11
        return 92
    elseif numSteps==12
        return 111
    elseif numSteps==13
        return 181
    elseif numSteps==14
        return 295
    elseif numSteps==15
        return 414
    elseif numSteps==16
        return 661
    elseif numSteps==17
        return 977
    elseif numSteps==18
        return 1501
    elseif numSteps==19
        return 2270
    elseif numSteps==20
        return 3381
    elseif numSteps==21
        return 5463
    elseif numSteps==22
        return 7921
    elseif numSteps==23
        return 11819
    elseif numSteps==24
        return 18712
    elseif numSteps==25
        return 27842
    elseif numSteps==26
        return 42646
    elseif numSteps==27
        return 64275
    elseif numSteps==28
        return 97328
    elseif numSteps==29
        return 150678
    elseif numSteps==30
        return 223730
    elseif numSteps==31
        return 343711
    elseif numSteps==32
        return 525238
    elseif numSteps==33
        return 784952
    elseif numSteps==34
        return 1208065
    elseif numSteps==35
        return 1824910
    elseif numSteps==36
        return 2774273
    elseif numSteps==37
        return 4230422
    elseif numSteps==38
        return 6365293
    elseif numSteps==39
        return 9763578
    elseif numSteps==40
        return 14777945
    elseif numSteps==41
        return 22365694
    elseif numSteps==42
        return 34205743
    elseif numSteps==43
        return 51643260
    elseif numSteps==44
        return 78678894
    elseif numSteps==45
        return 119550250
    elseif numSteps==46
        return 181040219
    elseif numSteps==46
        return 181040219
    elseif numSteps==47
        return 276213919
    elseif numSteps==48
        return 417940971
        return 417940971
    elseif numSteps==49
        return 635526775
    elseif numSteps==50
        return 967190364
    elseif numSteps==51
        return 1464254721
    elseif numSteps==52
        return 2230181584
    elseif numSteps==53
        return 3383369064
    elseif numSteps==54
        return 5136784035
    elseif numSteps==55
        return 7815929513
    elseif numSteps==56
        return 11846276236
    elseif numSteps==57
        return 18021119171
    elseif numSteps==58
        return 27366673929
    elseif numSteps==59
        return 41525589303
    elseif numSteps==60
        return 63172165494
    else
        return "not found"
    end
end #twoIn

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
