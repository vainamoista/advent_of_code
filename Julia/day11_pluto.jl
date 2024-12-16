### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ b2535a7f-6d58-4428-85cf-57ff78e3c5fb
function blink_hist(value, currentBlink, maxBlink)
	if currentBlink > maxBlink
        #println("Reached limit with value ", value)
        return parse(Int, value)
    elseif value == "0"
        return blink_hist("1", currentBlink+1, maxBlink)
    elseif iseven(length(value))
        len2 = Int(length(value)/2)
        val1 = string(parse(Int, value[1:len2]))
        val2 = string(parse(Int, value[len2+1:end]))
        return vcat(blink_hist(val1, currentBlink+1, maxBlink), blink_hist(val2, currentBlink+1, maxBlink))
    else
        return blink_hist(string(parse(Int, value)*2024), currentBlink+1, maxBlink)
    end
end

# ╔═╡ c9cc049c-4fb1-47e4-939e-ad2aca1bd143
function histo(input, numBlinks)
	input = string(input)
	blink_hist(input, 1, numBlinks)
end

# ╔═╡ 5cd87641-46df-4fcd-94b8-e8476106abd3
h = histo(0,42);

# ╔═╡ 001332ef-583d-4647-8f30-0f6f2476d15b
begin
	using Plots
	histogram(h, bins=75:100)
end

# ╔═╡ f082ee1d-9bb2-42b9-85c0-14d78481079a
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

# ╔═╡ 6f45ae9d-30aa-41fc-a088-c9dbb620986d
println(blink("0",1,50))

# ╔═╡ c3418f6a-b9b9-4909-8894-f958e303dc2a
function part1(input, numBlinks)
	input = string(input)
    values = split(input, " ")

    result = 0
    for value in values
        result += blink(value, 1, numBlinks)
    end
    return result
end

# ╔═╡ e2280d8e-26c8-4fa5-875a-c4bec2667820
function numIn(num, inHowMany)
    if num == 0
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 1
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 4
        elseif inHowMany == 6
            return 7
        elseif inHowMany == 7
            return 14
        elseif inHowMany == 8
            return 16
        elseif inHowMany == 9
            return 20
        elseif inHowMany == 10
            return 39
        elseif inHowMany == 11
            return 62
        elseif inHowMany == 12
            return 81
        elseif inHowMany == 13
            return 110
        elseif inHowMany == 14
            return 200
        elseif inHowMany == 15
            return 328
        elseif inHowMany == 16
            return 418
        elseif inHowMany == 17
            return 667
        elseif inHowMany == 18
            return 1059
        elseif inHowMany == 19
            return 1546
        elseif inHowMany == 20
            return 2377
        elseif inHowMany == 21
            return 3572
        elseif inHowMany == 22
            return 5602
        elseif inHowMany == 23
            return 8268
        elseif inHowMany == 24
            return 12343
        elseif inHowMany == 25
            return 19778
        elseif inHowMany == 26
            return 29165
        elseif inHowMany == 27
            return 43726
        elseif inHowMany == 28
            return 67724
        elseif inHowMany == 29
            return 102131
        elseif inHowMany == 30
            return 156451
        elseif inHowMany == 31
            return 234511
        elseif inHowMany == 32
            return 357632
        elseif inHowMany == 33
            return 549949
        elseif inHowMany == 34
            return 819967
        elseif inHowMany == 35
            return 1258125
        elseif inHowMany == 36
            return 1916299
        elseif inHowMany == 37
            return 2886408
        elseif inHowMany == 38
            return 4414216
        elseif inHowMany == 39
            return 6669768
        elseif inHowMany == 40
            return 10174278
        elseif inHowMany == 41
            return 15458147
        elseif inHowMany == 42
            return 23333796
        elseif inHowMany == 43
            return 35712308
        elseif inHowMany == 44
            return 54046805
        elseif inHowMany == 45
            return 81997335
        elseif inHowMany == 46
            return 125001266
        elseif inHowMany == 47
            return 189148778
        elseif inHowMany == 48
            return 288114305
        elseif inHowMany == 49
            return 437102505
        elseif inHowMany == 50
            return 663251546
        end
    elseif num == 1
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 7
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 20
        elseif inHowMany == 9
            return 39
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 81
        elseif inHowMany == 12
            return 110
        elseif inHowMany == 13
            return 200
        elseif inHowMany == 14
            return 328
        elseif inHowMany == 15
            return 418
        elseif inHowMany == 16
            return 667
        elseif inHowMany == 17
            return 1059
        elseif inHowMany == 18
            return 1546
        elseif inHowMany == 19
            return 2377
        elseif inHowMany == 20
            return 3572
        elseif inHowMany == 21
            return 5602
        elseif inHowMany == 22
            return 8268
        elseif inHowMany == 23
            return 12343
        elseif inHowMany == 24
            return 19778
        elseif inHowMany == 25
            return 29165
        elseif inHowMany == 26
            return 43726
        elseif inHowMany == 27
            return 67724
        elseif inHowMany == 28
            return 102131
        elseif inHowMany == 29
            return 156451
        elseif inHowMany == 30
            return 234511
        elseif inHowMany == 31
            return 357632
        elseif inHowMany == 32
            return 549949
        elseif inHowMany == 33
            return 819967
        elseif inHowMany == 34
            return 1258125
        elseif inHowMany == 35
            return 1916299
        elseif inHowMany == 36
            return 2886408
        elseif inHowMany == 37
            return 4414216
        elseif inHowMany == 38
            return 6669768
        elseif inHowMany == 39
            return 10174278
        elseif inHowMany == 40
            return 15458147
        elseif inHowMany == 41
            return 23333796
        elseif inHowMany == 42
            return 35712308
        elseif inHowMany == 43
            return 54046805
        elseif inHowMany == 44
            return 81997335
        elseif inHowMany == 45
            return 125001266
        elseif inHowMany == 46
            return 189148778
        elseif inHowMany == 47
            return 288114305
        elseif inHowMany == 48
            return 437102505
        elseif inHowMany == 49
            return 663251546
        elseif inHowMany == 50
            return 1010392024
        end
    elseif num == 2
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 6
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 19
        elseif inHowMany == 9
            return 30
        elseif inHowMany == 10
            return 57
        elseif inHowMany == 11
            return 92
        elseif inHowMany == 12
            return 111
        elseif inHowMany == 13
            return 181
        elseif inHowMany == 14
            return 295
        elseif inHowMany == 15
            return 414
        elseif inHowMany == 16
            return 661
        elseif inHowMany == 17
            return 977
        elseif inHowMany == 18
            return 1501
        elseif inHowMany == 19
            return 2270
        elseif inHowMany == 20
            return 3381
        elseif inHowMany == 21
            return 5463
        elseif inHowMany == 22
            return 7921
        elseif inHowMany == 23
            return 11819
        elseif inHowMany == 24
            return 18712
        elseif inHowMany == 25
            return 27842
        elseif inHowMany == 26
            return 42646
        elseif inHowMany == 27
            return 64275
        elseif inHowMany == 28
            return 97328
        elseif inHowMany == 29
            return 150678
        elseif inHowMany == 30
            return 223730
        elseif inHowMany == 31
            return 343711
        elseif inHowMany == 32
            return 525238
        elseif inHowMany == 33
            return 784952
        elseif inHowMany == 34
            return 1208065
        elseif inHowMany == 35
            return 1824910
        elseif inHowMany == 36
            return 2774273
        elseif inHowMany == 37
            return 4230422
        elseif inHowMany == 38
            return 6365293
        elseif inHowMany == 39
            return 9763578
        elseif inHowMany == 40
            return 14777945
        elseif inHowMany == 41
            return 22365694
        elseif inHowMany == 42
            return 34205743
        elseif inHowMany == 43
            return 51643260
        elseif inHowMany == 44
            return 78678894
        elseif inHowMany == 45
            return 119550250
        elseif inHowMany == 46
            return 181040219
        elseif inHowMany == 47
            return 276213919
        elseif inHowMany == 48
            return 417940971
        elseif inHowMany == 49
            return 635526775
        elseif inHowMany == 50
            return 967190364
        end
    elseif num == 3
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 5
        elseif inHowMany == 6
            return 10
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 26
        elseif inHowMany == 9
            return 35
        elseif inHowMany == 10
            return 52
        elseif inHowMany == 11
            return 79
        elseif inHowMany == 12
            return 114
        elseif inHowMany == 13
            return 202
        elseif inHowMany == 14
            return 294
        elseif inHowMany == 15
            return 401
        elseif inHowMany == 16
            return 642
        elseif inHowMany == 17
            return 987
        elseif inHowMany == 18
            return 1556
        elseif inHowMany == 19
            return 2281
        elseif inHowMany == 20
            return 3347
        elseif inHowMany == 21
            return 5360
        elseif inHowMany == 22
            return 7914
        elseif inHowMany == 23
            return 12116
        elseif inHowMany == 24
            return 18714
        elseif inHowMany == 25
            return 27569
        elseif inHowMany == 26
            return 42628
        elseif inHowMany == 27
            return 64379
        elseif inHowMany == 28
            return 98160
        elseif inHowMany == 29
            return 150493
        elseif inHowMany == 30
            return 223231
        elseif inHowMany == 31
            return 344595
        elseif inHowMany == 32
            return 524150
        elseif inHowMany == 33
            return 788590
        elseif inHowMany == 34
            return 1210782
        elseif inHowMany == 35
            return 1821382
        elseif inHowMany == 36
            return 2779243
        elseif inHowMany == 37
            return 4230598
        elseif inHowMany == 38
            return 6382031
        elseif inHowMany == 39
            return 9778305
        elseif inHowMany == 40
            return 14761601
        elseif inHowMany == 41
            return 22417792
        elseif inHowMany == 42
            return 34225846
        elseif inHowMany == 43
            return 51690137
        elseif inHowMany == 44
            return 78827911
        elseif inHowMany == 45
            return 119542610
        elseif inHowMany == 46
            return 181315830
        elseif inHowMany == 47
            return 276460158
        elseif inHowMany == 48
            return 418258991
        elseif inHowMany == 49
            return 636641443
        elseif inHowMany == 50
            return 967436144
        end
    elseif num == 4
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 4
        elseif inHowMany == 6
            return 8
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 30
        elseif inHowMany == 10
            return 47
        elseif inHowMany == 11
            return 82
        elseif inHowMany == 12
            return 115
        elseif inHowMany == 13
            return 195
        elseif inHowMany == 14
            return 269
        elseif inHowMany == 15
            return 390
        elseif inHowMany == 16
            return 637
        elseif inHowMany == 17
            return 951
        elseif inHowMany == 18
            return 1541
        elseif inHowMany == 19
            return 2182
        elseif inHowMany == 20
            return 3204
        elseif inHowMany == 21
            return 5280
        elseif inHowMany == 22
            return 7721
        elseif inHowMany == 23
            return 11820
        elseif inHowMany == 24
            return 17957
        elseif inHowMany == 25
            return 26669
        elseif inHowMany == 26
            return 41994
        elseif inHowMany == 27
            return 62235
        elseif inHowMany == 28
            return 95252
        elseif inHowMany == 29
            return 146462
        elseif inHowMany == 30
            return 216056
        elseif inHowMany == 31
            return 336192
        elseif inHowMany == 32
            return 508191
        elseif inHowMany == 33
            return 766555
        elseif inHowMany == 34
            return 1178119
        elseif inHowMany == 35
            return 1761823
        elseif inHowMany == 36
            return 2709433
        elseif inHowMany == 37
            return 4110895
        elseif inHowMany == 38
            return 6188994
        elseif inHowMany == 39
            return 9515384
        elseif inHowMany == 40
            return 14316637
        elseif inHowMany == 41
            return 21807800
        elseif inHowMany == 42
            return 33255984
        elseif inHowMany == 43
            return 50149950
        elseif inHowMany == 44
            return 76709712
        elseif inHowMany == 45
            return 116004670
        elseif inHowMany == 46
            return 176169842
        elseif inHowMany == 47
            return 268815408
        elseif inHowMany == 48
            return 405925411
        elseif inHowMany == 49
            return 618986605
        elseif inHowMany == 50
            return 939523808
        end
    elseif num == 5
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 1
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 8
        elseif inHowMany == 7
            return 11
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 32
        elseif inHowMany == 10
            return 45
        elseif inHowMany == 11
            return 67
        elseif inHowMany == 12
            return 109
        elseif inHowMany == 13
            return 163
        elseif inHowMany == 14
            return 223
        elseif inHowMany == 15
            return 383
        elseif inHowMany == 16
            return 597
        elseif inHowMany == 17
            return 808
        elseif inHowMany == 18
            return 1260
        elseif inHowMany == 19
            return 1976
        elseif inHowMany == 20
            return 3053
        elseif inHowMany == 21
            return 4529
        elseif inHowMany == 22
            return 6675
        elseif inHowMany == 23
            return 10627
        elseif inHowMany == 24
            return 15847
        elseif inHowMany == 25
            return 23822
        elseif inHowMany == 26
            return 37090
        elseif inHowMany == 27
            return 55161
        elseif inHowMany == 28
            return 84208
        elseif inHowMany == 29
            return 128121
        elseif inHowMany == 30
            return 194545
        elseif inHowMany == 31
            return 298191
        elseif inHowMany == 32
            return 444839
        elseif inHowMany == 33
            return 681805
        elseif inHowMany == 34
            return 1042629
        elseif inHowMany == 35
            return 1565585
        elseif inHowMany == 36
            return 2396146
        elseif inHowMany == 37
            return 3626619
        elseif inHowMany == 38
            return 5509999
        elseif inHowMany == 39
            return 8396834
        elseif inHowMany == 40
            return 12678459
        elseif inHowMany == 41
            return 19375816
        elseif inHowMany == 42
            return 29353796
        elseif inHowMany == 43
            return 44468482
        elseif inHowMany == 44
            return 67897697
        elseif inHowMany == 45
            return 102728207
        elseif inHowMany == 46
            return 156270923
        elseif inHowMany == 47
            return 237448520
        elseif inHowMany == 48
            return 359945119
        elseif inHowMany == 49
            return 548404180
        elseif inHowMany == 50
            return 830902728
        end
    elseif num == 6
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 1
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 8
        elseif inHowMany == 7
            return 11
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 32
        elseif inHowMany == 10
            return 54
        elseif inHowMany == 11
            return 68
        elseif inHowMany == 12
            return 103
        elseif inHowMany == 13
            return 183
        elseif inHowMany == 14
            return 250
        elseif inHowMany == 15
            return 401
        elseif inHowMany == 16
            return 600
        elseif inHowMany == 17
            return 871
        elseif inHowMany == 18
            return 1431
        elseif inHowMany == 19
            return 2033
        elseif inHowMany == 20
            return 3193
        elseif inHowMany == 21
            return 4917
        elseif inHowMany == 22
            return 7052
        elseif inHowMany == 23
            return 11371
        elseif inHowMany == 24
            return 16815
        elseif inHowMany == 25
            return 25469
        elseif inHowMany == 26
            return 39648
        elseif inHowMany == 27
            return 57976
        elseif inHowMany == 28
            return 90871
        elseif inHowMany == 29
            return 136703
        elseif inHowMany == 30
            return 205157
        elseif inHowMany == 31
            return 319620
        elseif inHowMany == 32
            return 473117
        elseif inHowMany == 33
            return 727905
        elseif inHowMany == 34
            return 1110359
        elseif inHowMany == 35
            return 1661899
        elseif inHowMany == 36
            return 2567855
        elseif inHowMany == 37
            return 3849988
        elseif inHowMany == 38
            return 5866379
        elseif inHowMany == 39
            return 8978479
        elseif inHowMany == 40
            return 13464170
        elseif inHowMany == 41
            return 20675981
        elseif inHowMany == 42
            return 31260715
        elseif inHowMany == 43
            return 47355277
        elseif inHowMany == 44
            return 72483044
        elseif inHowMany == 45
            return 109181845
        elseif inHowMany == 46
            return 166707433
        elseif inHowMany == 47
            return 253134047
        elseif inHowMany == 48
            return 382914632
        elseif inHowMany == 49
            return 585166040
        elseif inHowMany == 50
            return 884539345
        end
    elseif num == 7
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 1
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 8
        elseif inHowMany == 7
            return 11
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 32
        elseif inHowMany == 10
            return 52
        elseif inHowMany == 11
            return 72
        elseif inHowMany == 12
            return 106
        elseif inHowMany == 13
            return 168
        elseif inHowMany == 14
            return 242
        elseif inHowMany == 15
            return 413
        elseif inHowMany == 16
            return 602
        elseif inHowMany == 17
            return 832
        elseif inHowMany == 18
            return 1369
        elseif inHowMany == 19
            return 2065
        elseif inHowMany == 20
            return 3165
        elseif inHowMany == 21
            return 4762
        elseif inHowMany == 22
            return 6994
        elseif inHowMany == 23
            return 11170
        elseif inHowMany == 24
            return 16509
        elseif inHowMany == 25
            return 25071
        elseif inHowMany == 26
            return 39034
        elseif inHowMany == 27
            return 57254
        elseif inHowMany == 28
            return 88672
        elseif inHowMany == 29
            return 134638
        elseif inHowMany == 30
            return 203252
        elseif inHowMany == 31
            return 312940
        elseif inHowMany == 32
            return 465395
        elseif inHowMany == 33
            return 716437
        elseif inHowMany == 34
            return 1092207
        elseif inHowMany == 35
            return 1637097
        elseif inHowMany == 36
            return 2519878
        elseif inHowMany == 37
            return 3794783
        elseif inHowMany == 38
            return 5771904
        elseif inHowMany == 39
            return 8814021
        elseif inHowMany == 40
            return 13273744
        elseif inHowMany == 41
            return 20328089
        elseif inHowMany == 42
            return 30742356
        elseif inHowMany == 43
            return 46604985
        elseif inHowMany == 44
            return 71251415
        elseif inHowMany == 45
            return 107529561
        elseif inHowMany == 46
            return 163892525
        elseif inHowMany == 47
            return 248939400
        elseif inHowMany == 48
            return 377032515
        elseif inHowMany == 49
            return 575197697
        elseif inHowMany == 50
            return 870467992
        end
    elseif num == 8
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 1
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 7
        elseif inHowMany == 6
            return 7
        elseif inHowMany == 7
            return 11
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 31
        elseif inHowMany == 10
            return 48
        elseif inHowMany == 11
            return 69
        elseif inHowMany == 12
            return 103
        elseif inHowMany == 13
            return 161
        elseif inHowMany == 14
            return 239
        elseif inHowMany == 15
            return 393
        elseif inHowMany == 16
            return 578
        elseif inHowMany == 17
            return 812
        elseif inHowMany == 18
            return 1322
        elseif inHowMany == 19
            return 2011
        elseif inHowMany == 20
            return 3034
        elseif inHowMany == 21
            return 4580
        elseif inHowMany == 22
            return 6798
        elseif inHowMany == 23
            return 10738
        elseif inHowMany == 24
            return 16018
        elseif inHowMany == 25
            return 24212
        elseif inHowMany == 26
            return 37525
        elseif inHowMany == 27
            return 55534
        elseif inHowMany == 28
            return 85483
        elseif inHowMany == 29
            return 130183
        elseif inHowMany == 30
            return 196389
        elseif inHowMany == 31
            return 301170
        elseif inHowMany == 32
            return 450896
        elseif inHowMany == 33
            return 691214
        elseif inHowMany == 34
            return 1054217
        elseif inHowMany == 35
            return 1583522
        elseif inHowMany == 36
            return 2428413
        elseif inHowMany == 37
            return 3669747
        elseif inHowMany == 38
            return 5573490
        elseif inHowMany == 39
            return 8505207
        elseif inHowMany == 40
            return 12835708
        elseif inHowMany == 41
            return 19605147
        elseif inHowMany == 42
            return 29704486
        elseif inHowMany == 43
            return 45028011
        elseif inHowMany == 44
            return 68747690
        elseif inHowMany == 45
            return 103934296
        elseif inHowMany == 46
            return 158185825
        elseif inHowMany == 47
            return 240410770
        elseif inHowMany == 48
            return 364289594
        elseif inHowMany == 49
            return 555105869
        elseif inHowMany == 50
            return 841069902
        end
    elseif num == 9
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 1
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 8
        elseif inHowMany == 7
            return 11
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 32
        elseif inHowMany == 10
            return 54
        elseif inHowMany == 11
            return 70
        elseif inHowMany == 12
            return 103
        elseif inHowMany == 13
            return 183
        elseif inHowMany == 14
            return 262
        elseif inHowMany == 15
            return 419
        elseif inHowMany == 16
            return 586
        elseif inHowMany == 17
            return 854
        elseif inHowMany == 18
            return 1468
        elseif inHowMany == 19
            return 2131
        elseif inHowMany == 20
            return 3216
        elseif inHowMany == 21
            return 4888
        elseif inHowMany == 22
            return 7217
        elseif inHowMany == 23
            return 11617
        elseif inHowMany == 24
            return 17059
        elseif inHowMany == 25
            return 25793
        elseif inHowMany == 26
            return 40124
        elseif inHowMany == 27
            return 58820
        elseif inHowMany == 28
            return 92114
        elseif inHowMany == 29
            return 139174
        elseif inHowMany == 30
            return 208558
        elseif inHowMany == 31
            return 322818
        elseif inHowMany == 32
            return 480178
        elseif inHowMany == 33
            return 740365
        elseif inHowMany == 34
            return 1126352
        elseif inHowMany == 35
            return 1685448
        elseif inHowMany == 36
            return 2602817
        elseif inHowMany == 37
            return 3910494
        elseif inHowMany == 38
            return 5953715
        elseif inHowMany == 39
            return 9102530
        elseif inHowMany == 40
            return 13675794
        elseif inHowMany == 41
            return 20970437
        elseif inHowMany == 42
            return 31705673
        elseif inHowMany == 43
            return 48074246
        elseif inHowMany == 44
            return 73537869
        elseif inHowMany == 45
            return 110811935
        elseif inHowMany == 46
            return 169092081
        elseif inHowMany == 47
            return 256830213
        elseif inHowMany == 48
            return 388727714
        elseif inHowMany == 49
            return 593534295
        elseif inHowMany == 50
            return 897592763
        end
    elseif num == 10
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 11
        elseif inHowMany == 7
            return 21
        elseif inHowMany == 8
            return 30
        elseif inHowMany == 9
            return 36
        elseif inHowMany == 10
            return 59
        elseif inHowMany == 11
            return 101
        elseif inHowMany == 12
            return 143
        elseif inHowMany == 13
            return 191
        elseif inHowMany == 14
            return 310
        elseif inHowMany == 15
            return 528
        elseif inHowMany == 16
            return 746
        elseif inHowMany == 17
            return 1085
        elseif inHowMany == 18
            return 1726
        elseif inHowMany == 19
            return 2605
        elseif inHowMany == 20
            return 3923
        elseif inHowMany == 21
            return 5949
        elseif inHowMany == 22
            return 9174
        elseif inHowMany == 23
            return 13870
        elseif inHowMany == 24
            return 20611
        elseif inHowMany == 25
            return 32121
        elseif inHowMany == 26
            return 48943
        elseif inHowMany == 27
            return 72891
        elseif inHowMany == 28
            return 111450
        elseif inHowMany == 29
            return 169855
        elseif inHowMany == 30
            return 258582
        elseif inHowMany == 31
            return 390962
        elseif inHowMany == 32
            return 592143
        elseif inHowMany == 33
            return 907581
        elseif inHowMany == 34
            return 1369916
        elseif inHowMany == 35
            return 2078092
        elseif inHowMany == 36
            return 3174424
        elseif inHowMany == 37
            return 4802707
        elseif inHowMany == 38
            return 7300624
        elseif inHowMany == 39
            return 11083984
        elseif inHowMany == 40
            return 16844046
        elseif inHowMany == 41
            return 25632425
        elseif inHowMany == 42
            return 38791943
        elseif inHowMany == 43
            return 59046104
        elseif inHowMany == 44
            return 89759113
        elseif inHowMany == 45
            return 136044140
        elseif inHowMany == 46
            return 206998601
        elseif inHowMany == 47
            return 314150044
        elseif inHowMany == 48
            return 477263083
        elseif inHowMany == 49
            return 725216810
        elseif inHowMany == 50
            return 1100354051
        end
    elseif num == 11
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 28
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 40
        elseif inHowMany == 10
            return 78
        elseif inHowMany == 11
            return 124
        elseif inHowMany == 12
            return 162
        elseif inHowMany == 13
            return 220
        elseif inHowMany == 14
            return 400
        elseif inHowMany == 15
            return 656
        elseif inHowMany == 16
            return 836
        elseif inHowMany == 17
            return 1334
        elseif inHowMany == 18
            return 2118
        elseif inHowMany == 19
            return 3092
        elseif inHowMany == 20
            return 4754
        elseif inHowMany == 21
            return 7144
        elseif inHowMany == 22
            return 11204
        elseif inHowMany == 23
            return 16536
        elseif inHowMany == 24
            return 24686
        elseif inHowMany == 25
            return 39556
        elseif inHowMany == 26
            return 58330
        elseif inHowMany == 27
            return 87452
        elseif inHowMany == 28
            return 135448
        elseif inHowMany == 29
            return 204262
        elseif inHowMany == 30
            return 312902
        elseif inHowMany == 31
            return 469022
        elseif inHowMany == 32
            return 715264
        elseif inHowMany == 33
            return 1099898
        elseif inHowMany == 34
            return 1639934
        elseif inHowMany == 35
            return 2516250
        elseif inHowMany == 36
            return 3832598
        elseif inHowMany == 37
            return 5772816
        elseif inHowMany == 38
            return 8828432
        elseif inHowMany == 39
            return 13339536
        elseif inHowMany == 40
            return 20348556
        elseif inHowMany == 41
            return 30916294
        elseif inHowMany == 42
            return 46667592
        elseif inHowMany == 43
            return 71424616
        elseif inHowMany == 44
            return 108093610
        elseif inHowMany == 45
            return 163994670
        elseif inHowMany == 46
            return 250002532
        elseif inHowMany == 47
            return 378297556
        elseif inHowMany == 48
            return 576228610
        elseif inHowMany == 49
            return 874205010
        elseif inHowMany == 50
            return 1326503092
        end
    elseif num == 12
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 26
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 39
        elseif inHowMany == 10
            return 69
        elseif inHowMany == 11
            return 119
        elseif inHowMany == 12
            return 173
        elseif inHowMany == 13
            return 221
        elseif inHowMany == 14
            return 381
        elseif inHowMany == 15
            return 623
        elseif inHowMany == 16
            return 832
        elseif inHowMany == 17
            return 1328
        elseif inHowMany == 18
            return 2036
        elseif inHowMany == 19
            return 3047
        elseif inHowMany == 20
            return 4647
        elseif inHowMany == 21
            return 6953
        elseif inHowMany == 22
            return 11065
        elseif inHowMany == 23
            return 16189
        elseif inHowMany == 24
            return 24162
        elseif inHowMany == 25
            return 38490
        elseif inHowMany == 26
            return 57007
        elseif inHowMany == 27
            return 86372
        elseif inHowMany == 28
            return 131999
        elseif inHowMany == 29
            return 199459
        elseif inHowMany == 30
            return 307129
        elseif inHowMany == 31
            return 458241
        elseif inHowMany == 32
            return 701343
        elseif inHowMany == 33
            return 1075187
        elseif inHowMany == 34
            return 1604919
        elseif inHowMany == 35
            return 2466190
        elseif inHowMany == 36
            return 3741209
        elseif inHowMany == 37
            return 5660681
        elseif inHowMany == 38
            return 8644638
        elseif inHowMany == 39
            return 13035061
        elseif inHowMany == 40
            return 19937856
        elseif inHowMany == 41
            return 30236092
        elseif inHowMany == 42
            return 45699490
        elseif inHowMany == 43
            return 69918051
        elseif inHowMany == 44
            return 105690065
        elseif inHowMany == 45
            return 160676229
        elseif inHowMany == 46
            return 244551516
        elseif inHowMany == 47
            return 370188997
        elseif inHowMany == 48
            return 564328224
        elseif inHowMany == 49
            return 855043476
        elseif inHowMany == 50
            return 1298778321
        end
    elseif num == 13
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 24
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 46
        elseif inHowMany == 10
            return 74
        elseif inHowMany == 11
            return 114
        elseif inHowMany == 12
            return 160
        elseif inHowMany == 13
            return 224
        elseif inHowMany == 14
            return 402
        elseif inHowMany == 15
            return 622
        elseif inHowMany == 16
            return 819
        elseif inHowMany == 17
            return 1309
        elseif inHowMany == 18
            return 2046
        elseif inHowMany == 19
            return 3102
        elseif inHowMany == 20
            return 4658
        elseif inHowMany == 21
            return 6919
        elseif inHowMany == 22
            return 10962
        elseif inHowMany == 23
            return 16182
        elseif inHowMany == 24
            return 24459
        elseif inHowMany == 25
            return 38492
        elseif inHowMany == 26
            return 56734
        elseif inHowMany == 27
            return 86354
        elseif inHowMany == 28
            return 132103
        elseif inHowMany == 29
            return 200291
        elseif inHowMany == 30
            return 306944
        elseif inHowMany == 31
            return 457742
        elseif inHowMany == 32
            return 702227
        elseif inHowMany == 33
            return 1074099
        elseif inHowMany == 34
            return 1608557
        elseif inHowMany == 35
            return 2468907
        elseif inHowMany == 36
            return 3737681
        elseif inHowMany == 37
            return 5665651
        elseif inHowMany == 38
            return 8644814
        elseif inHowMany == 39
            return 13051799
        elseif inHowMany == 40
            return 19952583
        elseif inHowMany == 41
            return 30219748
        elseif inHowMany == 42
            return 45751588
        elseif inHowMany == 43
            return 69938154
        elseif inHowMany == 44
            return 105736942
        elseif inHowMany == 45
            return 160825246
        elseif inHowMany == 46
            return 244543876
        elseif inHowMany == 47
            return 370464608
        elseif inHowMany == 48
            return 564574463
        elseif inHowMany == 49
            return 855361496
        elseif inHowMany == 50
            return 1299892989
        end
    elseif num == 14
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 11
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 47
        elseif inHowMany == 10
            return 69
        elseif inHowMany == 11
            return 109
        elseif inHowMany == 12
            return 163
        elseif inHowMany == 13
            return 225
        elseif inHowMany == 14
            return 395
        elseif inHowMany == 15
            return 597
        elseif inHowMany == 16
            return 808
        elseif inHowMany == 17
            return 1304
        elseif inHowMany == 18
            return 2010
        elseif inHowMany == 19
            return 3087
        elseif inHowMany == 20
            return 4559
        elseif inHowMany == 21
            return 6776
        elseif inHowMany == 22
            return 10882
        elseif inHowMany == 23
            return 15989
        elseif inHowMany == 24
            return 24163
        elseif inHowMany == 25
            return 37735
        elseif inHowMany == 26
            return 55834
        elseif inHowMany == 27
            return 85720
        elseif inHowMany == 28
            return 129959
        elseif inHowMany == 29
            return 197383
        elseif inHowMany == 30
            return 302913
        elseif inHowMany == 31
            return 450567
        elseif inHowMany == 32
            return 693824
        elseif inHowMany == 33
            return 1058140
        elseif inHowMany == 34
            return 1586522
        elseif inHowMany == 35
            return 2436244
        elseif inHowMany == 36
            return 3678122
        elseif inHowMany == 37
            return 5595841
        elseif inHowMany == 38
            return 8525111
        elseif inHowMany == 39
            return 12858762
        elseif inHowMany == 40
            return 19689662
        elseif inHowMany == 41
            return 29774784
        elseif inHowMany == 42
            return 45141596
        elseif inHowMany == 43
            return 68968292
        elseif inHowMany == 44
            return 104196755
        elseif inHowMany == 45
            return 158707047
        elseif inHowMany == 46
            return 241005936
        elseif inHowMany == 47
            return 365318620
        elseif inHowMany == 48
            return 556929713
        elseif inHowMany == 49
            return 843027916
        elseif inHowMany == 50
            return 1282238151
        end
    elseif num == 15
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 71
        elseif inHowMany == 11
            return 107
        elseif inHowMany == 12
            return 148
        elseif inHowMany == 13
            return 219
        elseif inHowMany == 14
            return 363
        elseif inHowMany == 15
            return 551
        elseif inHowMany == 16
            return 801
        elseif inHowMany == 17
            return 1264
        elseif inHowMany == 18
            return 1867
        elseif inHowMany == 19
            return 2806
        elseif inHowMany == 20
            return 4353
        elseif inHowMany == 21
            return 6625
        elseif inHowMany == 22
            return 10131
        elseif inHowMany == 23
            return 14943
        elseif inHowMany == 24
            return 22970
        elseif inHowMany == 25
            return 35625
        elseif inHowMany == 26
            return 52987
        elseif inHowMany == 27
            return 80816
        elseif inHowMany == 28
            return 122885
        elseif inHowMany == 29
            return 186339
        elseif inHowMany == 30
            return 284572
        elseif inHowMany == 31
            return 429056
        elseif inHowMany == 32
            return 655823
        elseif inHowMany == 33
            return 994788
        elseif inHowMany == 34
            return 1501772
        elseif inHowMany == 35
            return 2300754
        elseif inHowMany == 36
            return 3481884
        elseif inHowMany == 37
            return 5282554
        elseif inHowMany == 38
            return 8040835
        elseif inHowMany == 39
            return 12179767
        elseif inHowMany == 40
            return 18571112
        elseif inHowMany == 41
            return 28136606
        elseif inHowMany == 42
            return 42709612
        elseif inHowMany == 43
            return 65066104
        elseif inHowMany == 44
            return 98515287
        elseif inHowMany == 45
            return 149895032
        elseif inHowMany == 46
            return 227729473
        elseif inHowMany == 47
            return 345419701
        elseif inHowMany == 48
            return 525562825
        elseif inHowMany == 49
            return 797047624
        elseif inHowMany == 50
            return 1211655726
        end
    elseif num == 16
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 71
        elseif inHowMany == 11
            return 116
        elseif inHowMany == 12
            return 149
        elseif inHowMany == 13
            return 213
        elseif inHowMany == 14
            return 383
        elseif inHowMany == 15
            return 578
        elseif inHowMany == 16
            return 819
        elseif inHowMany == 17
            return 1267
        elseif inHowMany == 18
            return 1930
        elseif inHowMany == 19
            return 2977
        elseif inHowMany == 20
            return 4410
        elseif inHowMany == 21
            return 6765
        elseif inHowMany == 22
            return 10519
        elseif inHowMany == 23
            return 15320
        elseif inHowMany == 24
            return 23714
        elseif inHowMany == 25
            return 36593
        elseif inHowMany == 26
            return 54634
        elseif inHowMany == 27
            return 83374
        elseif inHowMany == 28
            return 125700
        elseif inHowMany == 29
            return 193002
        elseif inHowMany == 30
            return 293154
        elseif inHowMany == 31
            return 439668
        elseif inHowMany == 32
            return 677252
        elseif inHowMany == 33
            return 1023066
        elseif inHowMany == 34
            return 1547872
        elseif inHowMany == 35
            return 2368484
        elseif inHowMany == 36
            return 3578198
        elseif inHowMany == 37
            return 5454263
        elseif inHowMany == 38
            return 8264204
        elseif inHowMany == 39
            return 12536147
        elseif inHowMany == 40
            return 19152757
        elseif inHowMany == 41
            return 28922317
        elseif inHowMany == 42
            return 44009777
        elseif inHowMany == 43
            return 66973023
        elseif inHowMany == 44
            return 101402082
        elseif inHowMany == 45
            return 154480379
        elseif inHowMany == 46
            return 234183111
        elseif inHowMany == 47
            return 355856211
        elseif inHowMany == 48
            return 541248352
        elseif inHowMany == 49
            return 820017137
        elseif inHowMany == 50
            return 1248417586
        end
    elseif num == 17
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 71
        elseif inHowMany == 11
            return 114
        elseif inHowMany == 12
            return 153
        elseif inHowMany == 13
            return 216
        elseif inHowMany == 14
            return 368
        elseif inHowMany == 15
            return 570
        elseif inHowMany == 16
            return 831
        elseif inHowMany == 17
            return 1269
        elseif inHowMany == 18
            return 1891
        elseif inHowMany == 19
            return 2915
        elseif inHowMany == 20
            return 4442
        elseif inHowMany == 21
            return 6737
        elseif inHowMany == 22
            return 10364
        elseif inHowMany == 23
            return 15262
        elseif inHowMany == 24
            return 23513
        elseif inHowMany == 25
            return 36287
        elseif inHowMany == 26
            return 54236
        elseif inHowMany == 27
            return 82760
        elseif inHowMany == 28
            return 124978
        elseif inHowMany == 29
            return 190803
        elseif inHowMany == 30
            return 291089
        elseif inHowMany == 31
            return 437763
        elseif inHowMany == 32
            return 670572
        elseif inHowMany == 33
            return 1015344
        elseif inHowMany == 34
            return 1536404
        elseif inHowMany == 35
            return 2350332
        elseif inHowMany == 36
            return 3553396
        elseif inHowMany == 37
            return 5406286
        elseif inHowMany == 38
            return 8208999
        elseif inHowMany == 39
            return 12441672
        elseif inHowMany == 40
            return 18988299
        elseif inHowMany == 41
            return 28731891
        elseif inHowMany == 42
            return 43661885
        elseif inHowMany == 43
            return 66454664
        elseif inHowMany == 44
            return 100651790
        elseif inHowMany == 45
            return 153248750
        elseif inHowMany == 46
            return 232530827
        elseif inHowMany == 47
            return 353041303
        elseif inHowMany == 48
            return 537053705
        elseif inHowMany == 49
            return 814135020
        elseif inHowMany == 50
            return 1238449243
        end
    elseif num == 18
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 21
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 70
        elseif inHowMany == 11
            return 110
        elseif inHowMany == 12
            return 150
        elseif inHowMany == 13
            return 213
        elseif inHowMany == 14
            return 361
        elseif inHowMany == 15
            return 567
        elseif inHowMany == 16
            return 811
        elseif inHowMany == 17
            return 1245
        elseif inHowMany == 18
            return 1871
        elseif inHowMany == 19
            return 2868
        elseif inHowMany == 20
            return 4388
        elseif inHowMany == 21
            return 6606
        elseif inHowMany == 22
            return 10182
        elseif inHowMany == 23
            return 15066
        elseif inHowMany == 24
            return 23081
        elseif inHowMany == 25
            return 35796
        elseif inHowMany == 26
            return 53377
        elseif inHowMany == 27
            return 81251
        elseif inHowMany == 28
            return 123258
        elseif inHowMany == 29
            return 187614
        elseif inHowMany == 30
            return 286634
        elseif inHowMany == 31
            return 430900
        elseif inHowMany == 32
            return 658802
        elseif inHowMany == 33
            return 1000845
        elseif inHowMany == 34
            return 1511181
        elseif inHowMany == 35
            return 2312342
        elseif inHowMany == 36
            return 3499821
        elseif inHowMany == 37
            return 5314821
        elseif inHowMany == 38
            return 8083963
        elseif inHowMany == 39
            return 12243258
        elseif inHowMany == 40
            return 18679485
        elseif inHowMany == 41
            return 28293855
        elseif inHowMany == 42
            return 42938943
        elseif inHowMany == 43
            return 65416794
        elseif inHowMany == 44
            return 99074816
        elseif inHowMany == 45
            return 150745025
        elseif inHowMany == 46
            return 228935562
        elseif inHowMany == 47
            return 347334603
        elseif inHowMany == 48
            return 528525075
        elseif inHowMany == 49
            return 801392099
        elseif inHowMany == 50
            return 1218357415
        end
    elseif num == 19
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 71
        elseif inHowMany == 11
            return 116
        elseif inHowMany == 12
            return 151
        elseif inHowMany == 13
            return 213
        elseif inHowMany == 14
            return 383
        elseif inHowMany == 15
            return 590
        elseif inHowMany == 16
            return 837
        elseif inHowMany == 17
            return 1253
        elseif inHowMany == 18
            return 1913
        elseif inHowMany == 19
            return 3014
        elseif inHowMany == 20
            return 4508
        elseif inHowMany == 21
            return 6788
        elseif inHowMany == 22
            return 10490
        elseif inHowMany == 23
            return 15485
        elseif inHowMany == 24
            return 23960
        elseif inHowMany == 25
            return 36837
        elseif inHowMany == 26
            return 54958
        elseif inHowMany == 27
            return 83850
        elseif inHowMany == 28
            return 126544
        elseif inHowMany == 29
            return 194245
        elseif inHowMany == 30
            return 295625
        elseif inHowMany == 31
            return 443069
        elseif inHowMany == 32
            return 680450
        elseif inHowMany == 33
            return 1030127
        elseif inHowMany == 34
            return 1560332
        elseif inHowMany == 35
            return 2384477
        elseif inHowMany == 36
            return 3601747
        elseif inHowMany == 37
            return 5489225
        elseif inHowMany == 38
            return 8324710
        elseif inHowMany == 39
            return 12623483
        elseif inHowMany == 40
            return 19276808
        elseif inHowMany == 41
            return 29133941
        elseif inHowMany == 42
            return 44304233
        elseif inHowMany == 43
            return 67417981
        elseif inHowMany == 44
            return 102121051
        elseif inHowMany == 45
            return 155535204
        elseif inHowMany == 46
            return 235813201
        elseif inHowMany == 47
            return 358240859
        elseif inHowMany == 48
            return 544944518
        elseif inHowMany == 49
            return 825830219
        elseif inHowMany == 50
            return 1256785841
        end
    elseif num == 20
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 10
        elseif inHowMany == 7
            return 19
        elseif inHowMany == 8
            return 30
        elseif inHowMany == 9
            return 35
        elseif inHowMany == 10
            return 50
        elseif inHowMany == 11
            return 96
        elseif inHowMany == 12
            return 154
        elseif inHowMany == 13
            return 192
        elseif inHowMany == 14
            return 291
        elseif inHowMany == 15
            return 495
        elseif inHowMany == 16
            return 742
        elseif inHowMany == 17
            return 1079
        elseif inHowMany == 18
            return 1644
        elseif inHowMany == 19
            return 2560
        elseif inHowMany == 20
            return 3816
        elseif inHowMany == 21
            return 5758
        elseif inHowMany == 22
            return 9035
        elseif inHowMany == 23
            return 13523
        elseif inHowMany == 24
            return 20087
        elseif inHowMany == 25
            return 31055
        elseif inHowMany == 26
            return 47620
        elseif inHowMany == 27
            return 71811
        elseif inHowMany == 28
            return 108001
        elseif inHowMany == 29
            return 165052
        elseif inHowMany == 30
            return 252809
        elseif inHowMany == 31
            return 380181
        elseif inHowMany == 32
            return 578222
        elseif inHowMany == 33
            return 882870
        elseif inHowMany == 34
            return 1334901
        elseif inHowMany == 35
            return 2028032
        elseif inHowMany == 36
            return 3083035
        elseif inHowMany == 37
            return 4690572
        elseif inHowMany == 38
            return 7116830
        elseif inHowMany == 39
            return 10779509
        elseif inHowMany == 40
            return 16433346
        elseif inHowMany == 41
            return 24952223
        elseif inHowMany == 42
            return 37823841
        elseif inHowMany == 43
            return 57539539
        elseif inHowMany == 44
            return 87355568
        elseif inHowMany == 45
            return 132725699
        elseif inHowMany == 46
            return 201547585
        elseif inHowMany == 47
            return 306041485
        elseif inHowMany == 48
            return 465362697
        elseif inHowMany == 49
            return 706055276
        elseif inHowMany == 50
            return 1072629280
        end
    elseif num == 21
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 26
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 39
        elseif inHowMany == 10
            return 69
        elseif inHowMany == 11
            return 119
        elseif inHowMany == 12
            return 173
        elseif inHowMany == 13
            return 221
        elseif inHowMany == 14
            return 381
        elseif inHowMany == 15
            return 623
        elseif inHowMany == 16
            return 832
        elseif inHowMany == 17
            return 1328
        elseif inHowMany == 18
            return 2036
        elseif inHowMany == 19
            return 3047
        elseif inHowMany == 20
            return 4647
        elseif inHowMany == 21
            return 6953
        elseif inHowMany == 22
            return 11065
        elseif inHowMany == 23
            return 16189
        elseif inHowMany == 24
            return 24162
        elseif inHowMany == 25
            return 38490
        elseif inHowMany == 26
            return 57007
        elseif inHowMany == 27
            return 86372
        elseif inHowMany == 28
            return 131999
        elseif inHowMany == 29
            return 199459
        elseif inHowMany == 30
            return 307129
        elseif inHowMany == 31
            return 458241
        elseif inHowMany == 32
            return 701343
        elseif inHowMany == 33
            return 1075187
        elseif inHowMany == 34
            return 1604919
        elseif inHowMany == 35
            return 2466190
        elseif inHowMany == 36
            return 3741209
        elseif inHowMany == 37
            return 5660681
        elseif inHowMany == 38
            return 8644638
        elseif inHowMany == 39
            return 13035061
        elseif inHowMany == 40
            return 19937856
        elseif inHowMany == 41
            return 30236092
        elseif inHowMany == 42
            return 45699490
        elseif inHowMany == 43
            return 69918051
        elseif inHowMany == 44
            return 105690065
        elseif inHowMany == 45
            return 160676229
        elseif inHowMany == 46
            return 244551516
        elseif inHowMany == 47
            return 370188997
        elseif inHowMany == 48
            return 564328224
        elseif inHowMany == 49
            return 855043476
        elseif inHowMany == 50
            return 1298778321
        end
    elseif num == 22
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 24
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 38
        elseif inHowMany == 10
            return 60
        elseif inHowMany == 11
            return 114
        elseif inHowMany == 12
            return 184
        elseif inHowMany == 13
            return 222
        elseif inHowMany == 14
            return 362
        elseif inHowMany == 15
            return 590
        elseif inHowMany == 16
            return 828
        elseif inHowMany == 17
            return 1322
        elseif inHowMany == 18
            return 1954
        elseif inHowMany == 19
            return 3002
        elseif inHowMany == 20
            return 4540
        elseif inHowMany == 21
            return 6762
        elseif inHowMany == 22
            return 10926
        elseif inHowMany == 23
            return 15842
        elseif inHowMany == 24
            return 23638
        elseif inHowMany == 25
            return 37424
        elseif inHowMany == 26
            return 55684
        elseif inHowMany == 27
            return 85292
        elseif inHowMany == 28
            return 128550
        elseif inHowMany == 29
            return 194656
        elseif inHowMany == 30
            return 301356
        elseif inHowMany == 31
            return 447460
        elseif inHowMany == 32
            return 687422
        elseif inHowMany == 33
            return 1050476
        elseif inHowMany == 34
            return 1569904
        elseif inHowMany == 35
            return 2416130
        elseif inHowMany == 36
            return 3649820
        elseif inHowMany == 37
            return 5548546
        elseif inHowMany == 38
            return 8460844
        elseif inHowMany == 39
            return 12730586
        elseif inHowMany == 40
            return 19527156
        elseif inHowMany == 41
            return 29555890
        elseif inHowMany == 42
            return 44731388
        elseif inHowMany == 43
            return 68411486
        elseif inHowMany == 44
            return 103286520
        elseif inHowMany == 45
            return 157357788
        elseif inHowMany == 46
            return 239100500
        elseif inHowMany == 47
            return 362080438
        elseif inHowMany == 48
            return 552427838
        elseif inHowMany == 49
            return 835881942
        elseif inHowMany == 50
            return 1271053550
        end
    elseif num == 23
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 11
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 45
        elseif inHowMany == 10
            return 65
        elseif inHowMany == 11
            return 109
        elseif inHowMany == 12
            return 171
        elseif inHowMany == 13
            return 225
        elseif inHowMany == 14
            return 383
        elseif inHowMany == 15
            return 589
        elseif inHowMany == 16
            return 815
        elseif inHowMany == 17
            return 1303
        elseif inHowMany == 18
            return 1964
        elseif inHowMany == 19
            return 3057
        elseif inHowMany == 20
            return 4551
        elseif inHowMany == 21
            return 6728
        elseif inHowMany == 22
            return 10823
        elseif inHowMany == 23
            return 15835
        elseif inHowMany == 24
            return 23935
        elseif inHowMany == 25
            return 37426
        elseif inHowMany == 26
            return 55411
        elseif inHowMany == 27
            return 85274
        elseif inHowMany == 28
            return 128654
        elseif inHowMany == 29
            return 195488
        elseif inHowMany == 30
            return 301171
        elseif inHowMany == 31
            return 446961
        elseif inHowMany == 32
            return 688306
        elseif inHowMany == 33
            return 1049388
        elseif inHowMany == 34
            return 1573542
        elseif inHowMany == 35
            return 2418847
        elseif inHowMany == 36
            return 3646292
        elseif inHowMany == 37
            return 5553516
        elseif inHowMany == 38
            return 8461020
        elseif inHowMany == 39
            return 12747324
        elseif inHowMany == 40
            return 19541883
        elseif inHowMany == 41
            return 29539546
        elseif inHowMany == 42
            return 44783486
        elseif inHowMany == 43
            return 68431589
        elseif inHowMany == 44
            return 103333397
        elseif inHowMany == 45
            return 157506805
        elseif inHowMany == 46
            return 239092860
        elseif inHowMany == 47
            return 362356049
        elseif inHowMany == 48
            return 552674077
        elseif inHowMany == 49
            return 836199962
        elseif inHowMany == 50
            return 1272168218
        end
    elseif num == 24
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 10
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 46
        elseif inHowMany == 10
            return 60
        elseif inHowMany == 11
            return 104
        elseif inHowMany == 12
            return 174
        elseif inHowMany == 13
            return 226
        elseif inHowMany == 14
            return 376
        elseif inHowMany == 15
            return 564
        elseif inHowMany == 16
            return 804
        elseif inHowMany == 17
            return 1298
        elseif inHowMany == 18
            return 1928
        elseif inHowMany == 19
            return 3042
        elseif inHowMany == 20
            return 4452
        elseif inHowMany == 21
            return 6585
        elseif inHowMany == 22
            return 10743
        elseif inHowMany == 23
            return 15642
        elseif inHowMany == 24
            return 23639
        elseif inHowMany == 25
            return 36669
        elseif inHowMany == 26
            return 54511
        elseif inHowMany == 27
            return 84640
        elseif inHowMany == 28
            return 126510
        elseif inHowMany == 29
            return 192580
        elseif inHowMany == 30
            return 297140
        elseif inHowMany == 31
            return 439786
        elseif inHowMany == 32
            return 679903
        elseif inHowMany == 33
            return 1033429
        elseif inHowMany == 34
            return 1551507
        elseif inHowMany == 35
            return 2386184
        elseif inHowMany == 36
            return 3586733
        elseif inHowMany == 37
            return 5483706
        elseif inHowMany == 38
            return 8341317
        elseif inHowMany == 39
            return 12554287
        elseif inHowMany == 40
            return 19278962
        elseif inHowMany == 41
            return 29094582
        elseif inHowMany == 42
            return 44173494
        elseif inHowMany == 43
            return 67461727
        elseif inHowMany == 44
            return 101793210
        elseif inHowMany == 45
            return 155388606
        elseif inHowMany == 46
            return 235554920
        elseif inHowMany == 47
            return 357210061
        elseif inHowMany == 48
            return 545029327
        elseif inHowMany == 49
            return 823866382
        elseif inHowMany == 50
            return 1254513380
        end
    elseif num == 25
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 41
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 102
        elseif inHowMany == 12
            return 159
        elseif inHowMany == 13
            return 220
        elseif inHowMany == 14
            return 344
        elseif inHowMany == 15
            return 518
        elseif inHowMany == 16
            return 797
        elseif inHowMany == 17
            return 1258
        elseif inHowMany == 18
            return 1785
        elseif inHowMany == 19
            return 2761
        elseif inHowMany == 20
            return 4246
        elseif inHowMany == 21
            return 6434
        elseif inHowMany == 22
            return 9992
        elseif inHowMany == 23
            return 14596
        elseif inHowMany == 24
            return 22446
        elseif inHowMany == 25
            return 34559
        elseif inHowMany == 26
            return 51664
        elseif inHowMany == 27
            return 79736
        elseif inHowMany == 28
            return 119436
        elseif inHowMany == 29
            return 181536
        elseif inHowMany == 30
            return 278799
        elseif inHowMany == 31
            return 418275
        elseif inHowMany == 32
            return 641902
        elseif inHowMany == 33
            return 970077
        elseif inHowMany == 34
            return 1466757
        elseif inHowMany == 35
            return 2250694
        elseif inHowMany == 36
            return 3390495
        elseif inHowMany == 37
            return 5170419
        elseif inHowMany == 38
            return 7857041
        elseif inHowMany == 39
            return 11875292
        elseif inHowMany == 40
            return 18160412
        elseif inHowMany == 41
            return 27456404
        elseif inHowMany == 42
            return 41741510
        elseif inHowMany == 43
            return 63559539
        elseif inHowMany == 44
            return 96111742
        elseif inHowMany == 45
            return 146576591
        elseif inHowMany == 46
            return 222278457
        elseif inHowMany == 47
            return 337311142
        elseif inHowMany == 48
            return 513662439
        elseif inHowMany == 49
            return 777886090
        elseif inHowMany == 50
            return 1183930955
        end
    elseif num == 26
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 41
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 111
        elseif inHowMany == 12
            return 160
        elseif inHowMany == 13
            return 214
        elseif inHowMany == 14
            return 364
        elseif inHowMany == 15
            return 545
        elseif inHowMany == 16
            return 815
        elseif inHowMany == 17
            return 1261
        elseif inHowMany == 18
            return 1848
        elseif inHowMany == 19
            return 2932
        elseif inHowMany == 20
            return 4303
        elseif inHowMany == 21
            return 6574
        elseif inHowMany == 22
            return 10380
        elseif inHowMany == 23
            return 14973
        elseif inHowMany == 24
            return 23190
        elseif inHowMany == 25
            return 35527
        elseif inHowMany == 26
            return 53311
        elseif inHowMany == 27
            return 82294
        elseif inHowMany == 28
            return 122251
        elseif inHowMany == 29
            return 188199
        elseif inHowMany == 30
            return 287381
        elseif inHowMany == 31
            return 428887
        elseif inHowMany == 32
            return 663331
        elseif inHowMany == 33
            return 998355
        elseif inHowMany == 34
            return 1512857
        elseif inHowMany == 35
            return 2318424
        elseif inHowMany == 36
            return 3486809
        elseif inHowMany == 37
            return 5342128
        elseif inHowMany == 38
            return 8080410
        elseif inHowMany == 39
            return 12231672
        elseif inHowMany == 40
            return 18742057
        elseif inHowMany == 41
            return 28242115
        elseif inHowMany == 42
            return 43041675
        elseif inHowMany == 43
            return 65466458
        elseif inHowMany == 44
            return 98998537
        elseif inHowMany == 45
            return 151161938
        elseif inHowMany == 46
            return 228732095
        elseif inHowMany == 47
            return 347747652
        elseif inHowMany == 48
            return 529347966
        elseif inHowMany == 49
            return 800855603
        elseif inHowMany == 50
            return 1220692815
        end
    elseif num == 27
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 41
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 109
        elseif inHowMany == 12
            return 164
        elseif inHowMany == 13
            return 217
        elseif inHowMany == 14
            return 349
        elseif inHowMany == 15
            return 537
        elseif inHowMany == 16
            return 827
        elseif inHowMany == 17
            return 1263
        elseif inHowMany == 18
            return 1809
        elseif inHowMany == 19
            return 2870
        elseif inHowMany == 20
            return 4335
        elseif inHowMany == 21
            return 6546
        elseif inHowMany == 22
            return 10225
        elseif inHowMany == 23
            return 14915
        elseif inHowMany == 24
            return 22989
        elseif inHowMany == 25
            return 35221
        elseif inHowMany == 26
            return 52913
        elseif inHowMany == 27
            return 81680
        elseif inHowMany == 28
            return 121529
        elseif inHowMany == 29
            return 186000
        elseif inHowMany == 30
            return 285316
        elseif inHowMany == 31
            return 426982
        elseif inHowMany == 32
            return 656651
        elseif inHowMany == 33
            return 990633
        elseif inHowMany == 34
            return 1501389
        elseif inHowMany == 35
            return 2300272
        elseif inHowMany == 36
            return 3462007
        elseif inHowMany == 37
            return 5294151
        elseif inHowMany == 38
            return 8025205
        elseif inHowMany == 39
            return 12137197
        elseif inHowMany == 40
            return 18577599
        elseif inHowMany == 41
            return 28051689
        elseif inHowMany == 42
            return 42693783
        elseif inHowMany == 43
            return 64948099
        elseif inHowMany == 44
            return 98248245
        elseif inHowMany == 45
            return 149930309
        elseif inHowMany == 46
            return 227079811
        elseif inHowMany == 47
            return 344932744
        elseif inHowMany == 48
            return 525153319
        elseif inHowMany == 49
            return 794973486
        elseif inHowMany == 50
            return 1210724472
        end
    elseif num == 28
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 19
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 41
        elseif inHowMany == 10
            return 61
        elseif inHowMany == 11
            return 105
        elseif inHowMany == 12
            return 161
        elseif inHowMany == 13
            return 214
        elseif inHowMany == 14
            return 342
        elseif inHowMany == 15
            return 534
        elseif inHowMany == 16
            return 807
        elseif inHowMany == 17
            return 1239
        elseif inHowMany == 18
            return 1789
        elseif inHowMany == 19
            return 2823
        elseif inHowMany == 20
            return 4281
        elseif inHowMany == 21
            return 6415
        elseif inHowMany == 22
            return 10043
        elseif inHowMany == 23
            return 14719
        elseif inHowMany == 24
            return 22557
        elseif inHowMany == 25
            return 34730
        elseif inHowMany == 26
            return 52054
        elseif inHowMany == 27
            return 80171
        elseif inHowMany == 28
            return 119809
        elseif inHowMany == 29
            return 182811
        elseif inHowMany == 30
            return 280861
        elseif inHowMany == 31
            return 420119
        elseif inHowMany == 32
            return 644881
        elseif inHowMany == 33
            return 976134
        elseif inHowMany == 34
            return 1476166
        elseif inHowMany == 35
            return 2262282
        elseif inHowMany == 36
            return 3408432
        elseif inHowMany == 37
            return 5202686
        elseif inHowMany == 38
            return 7900169
        elseif inHowMany == 39
            return 11938783
        elseif inHowMany == 40
            return 18268785
        elseif inHowMany == 41
            return 27613653
        elseif inHowMany == 42
            return 41970841
        elseif inHowMany == 43
            return 63910229
        elseif inHowMany == 44
            return 96671271
        elseif inHowMany == 45
            return 147426584
        elseif inHowMany == 46
            return 223484546
        elseif inHowMany == 47
            return 339226044
        elseif inHowMany == 48
            return 516624689
        elseif inHowMany == 49
            return 782230565
        elseif inHowMany == 50
            return 1190632644
        end
    elseif num == 29
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 41
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 111
        elseif inHowMany == 12
            return 162
        elseif inHowMany == 13
            return 214
        elseif inHowMany == 14
            return 364
        elseif inHowMany == 15
            return 557
        elseif inHowMany == 16
            return 833
        elseif inHowMany == 17
            return 1247
        elseif inHowMany == 18
            return 1831
        elseif inHowMany == 19
            return 2969
        elseif inHowMany == 20
            return 4401
        elseif inHowMany == 21
            return 6597
        elseif inHowMany == 22
            return 10351
        elseif inHowMany == 23
            return 15138
        elseif inHowMany == 24
            return 23436
        elseif inHowMany == 25
            return 35771
        elseif inHowMany == 26
            return 53635
        elseif inHowMany == 27
            return 82770
        elseif inHowMany == 28
            return 123095
        elseif inHowMany == 29
            return 189442
        elseif inHowMany == 30
            return 289852
        elseif inHowMany == 31
            return 432288
        elseif inHowMany == 32
            return 666529
        elseif inHowMany == 33
            return 1005416
        elseif inHowMany == 34
            return 1525317
        elseif inHowMany == 35
            return 2334417
        elseif inHowMany == 36
            return 3510358
        elseif inHowMany == 37
            return 5377090
        elseif inHowMany == 38
            return 8140916
        elseif inHowMany == 39
            return 12319008
        elseif inHowMany == 40
            return 18866108
        elseif inHowMany == 41
            return 28453739
        elseif inHowMany == 42
            return 43336131
        elseif inHowMany == 43
            return 65911416
        elseif inHowMany == 44
            return 99717506
        elseif inHowMany == 45
            return 152216763
        elseif inHowMany == 46
            return 230362185
        elseif inHowMany == 47
            return 350132300
        elseif inHowMany == 48
            return 533044132
        elseif inHowMany == 49
            return 806668685
        elseif inHowMany == 50
            return 1229061070
        end
    elseif num == 30
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 9
        elseif inHowMany == 7
            return 17
        elseif inHowMany == 8
            return 30
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 55
        elseif inHowMany == 11
            return 91
        elseif inHowMany == 12
            return 141
        elseif inHowMany == 13
            return 195
        elseif inHowMany == 14
            return 312
        elseif inHowMany == 15
            return 494
        elseif inHowMany == 16
            return 729
        elseif inHowMany == 17
            return 1060
        elseif inHowMany == 18
            return 1654
        elseif inHowMany == 19
            return 2615
        elseif inHowMany == 20
            return 3827
        elseif inHowMany == 21
            return 5724
        elseif inHowMany == 22
            return 8932
        elseif inHowMany == 23
            return 13516
        elseif inHowMany == 24
            return 20384
        elseif inHowMany == 25
            return 31057
        elseif inHowMany == 26
            return 47347
        elseif inHowMany == 27
            return 71793
        elseif inHowMany == 28
            return 108105
        elseif inHowMany == 29
            return 165884
        elseif inHowMany == 30
            return 252624
        elseif inHowMany == 31
            return 379682
        elseif inHowMany == 32
            return 579106
        elseif inHowMany == 33
            return 881782
        elseif inHowMany == 34
            return 1338539
        elseif inHowMany == 35
            return 2030749
        elseif inHowMany == 36
            return 3079507
        elseif inHowMany == 37
            return 4695542
        elseif inHowMany == 38
            return 7117006
        elseif inHowMany == 39
            return 10796247
        elseif inHowMany == 40
            return 16448073
        elseif inHowMany == 41
            return 24935879
        elseif inHowMany == 42
            return 37875939
        elseif inHowMany == 43
            return 57559642
        elseif inHowMany == 44
            return 87402445
        elseif inHowMany == 45
            return 132874716
        elseif inHowMany == 46
            return 201539945
        elseif inHowMany == 47
            return 306317096
        elseif inHowMany == 48
            return 465608936
        elseif inHowMany == 49
            return 706373296
        elseif inHowMany == 50
            return 1073743948
        end
    elseif num == 31
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 24
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 46
        elseif inHowMany == 10
            return 74
        elseif inHowMany == 11
            return 114
        elseif inHowMany == 12
            return 160
        elseif inHowMany == 13
            return 224
        elseif inHowMany == 14
            return 402
        elseif inHowMany == 15
            return 622
        elseif inHowMany == 16
            return 819
        elseif inHowMany == 17
            return 1309
        elseif inHowMany == 18
            return 2046
        elseif inHowMany == 19
            return 3102
        elseif inHowMany == 20
            return 4658
        elseif inHowMany == 21
            return 6919
        elseif inHowMany == 22
            return 10962
        elseif inHowMany == 23
            return 16182
        elseif inHowMany == 24
            return 24459
        elseif inHowMany == 25
            return 38492
        elseif inHowMany == 26
            return 56734
        elseif inHowMany == 27
            return 86354
        elseif inHowMany == 28
            return 132103
        elseif inHowMany == 29
            return 200291
        elseif inHowMany == 30
            return 306944
        elseif inHowMany == 31
            return 457742
        elseif inHowMany == 32
            return 702227
        elseif inHowMany == 33
            return 1074099
        elseif inHowMany == 34
            return 1608557
        elseif inHowMany == 35
            return 2468907
        elseif inHowMany == 36
            return 3737681
        elseif inHowMany == 37
            return 5665651
        elseif inHowMany == 38
            return 8644814
        elseif inHowMany == 39
            return 13051799
        elseif inHowMany == 40
            return 19952583
        elseif inHowMany == 41
            return 30219748
        elseif inHowMany == 42
            return 45751588
        elseif inHowMany == 43
            return 69938154
        elseif inHowMany == 44
            return 105736942
        elseif inHowMany == 45
            return 160825246
        elseif inHowMany == 46
            return 244543876
        elseif inHowMany == 47
            return 370464608
        elseif inHowMany == 48
            return 564574463
        elseif inHowMany == 49
            return 855361496
        elseif inHowMany == 50
            return 1299892989
        end
    elseif num == 32
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 11
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 45
        elseif inHowMany == 10
            return 65
        elseif inHowMany == 11
            return 109
        elseif inHowMany == 12
            return 171
        elseif inHowMany == 13
            return 225
        elseif inHowMany == 14
            return 383
        elseif inHowMany == 15
            return 589
        elseif inHowMany == 16
            return 815
        elseif inHowMany == 17
            return 1303
        elseif inHowMany == 18
            return 1964
        elseif inHowMany == 19
            return 3057
        elseif inHowMany == 20
            return 4551
        elseif inHowMany == 21
            return 6728
        elseif inHowMany == 22
            return 10823
        elseif inHowMany == 23
            return 15835
        elseif inHowMany == 24
            return 23935
        elseif inHowMany == 25
            return 37426
        elseif inHowMany == 26
            return 55411
        elseif inHowMany == 27
            return 85274
        elseif inHowMany == 28
            return 128654
        elseif inHowMany == 29
            return 195488
        elseif inHowMany == 30
            return 301171
        elseif inHowMany == 31
            return 446961
        elseif inHowMany == 32
            return 688306
        elseif inHowMany == 33
            return 1049388
        elseif inHowMany == 34
            return 1573542
        elseif inHowMany == 35
            return 2418847
        elseif inHowMany == 36
            return 3646292
        elseif inHowMany == 37
            return 5553516
        elseif inHowMany == 38
            return 8461020
        elseif inHowMany == 39
            return 12747324
        elseif inHowMany == 40
            return 19541883
        elseif inHowMany == 41
            return 29539546
        elseif inHowMany == 42
            return 44783486
        elseif inHowMany == 43
            return 68431589
        elseif inHowMany == 44
            return 103333397
        elseif inHowMany == 45
            return 157506805
        elseif inHowMany == 46
            return 239092860
        elseif inHowMany == 47
            return 362356049
        elseif inHowMany == 48
            return 552674077
        elseif inHowMany == 49
            return 836199962
        elseif inHowMany == 50
            return 1272168218
        end
    elseif num == 33
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 10
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 52
        elseif inHowMany == 10
            return 70
        elseif inHowMany == 11
            return 104
        elseif inHowMany == 12
            return 158
        elseif inHowMany == 13
            return 228
        elseif inHowMany == 14
            return 404
        elseif inHowMany == 15
            return 588
        elseif inHowMany == 16
            return 802
        elseif inHowMany == 17
            return 1284
        elseif inHowMany == 18
            return 1974
        elseif inHowMany == 19
            return 3112
        elseif inHowMany == 20
            return 4562
        elseif inHowMany == 21
            return 6694
        elseif inHowMany == 22
            return 10720
        elseif inHowMany == 23
            return 15828
        elseif inHowMany == 24
            return 24232
        elseif inHowMany == 25
            return 37428
        elseif inHowMany == 26
            return 55138
        elseif inHowMany == 27
            return 85256
        elseif inHowMany == 28
            return 128758
        elseif inHowMany == 29
            return 196320
        elseif inHowMany == 30
            return 300986
        elseif inHowMany == 31
            return 446462
        elseif inHowMany == 32
            return 689190
        elseif inHowMany == 33
            return 1048300
        elseif inHowMany == 34
            return 1577180
        elseif inHowMany == 35
            return 2421564
        elseif inHowMany == 36
            return 3642764
        elseif inHowMany == 37
            return 5558486
        elseif inHowMany == 38
            return 8461196
        elseif inHowMany == 39
            return 12764062
        elseif inHowMany == 40
            return 19556610
        elseif inHowMany == 41
            return 29523202
        elseif inHowMany == 42
            return 44835584
        elseif inHowMany == 43
            return 68451692
        elseif inHowMany == 44
            return 103380274
        elseif inHowMany == 45
            return 157655822
        elseif inHowMany == 46
            return 239085220
        elseif inHowMany == 47
            return 362631660
        elseif inHowMany == 48
            return 552920316
        elseif inHowMany == 49
            return 836517982
        elseif inHowMany == 50
            return 1273282886
        end
    elseif num == 34
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 9
        elseif inHowMany == 7
            return 18
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 53
        elseif inHowMany == 10
            return 65
        elseif inHowMany == 11
            return 99
        elseif inHowMany == 12
            return 161
        elseif inHowMany == 13
            return 229
        elseif inHowMany == 14
            return 397
        elseif inHowMany == 15
            return 563
        elseif inHowMany == 16
            return 791
        elseif inHowMany == 17
            return 1279
        elseif inHowMany == 18
            return 1938
        elseif inHowMany == 19
            return 3097
        elseif inHowMany == 20
            return 4463
        elseif inHowMany == 21
            return 6551
        elseif inHowMany == 22
            return 10640
        elseif inHowMany == 23
            return 15635
        elseif inHowMany == 24
            return 23936
        elseif inHowMany == 25
            return 36671
        elseif inHowMany == 26
            return 54238
        elseif inHowMany == 27
            return 84622
        elseif inHowMany == 28
            return 126614
        elseif inHowMany == 29
            return 193412
        elseif inHowMany == 30
            return 296955
        elseif inHowMany == 31
            return 439287
        elseif inHowMany == 32
            return 680787
        elseif inHowMany == 33
            return 1032341
        elseif inHowMany == 34
            return 1555145
        elseif inHowMany == 35
            return 2388901
        elseif inHowMany == 36
            return 3583205
        elseif inHowMany == 37
            return 5488676
        elseif inHowMany == 38
            return 8341493
        elseif inHowMany == 39
            return 12571025
        elseif inHowMany == 40
            return 19293689
        elseif inHowMany == 41
            return 29078238
        elseif inHowMany == 42
            return 44225592
        elseif inHowMany == 43
            return 67481830
        elseif inHowMany == 44
            return 101840087
        elseif inHowMany == 45
            return 155537623
        elseif inHowMany == 46
            return 235547280
        elseif inHowMany == 47
            return 357485672
        elseif inHowMany == 48
            return 545275566
        elseif inHowMany == 49
            return 824184402
        elseif inHowMany == 50
            return 1255628048
        end
    elseif num == 35
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 18
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 48
        elseif inHowMany == 10
            return 67
        elseif inHowMany == 11
            return 97
        elseif inHowMany == 12
            return 146
        elseif inHowMany == 13
            return 223
        elseif inHowMany == 14
            return 365
        elseif inHowMany == 15
            return 517
        elseif inHowMany == 16
            return 784
        elseif inHowMany == 17
            return 1239
        elseif inHowMany == 18
            return 1795
        elseif inHowMany == 19
            return 2816
        elseif inHowMany == 20
            return 4257
        elseif inHowMany == 21
            return 6400
        elseif inHowMany == 22
            return 9889
        elseif inHowMany == 23
            return 14589
        elseif inHowMany == 24
            return 22743
        elseif inHowMany == 25
            return 34561
        elseif inHowMany == 26
            return 51391
        elseif inHowMany == 27
            return 79718
        elseif inHowMany == 28
            return 119540
        elseif inHowMany == 29
            return 182368
        elseif inHowMany == 30
            return 278614
        elseif inHowMany == 31
            return 417776
        elseif inHowMany == 32
            return 642786
        elseif inHowMany == 33
            return 968989
        elseif inHowMany == 34
            return 1470395
        elseif inHowMany == 35
            return 2253411
        elseif inHowMany == 36
            return 3386967
        elseif inHowMany == 37
            return 5175389
        elseif inHowMany == 38
            return 7857217
        elseif inHowMany == 39
            return 11892030
        elseif inHowMany == 40
            return 18175139
        elseif inHowMany == 41
            return 27440060
        elseif inHowMany == 42
            return 41793608
        elseif inHowMany == 43
            return 63579642
        elseif inHowMany == 44
            return 96158619
        elseif inHowMany == 45
            return 146725608
        elseif inHowMany == 46
            return 222270817
        elseif inHowMany == 47
            return 337586753
        elseif inHowMany == 48
            return 513908678
        elseif inHowMany == 49
            return 778204110
        elseif inHowMany == 50
            return 1185045623
        end
    elseif num == 36
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 18
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 48
        elseif inHowMany == 10
            return 67
        elseif inHowMany == 11
            return 106
        elseif inHowMany == 12
            return 147
        elseif inHowMany == 13
            return 217
        elseif inHowMany == 14
            return 385
        elseif inHowMany == 15
            return 544
        elseif inHowMany == 16
            return 802
        elseif inHowMany == 17
            return 1242
        elseif inHowMany == 18
            return 1858
        elseif inHowMany == 19
            return 2987
        elseif inHowMany == 20
            return 4314
        elseif inHowMany == 21
            return 6540
        elseif inHowMany == 22
            return 10277
        elseif inHowMany == 23
            return 14966
        elseif inHowMany == 24
            return 23487
        elseif inHowMany == 25
            return 35529
        elseif inHowMany == 26
            return 53038
        elseif inHowMany == 27
            return 82276
        elseif inHowMany == 28
            return 122355
        elseif inHowMany == 29
            return 189031
        elseif inHowMany == 30
            return 287196
        elseif inHowMany == 31
            return 428388
        elseif inHowMany == 32
            return 664215
        elseif inHowMany == 33
            return 997267
        elseif inHowMany == 34
            return 1516495
        elseif inHowMany == 35
            return 2321141
        elseif inHowMany == 36
            return 3483281
        elseif inHowMany == 37
            return 5347098
        elseif inHowMany == 38
            return 8080586
        elseif inHowMany == 39
            return 12248410
        elseif inHowMany == 40
            return 18756784
        elseif inHowMany == 41
            return 28225771
        elseif inHowMany == 42
            return 43093773
        elseif inHowMany == 43
            return 65486561
        elseif inHowMany == 44
            return 99045414
        elseif inHowMany == 45
            return 151310955
        elseif inHowMany == 46
            return 228724455
        elseif inHowMany == 47
            return 348023263
        elseif inHowMany == 48
            return 529594205
        elseif inHowMany == 49
            return 801173623
        elseif inHowMany == 50
            return 1221807483
        end
    elseif num == 37
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 18
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 48
        elseif inHowMany == 10
            return 67
        elseif inHowMany == 11
            return 104
        elseif inHowMany == 12
            return 151
        elseif inHowMany == 13
            return 220
        elseif inHowMany == 14
            return 370
        elseif inHowMany == 15
            return 536
        elseif inHowMany == 16
            return 814
        elseif inHowMany == 17
            return 1244
        elseif inHowMany == 18
            return 1819
        elseif inHowMany == 19
            return 2925
        elseif inHowMany == 20
            return 4346
        elseif inHowMany == 21
            return 6512
        elseif inHowMany == 22
            return 10122
        elseif inHowMany == 23
            return 14908
        elseif inHowMany == 24
            return 23286
        elseif inHowMany == 25
            return 35223
        elseif inHowMany == 26
            return 52640
        elseif inHowMany == 27
            return 81662
        elseif inHowMany == 28
            return 121633
        elseif inHowMany == 29
            return 186832
        elseif inHowMany == 30
            return 285131
        elseif inHowMany == 31
            return 426483
        elseif inHowMany == 32
            return 657535
        elseif inHowMany == 33
            return 989545
        elseif inHowMany == 34
            return 1505027
        elseif inHowMany == 35
            return 2302989
        elseif inHowMany == 36
            return 3458479
        elseif inHowMany == 37
            return 5299121
        elseif inHowMany == 38
            return 8025381
        elseif inHowMany == 39
            return 12153935
        elseif inHowMany == 40
            return 18592326
        elseif inHowMany == 41
            return 28035345
        elseif inHowMany == 42
            return 42745881
        elseif inHowMany == 43
            return 64968202
        elseif inHowMany == 44
            return 98295122
        elseif inHowMany == 45
            return 150079326
        elseif inHowMany == 46
            return 227072171
        elseif inHowMany == 47
            return 345208355
        elseif inHowMany == 48
            return 525399558
        elseif inHowMany == 49
            return 795291506
        elseif inHowMany == 50
            return 1211839140
        end
    elseif num == 38
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 17
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 48
        elseif inHowMany == 10
            return 66
        elseif inHowMany == 11
            return 100
        elseif inHowMany == 12
            return 148
        elseif inHowMany == 13
            return 217
        elseif inHowMany == 14
            return 363
        elseif inHowMany == 15
            return 533
        elseif inHowMany == 16
            return 794
        elseif inHowMany == 17
            return 1220
        elseif inHowMany == 18
            return 1799
        elseif inHowMany == 19
            return 2878
        elseif inHowMany == 20
            return 4292
        elseif inHowMany == 21
            return 6381
        elseif inHowMany == 22
            return 9940
        elseif inHowMany == 23
            return 14712
        elseif inHowMany == 24
            return 22854
        elseif inHowMany == 25
            return 34732
        elseif inHowMany == 26
            return 51781
        elseif inHowMany == 27
            return 80153
        elseif inHowMany == 28
            return 119913
        elseif inHowMany == 29
            return 183643
        elseif inHowMany == 30
            return 280676
        elseif inHowMany == 31
            return 419620
        elseif inHowMany == 32
            return 645765
        elseif inHowMany == 33
            return 975046
        elseif inHowMany == 34
            return 1479804
        elseif inHowMany == 35
            return 2264999
        elseif inHowMany == 36
            return 3404904
        elseif inHowMany == 37
            return 5207656
        elseif inHowMany == 38
            return 7900345
        elseif inHowMany == 39
            return 11955521
        elseif inHowMany == 40
            return 18283512
        elseif inHowMany == 41
            return 27597309
        elseif inHowMany == 42
            return 42022939
        elseif inHowMany == 43
            return 63930332
        elseif inHowMany == 44
            return 96718148
        elseif inHowMany == 45
            return 147575601
        elseif inHowMany == 46
            return 223476906
        elseif inHowMany == 47
            return 339501655
        elseif inHowMany == 48
            return 516870928
        elseif inHowMany == 49
            return 782548585
        elseif inHowMany == 50
            return 1191747312
        end
    elseif num == 39
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 18
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 48
        elseif inHowMany == 10
            return 67
        elseif inHowMany == 11
            return 106
        elseif inHowMany == 12
            return 149
        elseif inHowMany == 13
            return 217
        elseif inHowMany == 14
            return 385
        elseif inHowMany == 15
            return 556
        elseif inHowMany == 16
            return 820
        elseif inHowMany == 17
            return 1228
        elseif inHowMany == 18
            return 1841
        elseif inHowMany == 19
            return 3024
        elseif inHowMany == 20
            return 4412
        elseif inHowMany == 21
            return 6563
        elseif inHowMany == 22
            return 10248
        elseif inHowMany == 23
            return 15131
        elseif inHowMany == 24
            return 23733
        elseif inHowMany == 25
            return 35773
        elseif inHowMany == 26
            return 53362
        elseif inHowMany == 27
            return 82752
        elseif inHowMany == 28
            return 123199
        elseif inHowMany == 29
            return 190274
        elseif inHowMany == 30
            return 289667
        elseif inHowMany == 31
            return 431789
        elseif inHowMany == 32
            return 667413
        elseif inHowMany == 33
            return 1004328
        elseif inHowMany == 34
            return 1528955
        elseif inHowMany == 35
            return 2337134
        elseif inHowMany == 36
            return 3506830
        elseif inHowMany == 37
            return 5382060
        elseif inHowMany == 38
            return 8141092
        elseif inHowMany == 39
            return 12335746
        elseif inHowMany == 40
            return 18880835
        elseif inHowMany == 41
            return 28437395
        elseif inHowMany == 42
            return 43388229
        elseif inHowMany == 43
            return 65931519
        elseif inHowMany == 44
            return 99764383
        elseif inHowMany == 45
            return 152365780
        elseif inHowMany == 46
            return 230354545
        elseif inHowMany == 47
            return 350407911
        elseif inHowMany == 48
            return 533290371
        elseif inHowMany == 49
            return 806986705
        elseif inHowMany == 50
            return 1230175738
        end
    elseif num == 40
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 8
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 30
        elseif inHowMany == 9
            return 43
        elseif inHowMany == 10
            return 50
        elseif inHowMany == 11
            return 86
        elseif inHowMany == 12
            return 144
        elseif inHowMany == 13
            return 196
        elseif inHowMany == 14
            return 305
        elseif inHowMany == 15
            return 469
        elseif inHowMany == 16
            return 718
        elseif inHowMany == 17
            return 1055
        elseif inHowMany == 18
            return 1618
        elseif inHowMany == 19
            return 2600
        elseif inHowMany == 20
            return 3728
        elseif inHowMany == 21
            return 5581
        elseif inHowMany == 22
            return 8852
        elseif inHowMany == 23
            return 13323
        elseif inHowMany == 24
            return 20088
        elseif inHowMany == 25
            return 30300
        elseif inHowMany == 26
            return 46447
        elseif inHowMany == 27
            return 71159
        elseif inHowMany == 28
            return 105961
        elseif inHowMany == 29
            return 162976
        elseif inHowMany == 30
            return 248593
        elseif inHowMany == 31
            return 372507
        elseif inHowMany == 32
            return 570703
        elseif inHowMany == 33
            return 865823
        elseif inHowMany == 34
            return 1316504
        elseif inHowMany == 35
            return 1998086
        elseif inHowMany == 36
            return 3019948
        elseif inHowMany == 37
            return 4625732
        elseif inHowMany == 38
            return 6997303
        elseif inHowMany == 39
            return 10603210
        elseif inHowMany == 40
            return 16185152
        elseif inHowMany == 41
            return 24490915
        elseif inHowMany == 42
            return 37265947
        elseif inHowMany == 43
            return 56589780
        elseif inHowMany == 44
            return 85862258
        elseif inHowMany == 45
            return 130756517
        elseif inHowMany == 46
            return 198002005
        elseif inHowMany == 47
            return 301171108
        elseif inHowMany == 48
            return 457964186
        elseif inHowMany == 49
            return 694039716
        elseif inHowMany == 50
            return 1056089110
        end
    elseif num == 41
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 11
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 47
        elseif inHowMany == 10
            return 69
        elseif inHowMany == 11
            return 109
        elseif inHowMany == 12
            return 163
        elseif inHowMany == 13
            return 225
        elseif inHowMany == 14
            return 395
        elseif inHowMany == 15
            return 597
        elseif inHowMany == 16
            return 808
        elseif inHowMany == 17
            return 1304
        elseif inHowMany == 18
            return 2010
        elseif inHowMany == 19
            return 3087
        elseif inHowMany == 20
            return 4559
        elseif inHowMany == 21
            return 6776
        elseif inHowMany == 22
            return 10882
        elseif inHowMany == 23
            return 15989
        elseif inHowMany == 24
            return 24163
        elseif inHowMany == 25
            return 37735
        elseif inHowMany == 26
            return 55834
        elseif inHowMany == 27
            return 85720
        elseif inHowMany == 28
            return 129959
        elseif inHowMany == 29
            return 197383
        elseif inHowMany == 30
            return 302913
        elseif inHowMany == 31
            return 450567
        elseif inHowMany == 32
            return 693824
        elseif inHowMany == 33
            return 1058140
        elseif inHowMany == 34
            return 1586522
        elseif inHowMany == 35
            return 2436244
        elseif inHowMany == 36
            return 3678122
        elseif inHowMany == 37
            return 5595841
        elseif inHowMany == 38
            return 8525111
        elseif inHowMany == 39
            return 12858762
        elseif inHowMany == 40
            return 19689662
        elseif inHowMany == 41
            return 29774784
        elseif inHowMany == 42
            return 45141596
        elseif inHowMany == 43
            return 68968292
        elseif inHowMany == 44
            return 104196755
        elseif inHowMany == 45
            return 158707047
        elseif inHowMany == 46
            return 241005936
        elseif inHowMany == 47
            return 365318620
        elseif inHowMany == 48
            return 556929713
        elseif inHowMany == 49
            return 843027916
        elseif inHowMany == 50
            return 1282238151
        end
    elseif num == 42
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 10
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 46
        elseif inHowMany == 10
            return 60
        elseif inHowMany == 11
            return 104
        elseif inHowMany == 12
            return 174
        elseif inHowMany == 13
            return 226
        elseif inHowMany == 14
            return 376
        elseif inHowMany == 15
            return 564
        elseif inHowMany == 16
            return 804
        elseif inHowMany == 17
            return 1298
        elseif inHowMany == 18
            return 1928
        elseif inHowMany == 19
            return 3042
        elseif inHowMany == 20
            return 4452
        elseif inHowMany == 21
            return 6585
        elseif inHowMany == 22
            return 10743
        elseif inHowMany == 23
            return 15642
        elseif inHowMany == 24
            return 23639
        elseif inHowMany == 25
            return 36669
        elseif inHowMany == 26
            return 54511
        elseif inHowMany == 27
            return 84640
        elseif inHowMany == 28
            return 126510
        elseif inHowMany == 29
            return 192580
        elseif inHowMany == 30
            return 297140
        elseif inHowMany == 31
            return 439786
        elseif inHowMany == 32
            return 679903
        elseif inHowMany == 33
            return 1033429
        elseif inHowMany == 34
            return 1551507
        elseif inHowMany == 35
            return 2386184
        elseif inHowMany == 36
            return 3586733
        elseif inHowMany == 37
            return 5483706
        elseif inHowMany == 38
            return 8341317
        elseif inHowMany == 39
            return 12554287
        elseif inHowMany == 40
            return 19278962
        elseif inHowMany == 41
            return 29094582
        elseif inHowMany == 42
            return 44173494
        elseif inHowMany == 43
            return 67461727
        elseif inHowMany == 44
            return 101793210
        elseif inHowMany == 45
            return 155388606
        elseif inHowMany == 46
            return 235554920
        elseif inHowMany == 47
            return 357210061
        elseif inHowMany == 48
            return 545029327
        elseif inHowMany == 49
            return 823866382
        elseif inHowMany == 50
            return 1254513380
        end
    elseif num == 43
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 9
        elseif inHowMany == 7
            return 18
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 53
        elseif inHowMany == 10
            return 65
        elseif inHowMany == 11
            return 99
        elseif inHowMany == 12
            return 161
        elseif inHowMany == 13
            return 229
        elseif inHowMany == 14
            return 397
        elseif inHowMany == 15
            return 563
        elseif inHowMany == 16
            return 791
        elseif inHowMany == 17
            return 1279
        elseif inHowMany == 18
            return 1938
        elseif inHowMany == 19
            return 3097
        elseif inHowMany == 20
            return 4463
        elseif inHowMany == 21
            return 6551
        elseif inHowMany == 22
            return 10640
        elseif inHowMany == 23
            return 15635
        elseif inHowMany == 24
            return 23936
        elseif inHowMany == 25
            return 36671
        elseif inHowMany == 26
            return 54238
        elseif inHowMany == 27
            return 84622
        elseif inHowMany == 28
            return 126614
        elseif inHowMany == 29
            return 193412
        elseif inHowMany == 30
            return 296955
        elseif inHowMany == 31
            return 439287
        elseif inHowMany == 32
            return 680787
        elseif inHowMany == 33
            return 1032341
        elseif inHowMany == 34
            return 1555145
        elseif inHowMany == 35
            return 2388901
        elseif inHowMany == 36
            return 3583205
        elseif inHowMany == 37
            return 5488676
        elseif inHowMany == 38
            return 8341493
        elseif inHowMany == 39
            return 12571025
        elseif inHowMany == 40
            return 19293689
        elseif inHowMany == 41
            return 29078238
        elseif inHowMany == 42
            return 44225592
        elseif inHowMany == 43
            return 67481830
        elseif inHowMany == 44
            return 101840087
        elseif inHowMany == 45
            return 155537623
        elseif inHowMany == 46
            return 235547280
        elseif inHowMany == 47
            return 357485672
        elseif inHowMany == 48
            return 545275566
        elseif inHowMany == 49
            return 824184402
        elseif inHowMany == 50
            return 1255628048
        end
    elseif num == 44
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 4
        elseif inHowMany == 4
            return 8
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 8
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 32
        elseif inHowMany == 9
            return 54
        elseif inHowMany == 10
            return 60
        elseif inHowMany == 11
            return 94
        elseif inHowMany == 12
            return 164
        elseif inHowMany == 13
            return 230
        elseif inHowMany == 14
            return 390
        elseif inHowMany == 15
            return 538
        elseif inHowMany == 16
            return 780
        elseif inHowMany == 17
            return 1274
        elseif inHowMany == 18
            return 1902
        elseif inHowMany == 19
            return 3082
        elseif inHowMany == 20
            return 4364
        elseif inHowMany == 21
            return 6408
        elseif inHowMany == 22
            return 10560
        elseif inHowMany == 23
            return 15442
        elseif inHowMany == 24
            return 23640
        elseif inHowMany == 25
            return 35914
        elseif inHowMany == 26
            return 53338
        elseif inHowMany == 27
            return 83988
        elseif inHowMany == 28
            return 124470
        elseif inHowMany == 29
            return 190504
        elseif inHowMany == 30
            return 292924
        elseif inHowMany == 31
            return 432112
        elseif inHowMany == 32
            return 672384
        elseif inHowMany == 33
            return 1016382
        elseif inHowMany == 34
            return 1533110
        elseif inHowMany == 35
            return 2356238
        elseif inHowMany == 36
            return 3523646
        elseif inHowMany == 37
            return 5418866
        elseif inHowMany == 38
            return 8221790
        elseif inHowMany == 39
            return 12377988
        elseif inHowMany == 40
            return 19030768
        elseif inHowMany == 41
            return 28633274
        elseif inHowMany == 42
            return 43615600
        elseif inHowMany == 43
            return 66511968
        elseif inHowMany == 44
            return 100299900
        elseif inHowMany == 45
            return 153419424
        elseif inHowMany == 46
            return 232009340
        elseif inHowMany == 47
            return 352339684
        elseif inHowMany == 48
            return 537630816
        elseif inHowMany == 49
            return 811850822
        elseif inHowMany == 50
            return 1237973210
        end
    elseif num == 45
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 49
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 92
        elseif inHowMany == 12
            return 149
        elseif inHowMany == 13
            return 224
        elseif inHowMany == 14
            return 358
        elseif inHowMany == 15
            return 492
        elseif inHowMany == 16
            return 773
        elseif inHowMany == 17
            return 1234
        elseif inHowMany == 18
            return 1759
        elseif inHowMany == 19
            return 2801
        elseif inHowMany == 20
            return 4158
        elseif inHowMany == 21
            return 6257
        elseif inHowMany == 22
            return 9809
        elseif inHowMany == 23
            return 14396
        elseif inHowMany == 24
            return 22447
        elseif inHowMany == 25
            return 33804
        elseif inHowMany == 26
            return 50491
        elseif inHowMany == 27
            return 79084
        elseif inHowMany == 28
            return 117396
        elseif inHowMany == 29
            return 179460
        elseif inHowMany == 30
            return 274583
        elseif inHowMany == 31
            return 410601
        elseif inHowMany == 32
            return 634383
        elseif inHowMany == 33
            return 953030
        elseif inHowMany == 34
            return 1448360
        elseif inHowMany == 35
            return 2220748
        elseif inHowMany == 36
            return 3327408
        elseif inHowMany == 37
            return 5105579
        elseif inHowMany == 38
            return 7737514
        elseif inHowMany == 39
            return 11698993
        elseif inHowMany == 40
            return 17912218
        elseif inHowMany == 41
            return 26995096
        elseif inHowMany == 42
            return 41183616
        elseif inHowMany == 43
            return 62609780
        elseif inHowMany == 44
            return 94618432
        elseif inHowMany == 45
            return 144607409
        elseif inHowMany == 46
            return 218732877
        elseif inHowMany == 47
            return 332440765
        elseif inHowMany == 48
            return 506263928
        elseif inHowMany == 49
            return 765870530
        elseif inHowMany == 50
            return 1167390785
        end
    elseif num == 46
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 49
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 101
        elseif inHowMany == 12
            return 150
        elseif inHowMany == 13
            return 218
        elseif inHowMany == 14
            return 378
        elseif inHowMany == 15
            return 519
        elseif inHowMany == 16
            return 791
        elseif inHowMany == 17
            return 1237
        elseif inHowMany == 18
            return 1822
        elseif inHowMany == 19
            return 2972
        elseif inHowMany == 20
            return 4215
        elseif inHowMany == 21
            return 6397
        elseif inHowMany == 22
            return 10197
        elseif inHowMany == 23
            return 14773
        elseif inHowMany == 24
            return 23191
        elseif inHowMany == 25
            return 34772
        elseif inHowMany == 26
            return 52138
        elseif inHowMany == 27
            return 81642
        elseif inHowMany == 28
            return 120211
        elseif inHowMany == 29
            return 186123
        elseif inHowMany == 30
            return 283165
        elseif inHowMany == 31
            return 421213
        elseif inHowMany == 32
            return 655812
        elseif inHowMany == 33
            return 981308
        elseif inHowMany == 34
            return 1494460
        elseif inHowMany == 35
            return 2288478
        elseif inHowMany == 36
            return 3423722
        elseif inHowMany == 37
            return 5277288
        elseif inHowMany == 38
            return 7960883
        elseif inHowMany == 39
            return 12055373
        elseif inHowMany == 40
            return 18493863
        elseif inHowMany == 41
            return 27780807
        elseif inHowMany == 42
            return 42483781
        elseif inHowMany == 43
            return 64516699
        elseif inHowMany == 44
            return 97505227
        elseif inHowMany == 45
            return 149192756
        elseif inHowMany == 46
            return 225186515
        elseif inHowMany == 47
            return 342877275
        elseif inHowMany == 48
            return 521949455
        elseif inHowMany == 49
            return 788840043
        elseif inHowMany == 50
            return 1204152645
        end
    elseif num == 47
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 49
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 99
        elseif inHowMany == 12
            return 154
        elseif inHowMany == 13
            return 221
        elseif inHowMany == 14
            return 363
        elseif inHowMany == 15
            return 511
        elseif inHowMany == 16
            return 803
        elseif inHowMany == 17
            return 1239
        elseif inHowMany == 18
            return 1783
        elseif inHowMany == 19
            return 2910
        elseif inHowMany == 20
            return 4247
        elseif inHowMany == 21
            return 6369
        elseif inHowMany == 22
            return 10042
        elseif inHowMany == 23
            return 14715
        elseif inHowMany == 24
            return 22990
        elseif inHowMany == 25
            return 34466
        elseif inHowMany == 26
            return 51740
        elseif inHowMany == 27
            return 81028
        elseif inHowMany == 28
            return 119489
        elseif inHowMany == 29
            return 183924
        elseif inHowMany == 30
            return 281100
        elseif inHowMany == 31
            return 419308
        elseif inHowMany == 32
            return 649132
        elseif inHowMany == 33
            return 973586
        elseif inHowMany == 34
            return 1482992
        elseif inHowMany == 35
            return 2270326
        elseif inHowMany == 36
            return 3398920
        elseif inHowMany == 37
            return 5229311
        elseif inHowMany == 38
            return 7905678
        elseif inHowMany == 39
            return 11960898
        elseif inHowMany == 40
            return 18329405
        elseif inHowMany == 41
            return 27590381
        elseif inHowMany == 42
            return 42135889
        elseif inHowMany == 43
            return 63998340
        elseif inHowMany == 44
            return 96754935
        elseif inHowMany == 45
            return 147961127
        elseif inHowMany == 46
            return 223534231
        elseif inHowMany == 47
            return 340062367
        elseif inHowMany == 48
            return 517754808
        elseif inHowMany == 49
            return 782957926
        elseif inHowMany == 50
            return 1194184302
        end
    elseif num == 48
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 11
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 49
        elseif inHowMany == 10
            return 61
        elseif inHowMany == 11
            return 95
        elseif inHowMany == 12
            return 151
        elseif inHowMany == 13
            return 218
        elseif inHowMany == 14
            return 356
        elseif inHowMany == 15
            return 508
        elseif inHowMany == 16
            return 783
        elseif inHowMany == 17
            return 1215
        elseif inHowMany == 18
            return 1763
        elseif inHowMany == 19
            return 2863
        elseif inHowMany == 20
            return 4193
        elseif inHowMany == 21
            return 6238
        elseif inHowMany == 22
            return 9860
        elseif inHowMany == 23
            return 14519
        elseif inHowMany == 24
            return 22558
        elseif inHowMany == 25
            return 33975
        elseif inHowMany == 26
            return 50881
        elseif inHowMany == 27
            return 79519
        elseif inHowMany == 28
            return 117769
        elseif inHowMany == 29
            return 180735
        elseif inHowMany == 30
            return 276645
        elseif inHowMany == 31
            return 412445
        elseif inHowMany == 32
            return 637362
        elseif inHowMany == 33
            return 959087
        elseif inHowMany == 34
            return 1457769
        elseif inHowMany == 35
            return 2232336
        elseif inHowMany == 36
            return 3345345
        elseif inHowMany == 37
            return 5137846
        elseif inHowMany == 38
            return 7780642
        elseif inHowMany == 39
            return 11762484
        elseif inHowMany == 40
            return 18020591
        elseif inHowMany == 41
            return 27152345
        elseif inHowMany == 42
            return 41412947
        elseif inHowMany == 43
            return 62960470
        elseif inHowMany == 44
            return 95177961
        elseif inHowMany == 45
            return 145457402
        elseif inHowMany == 46
            return 219938966
        elseif inHowMany == 47
            return 334355667
        elseif inHowMany == 48
            return 509226178
        elseif inHowMany == 49
            return 770215005
        elseif inHowMany == 50
            return 1174092474
        end
    elseif num == 49
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 49
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 101
        elseif inHowMany == 12
            return 152
        elseif inHowMany == 13
            return 218
        elseif inHowMany == 14
            return 378
        elseif inHowMany == 15
            return 531
        elseif inHowMany == 16
            return 809
        elseif inHowMany == 17
            return 1223
        elseif inHowMany == 18
            return 1805
        elseif inHowMany == 19
            return 3009
        elseif inHowMany == 20
            return 4313
        elseif inHowMany == 21
            return 6420
        elseif inHowMany == 22
            return 10168
        elseif inHowMany == 23
            return 14938
        elseif inHowMany == 24
            return 23437
        elseif inHowMany == 25
            return 35016
        elseif inHowMany == 26
            return 52462
        elseif inHowMany == 27
            return 82118
        elseif inHowMany == 28
            return 121055
        elseif inHowMany == 29
            return 187366
        elseif inHowMany == 30
            return 285636
        elseif inHowMany == 31
            return 424614
        elseif inHowMany == 32
            return 659010
        elseif inHowMany == 33
            return 988369
        elseif inHowMany == 34
            return 1506920
        elseif inHowMany == 35
            return 2304471
        elseif inHowMany == 36
            return 3447271
        elseif inHowMany == 37
            return 5312250
        elseif inHowMany == 38
            return 8021389
        elseif inHowMany == 39
            return 12142709
        elseif inHowMany == 40
            return 18617914
        elseif inHowMany == 41
            return 27992431
        elseif inHowMany == 42
            return 42778237
        elseif inHowMany == 43
            return 64961657
        elseif inHowMany == 44
            return 98224196
        elseif inHowMany == 45
            return 150247581
        elseif inHowMany == 46
            return 226816605
        elseif inHowMany == 47
            return 345261923
        elseif inHowMany == 48
            return 525645621
        elseif inHowMany == 49
            return 794653125
        elseif inHowMany == 50
            return 1212520900
        end
    elseif num == 50
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 25
        elseif inHowMany == 9
            return 38
        elseif inHowMany == 10
            return 52
        elseif inHowMany == 11
            return 84
        elseif inHowMany == 12
            return 129
        elseif inHowMany == 13
            return 190
        elseif inHowMany == 14
            return 273
        elseif inHowMany == 15
            return 423
        elseif inHowMany == 16
            return 711
        elseif inHowMany == 17
            return 1015
        elseif inHowMany == 18
            return 1475
        elseif inHowMany == 19
            return 2319
        elseif inHowMany == 20
            return 3522
        elseif inHowMany == 21
            return 5430
        elseif inHowMany == 22
            return 8101
        elseif inHowMany == 23
            return 12277
        elseif inHowMany == 24
            return 18895
        elseif inHowMany == 25
            return 28190
        elseif inHowMany == 26
            return 43600
        elseif inHowMany == 27
            return 66255
        elseif inHowMany == 28
            return 98887
        elseif inHowMany == 29
            return 151932
        elseif inHowMany == 30
            return 230252
        elseif inHowMany == 31
            return 350996
        elseif inHowMany == 32
            return 532702
        elseif inHowMany == 33
            return 802471
        elseif inHowMany == 34
            return 1231754
        elseif inHowMany == 35
            return 1862596
        elseif inHowMany == 36
            return 2823710
        elseif inHowMany == 37
            return 4312445
        elseif inHowMany == 38
            return 6513027
        elseif inHowMany == 39
            return 9924215
        elseif inHowMany == 40
            return 15066602
        elseif inHowMany == 41
            return 22852737
        elseif inHowMany == 42
            return 34833963
        elseif inHowMany == 43
            return 52687592
        elseif inHowMany == 44
            return 80180790
        elseif inHowMany == 45
            return 121944502
        elseif inHowMany == 46
            return 184725542
        elseif inHowMany == 47
            return 281272189
        elseif inHowMany == 48
            return 426597298
        elseif inHowMany == 49
            return 648059424
        elseif inHowMany == 50
            return 985506685
        end
    elseif num == 51
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 71
        elseif inHowMany == 11
            return 107
        elseif inHowMany == 12
            return 148
        elseif inHowMany == 13
            return 219
        elseif inHowMany == 14
            return 363
        elseif inHowMany == 15
            return 551
        elseif inHowMany == 16
            return 801
        elseif inHowMany == 17
            return 1264
        elseif inHowMany == 18
            return 1867
        elseif inHowMany == 19
            return 2806
        elseif inHowMany == 20
            return 4353
        elseif inHowMany == 21
            return 6625
        elseif inHowMany == 22
            return 10131
        elseif inHowMany == 23
            return 14943
        elseif inHowMany == 24
            return 22970
        elseif inHowMany == 25
            return 35625
        elseif inHowMany == 26
            return 52987
        elseif inHowMany == 27
            return 80816
        elseif inHowMany == 28
            return 122885
        elseif inHowMany == 29
            return 186339
        elseif inHowMany == 30
            return 284572
        elseif inHowMany == 31
            return 429056
        elseif inHowMany == 32
            return 655823
        elseif inHowMany == 33
            return 994788
        elseif inHowMany == 34
            return 1501772
        elseif inHowMany == 35
            return 2300754
        elseif inHowMany == 36
            return 3481884
        elseif inHowMany == 37
            return 5282554
        elseif inHowMany == 38
            return 8040835
        elseif inHowMany == 39
            return 12179767
        elseif inHowMany == 40
            return 18571112
        elseif inHowMany == 41
            return 28136606
        elseif inHowMany == 42
            return 42709612
        elseif inHowMany == 43
            return 65066104
        elseif inHowMany == 44
            return 98515287
        elseif inHowMany == 45
            return 149895032
        elseif inHowMany == 46
            return 227729473
        elseif inHowMany == 47
            return 345419701
        elseif inHowMany == 48
            return 525562825
        elseif inHowMany == 49
            return 797047624
        elseif inHowMany == 50
            return 1211655726
        end
    elseif num == 52
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 41
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 102
        elseif inHowMany == 12
            return 159
        elseif inHowMany == 13
            return 220
        elseif inHowMany == 14
            return 344
        elseif inHowMany == 15
            return 518
        elseif inHowMany == 16
            return 797
        elseif inHowMany == 17
            return 1258
        elseif inHowMany == 18
            return 1785
        elseif inHowMany == 19
            return 2761
        elseif inHowMany == 20
            return 4246
        elseif inHowMany == 21
            return 6434
        elseif inHowMany == 22
            return 9992
        elseif inHowMany == 23
            return 14596
        elseif inHowMany == 24
            return 22446
        elseif inHowMany == 25
            return 34559
        elseif inHowMany == 26
            return 51664
        elseif inHowMany == 27
            return 79736
        elseif inHowMany == 28
            return 119436
        elseif inHowMany == 29
            return 181536
        elseif inHowMany == 30
            return 278799
        elseif inHowMany == 31
            return 418275
        elseif inHowMany == 32
            return 641902
        elseif inHowMany == 33
            return 970077
        elseif inHowMany == 34
            return 1466757
        elseif inHowMany == 35
            return 2250694
        elseif inHowMany == 36
            return 3390495
        elseif inHowMany == 37
            return 5170419
        elseif inHowMany == 38
            return 7857041
        elseif inHowMany == 39
            return 11875292
        elseif inHowMany == 40
            return 18160412
        elseif inHowMany == 41
            return 27456404
        elseif inHowMany == 42
            return 41741510
        elseif inHowMany == 43
            return 63559539
        elseif inHowMany == 44
            return 96111742
        elseif inHowMany == 45
            return 146576591
        elseif inHowMany == 46
            return 222278457
        elseif inHowMany == 47
            return 337311142
        elseif inHowMany == 48
            return 513662439
        elseif inHowMany == 49
            return 777886090
        elseif inHowMany == 50
            return 1183930955
        end
    elseif num == 53
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 18
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 48
        elseif inHowMany == 10
            return 67
        elseif inHowMany == 11
            return 97
        elseif inHowMany == 12
            return 146
        elseif inHowMany == 13
            return 223
        elseif inHowMany == 14
            return 365
        elseif inHowMany == 15
            return 517
        elseif inHowMany == 16
            return 784
        elseif inHowMany == 17
            return 1239
        elseif inHowMany == 18
            return 1795
        elseif inHowMany == 19
            return 2816
        elseif inHowMany == 20
            return 4257
        elseif inHowMany == 21
            return 6400
        elseif inHowMany == 22
            return 9889
        elseif inHowMany == 23
            return 14589
        elseif inHowMany == 24
            return 22743
        elseif inHowMany == 25
            return 34561
        elseif inHowMany == 26
            return 51391
        elseif inHowMany == 27
            return 79718
        elseif inHowMany == 28
            return 119540
        elseif inHowMany == 29
            return 182368
        elseif inHowMany == 30
            return 278614
        elseif inHowMany == 31
            return 417776
        elseif inHowMany == 32
            return 642786
        elseif inHowMany == 33
            return 968989
        elseif inHowMany == 34
            return 1470395
        elseif inHowMany == 35
            return 2253411
        elseif inHowMany == 36
            return 3386967
        elseif inHowMany == 37
            return 5175389
        elseif inHowMany == 38
            return 7857217
        elseif inHowMany == 39
            return 11892030
        elseif inHowMany == 40
            return 18175139
        elseif inHowMany == 41
            return 27440060
        elseif inHowMany == 42
            return 41793608
        elseif inHowMany == 43
            return 63579642
        elseif inHowMany == 44
            return 96158619
        elseif inHowMany == 45
            return 146725608
        elseif inHowMany == 46
            return 222270817
        elseif inHowMany == 47
            return 337586753
        elseif inHowMany == 48
            return 513908678
        elseif inHowMany == 49
            return 778204110
        elseif inHowMany == 50
            return 1185045623
        end
    elseif num == 54
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 49
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 92
        elseif inHowMany == 12
            return 149
        elseif inHowMany == 13
            return 224
        elseif inHowMany == 14
            return 358
        elseif inHowMany == 15
            return 492
        elseif inHowMany == 16
            return 773
        elseif inHowMany == 17
            return 1234
        elseif inHowMany == 18
            return 1759
        elseif inHowMany == 19
            return 2801
        elseif inHowMany == 20
            return 4158
        elseif inHowMany == 21
            return 6257
        elseif inHowMany == 22
            return 9809
        elseif inHowMany == 23
            return 14396
        elseif inHowMany == 24
            return 22447
        elseif inHowMany == 25
            return 33804
        elseif inHowMany == 26
            return 50491
        elseif inHowMany == 27
            return 79084
        elseif inHowMany == 28
            return 117396
        elseif inHowMany == 29
            return 179460
        elseif inHowMany == 30
            return 274583
        elseif inHowMany == 31
            return 410601
        elseif inHowMany == 32
            return 634383
        elseif inHowMany == 33
            return 953030
        elseif inHowMany == 34
            return 1448360
        elseif inHowMany == 35
            return 2220748
        elseif inHowMany == 36
            return 3327408
        elseif inHowMany == 37
            return 5105579
        elseif inHowMany == 38
            return 7737514
        elseif inHowMany == 39
            return 11698993
        elseif inHowMany == 40
            return 17912218
        elseif inHowMany == 41
            return 26995096
        elseif inHowMany == 42
            return 41183616
        elseif inHowMany == 43
            return 62609780
        elseif inHowMany == 44
            return 94618432
        elseif inHowMany == 45
            return 144607409
        elseif inHowMany == 46
            return 218732877
        elseif inHowMany == 47
            return 332440765
        elseif inHowMany == 48
            return 506263928
        elseif inHowMany == 49
            return 765870530
        elseif inHowMany == 50
            return 1167390785
        end
    elseif num == 55
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 90
        elseif inHowMany == 12
            return 134
        elseif inHowMany == 13
            return 218
        elseif inHowMany == 14
            return 326
        elseif inHowMany == 15
            return 446
        elseif inHowMany == 16
            return 766
        elseif inHowMany == 17
            return 1194
        elseif inHowMany == 18
            return 1616
        elseif inHowMany == 19
            return 2520
        elseif inHowMany == 20
            return 3952
        elseif inHowMany == 21
            return 6106
        elseif inHowMany == 22
            return 9058
        elseif inHowMany == 23
            return 13350
        elseif inHowMany == 24
            return 21254
        elseif inHowMany == 25
            return 31694
        elseif inHowMany == 26
            return 47644
        elseif inHowMany == 27
            return 74180
        elseif inHowMany == 28
            return 110322
        elseif inHowMany == 29
            return 168416
        elseif inHowMany == 30
            return 256242
        elseif inHowMany == 31
            return 389090
        elseif inHowMany == 32
            return 596382
        elseif inHowMany == 33
            return 889678
        elseif inHowMany == 34
            return 1363610
        elseif inHowMany == 35
            return 2085258
        elseif inHowMany == 36
            return 3131170
        elseif inHowMany == 37
            return 4792292
        elseif inHowMany == 38
            return 7253238
        elseif inHowMany == 39
            return 11019998
        elseif inHowMany == 40
            return 16793668
        elseif inHowMany == 41
            return 25356918
        elseif inHowMany == 42
            return 38751632
        elseif inHowMany == 43
            return 58707592
        elseif inHowMany == 44
            return 88936964
        elseif inHowMany == 45
            return 135795394
        elseif inHowMany == 46
            return 205456414
        elseif inHowMany == 47
            return 312541846
        elseif inHowMany == 48
            return 474897040
        elseif inHowMany == 49
            return 719890238
        elseif inHowMany == 50
            return 1096808360
        end
    elseif num == 56
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 99
        elseif inHowMany == 12
            return 135
        elseif inHowMany == 13
            return 212
        elseif inHowMany == 14
            return 346
        elseif inHowMany == 15
            return 473
        elseif inHowMany == 16
            return 784
        elseif inHowMany == 17
            return 1197
        elseif inHowMany == 18
            return 1679
        elseif inHowMany == 19
            return 2691
        elseif inHowMany == 20
            return 4009
        elseif inHowMany == 21
            return 6246
        elseif inHowMany == 22
            return 9446
        elseif inHowMany == 23
            return 13727
        elseif inHowMany == 24
            return 21998
        elseif inHowMany == 25
            return 32662
        elseif inHowMany == 26
            return 49291
        elseif inHowMany == 27
            return 76738
        elseif inHowMany == 28
            return 113137
        elseif inHowMany == 29
            return 175079
        elseif inHowMany == 30
            return 264824
        elseif inHowMany == 31
            return 399702
        elseif inHowMany == 32
            return 617811
        elseif inHowMany == 33
            return 917956
        elseif inHowMany == 34
            return 1409710
        elseif inHowMany == 35
            return 2152988
        elseif inHowMany == 36
            return 3227484
        elseif inHowMany == 37
            return 4964001
        elseif inHowMany == 38
            return 7476607
        elseif inHowMany == 39
            return 11376378
        elseif inHowMany == 40
            return 17375313
        elseif inHowMany == 41
            return 26142629
        elseif inHowMany == 42
            return 40051797
        elseif inHowMany == 43
            return 60614511
        elseif inHowMany == 44
            return 91823759
        elseif inHowMany == 45
            return 140380741
        elseif inHowMany == 46
            return 211910052
        elseif inHowMany == 47
            return 322978356
        elseif inHowMany == 48
            return 490582567
        elseif inHowMany == 49
            return 742859751
        elseif inHowMany == 50
            return 1133570220
        end
    elseif num == 57
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 97
        elseif inHowMany == 12
            return 139
        elseif inHowMany == 13
            return 215
        elseif inHowMany == 14
            return 331
        elseif inHowMany == 15
            return 465
        elseif inHowMany == 16
            return 796
        elseif inHowMany == 17
            return 1199
        elseif inHowMany == 18
            return 1640
        elseif inHowMany == 19
            return 2629
        elseif inHowMany == 20
            return 4041
        elseif inHowMany == 21
            return 6218
        elseif inHowMany == 22
            return 9291
        elseif inHowMany == 23
            return 13669
        elseif inHowMany == 24
            return 21797
        elseif inHowMany == 25
            return 32356
        elseif inHowMany == 26
            return 48893
        elseif inHowMany == 27
            return 76124
        elseif inHowMany == 28
            return 112415
        elseif inHowMany == 29
            return 172880
        elseif inHowMany == 30
            return 262759
        elseif inHowMany == 31
            return 397797
        elseif inHowMany == 32
            return 611131
        elseif inHowMany == 33
            return 910234
        elseif inHowMany == 34
            return 1398242
        elseif inHowMany == 35
            return 2134836
        elseif inHowMany == 36
            return 3202682
        elseif inHowMany == 37
            return 4916024
        elseif inHowMany == 38
            return 7421402
        elseif inHowMany == 39
            return 11281903
        elseif inHowMany == 40
            return 17210855
        elseif inHowMany == 41
            return 25952203
        elseif inHowMany == 42
            return 39703905
        elseif inHowMany == 43
            return 60096152
        elseif inHowMany == 44
            return 91073467
        elseif inHowMany == 45
            return 139149112
        elseif inHowMany == 46
            return 210257768
        elseif inHowMany == 47
            return 320163448
        elseif inHowMany == 48
            return 486387920
        elseif inHowMany == 49
            return 736977634
        elseif inHowMany == 50
            return 1123601877
        end
    elseif num == 58
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 63
        elseif inHowMany == 11
            return 93
        elseif inHowMany == 12
            return 136
        elseif inHowMany == 13
            return 212
        elseif inHowMany == 14
            return 324
        elseif inHowMany == 15
            return 462
        elseif inHowMany == 16
            return 776
        elseif inHowMany == 17
            return 1175
        elseif inHowMany == 18
            return 1620
        elseif inHowMany == 19
            return 2582
        elseif inHowMany == 20
            return 3987
        elseif inHowMany == 21
            return 6087
        elseif inHowMany == 22
            return 9109
        elseif inHowMany == 23
            return 13473
        elseif inHowMany == 24
            return 21365
        elseif inHowMany == 25
            return 31865
        elseif inHowMany == 26
            return 48034
        elseif inHowMany == 27
            return 74615
        elseif inHowMany == 28
            return 110695
        elseif inHowMany == 29
            return 169691
        elseif inHowMany == 30
            return 258304
        elseif inHowMany == 31
            return 390934
        elseif inHowMany == 32
            return 599361
        elseif inHowMany == 33
            return 895735
        elseif inHowMany == 34
            return 1373019
        elseif inHowMany == 35
            return 2096846
        elseif inHowMany == 36
            return 3149107
        elseif inHowMany == 37
            return 4824559
        elseif inHowMany == 38
            return 7296366
        elseif inHowMany == 39
            return 11083489
        elseif inHowMany == 40
            return 16902041
        elseif inHowMany == 41
            return 25514167
        elseif inHowMany == 42
            return 38980963
        elseif inHowMany == 43
            return 59058282
        elseif inHowMany == 44
            return 89496493
        elseif inHowMany == 45
            return 136645387
        elseif inHowMany == 46
            return 206662503
        elseif inHowMany == 47
            return 314456748
        elseif inHowMany == 48
            return 477859290
        elseif inHowMany == 49
            return 724234713
        elseif inHowMany == 50
            return 1103510049
        end
    elseif num == 59
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 99
        elseif inHowMany == 12
            return 137
        elseif inHowMany == 13
            return 212
        elseif inHowMany == 14
            return 346
        elseif inHowMany == 15
            return 485
        elseif inHowMany == 16
            return 802
        elseif inHowMany == 17
            return 1183
        elseif inHowMany == 18
            return 1662
        elseif inHowMany == 19
            return 2728
        elseif inHowMany == 20
            return 4107
        elseif inHowMany == 21
            return 6269
        elseif inHowMany == 22
            return 9417
        elseif inHowMany == 23
            return 13892
        elseif inHowMany == 24
            return 22244
        elseif inHowMany == 25
            return 32906
        elseif inHowMany == 26
            return 49615
        elseif inHowMany == 27
            return 77214
        elseif inHowMany == 28
            return 113981
        elseif inHowMany == 29
            return 176322
        elseif inHowMany == 30
            return 267295
        elseif inHowMany == 31
            return 403103
        elseif inHowMany == 32
            return 621009
        elseif inHowMany == 33
            return 925017
        elseif inHowMany == 34
            return 1422170
        elseif inHowMany == 35
            return 2168981
        elseif inHowMany == 36
            return 3251033
        elseif inHowMany == 37
            return 4998963
        elseif inHowMany == 38
            return 7537113
        elseif inHowMany == 39
            return 11463714
        elseif inHowMany == 40
            return 17499364
        elseif inHowMany == 41
            return 26354253
        elseif inHowMany == 42
            return 40346253
        elseif inHowMany == 43
            return 61059469
        elseif inHowMany == 44
            return 92542728
        elseif inHowMany == 45
            return 141435566
        elseif inHowMany == 46
            return 213540142
        elseif inHowMany == 47
            return 325363004
        elseif inHowMany == 48
            return 494278733
        elseif inHowMany == 49
            return 748672833
        elseif inHowMany == 50
            return 1141938475
        end
    elseif num == 60
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 25
        elseif inHowMany == 9
            return 38
        elseif inHowMany == 10
            return 52
        elseif inHowMany == 11
            return 93
        elseif inHowMany == 12
            return 130
        elseif inHowMany == 13
            return 184
        elseif inHowMany == 14
            return 293
        elseif inHowMany == 15
            return 450
        elseif inHowMany == 16
            return 729
        elseif inHowMany == 17
            return 1018
        elseif inHowMany == 18
            return 1538
        elseif inHowMany == 19
            return 2490
        elseif inHowMany == 20
            return 3579
        elseif inHowMany == 21
            return 5570
        elseif inHowMany == 22
            return 8489
        elseif inHowMany == 23
            return 12654
        elseif inHowMany == 24
            return 19639
        elseif inHowMany == 25
            return 29158
        elseif inHowMany == 26
            return 45247
        elseif inHowMany == 27
            return 68813
        elseif inHowMany == 28
            return 101702
        elseif inHowMany == 29
            return 158595
        elseif inHowMany == 30
            return 238834
        elseif inHowMany == 31
            return 361608
        elseif inHowMany == 32
            return 554131
        elseif inHowMany == 33
            return 830749
        elseif inHowMany == 34
            return 1277854
        elseif inHowMany == 35
            return 1930326
        elseif inHowMany == 36
            return 2920024
        elseif inHowMany == 37
            return 4484154
        elseif inHowMany == 38
            return 6736396
        elseif inHowMany == 39
            return 10280595
        elseif inHowMany == 40
            return 15648247
        elseif inHowMany == 41
            return 23638448
        elseif inHowMany == 42
            return 36134128
        elseif inHowMany == 43
            return 54594511
        elseif inHowMany == 44
            return 83067585
        elseif inHowMany == 45
            return 126529849
        elseif inHowMany == 46
            return 191179180
        elseif inHowMany == 47
            return 291708699
        elseif inHowMany == 48
            return 442282825
        elseif inHowMany == 49
            return 671028937
        elseif inHowMany == 50
            return 1022268545
        end
    elseif num == 61
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 71
        elseif inHowMany == 11
            return 116
        elseif inHowMany == 12
            return 149
        elseif inHowMany == 13
            return 213
        elseif inHowMany == 14
            return 383
        elseif inHowMany == 15
            return 578
        elseif inHowMany == 16
            return 819
        elseif inHowMany == 17
            return 1267
        elseif inHowMany == 18
            return 1930
        elseif inHowMany == 19
            return 2977
        elseif inHowMany == 20
            return 4410
        elseif inHowMany == 21
            return 6765
        elseif inHowMany == 22
            return 10519
        elseif inHowMany == 23
            return 15320
        elseif inHowMany == 24
            return 23714
        elseif inHowMany == 25
            return 36593
        elseif inHowMany == 26
            return 54634
        elseif inHowMany == 27
            return 83374
        elseif inHowMany == 28
            return 125700
        elseif inHowMany == 29
            return 193002
        elseif inHowMany == 30
            return 293154
        elseif inHowMany == 31
            return 439668
        elseif inHowMany == 32
            return 677252
        elseif inHowMany == 33
            return 1023066
        elseif inHowMany == 34
            return 1547872
        elseif inHowMany == 35
            return 2368484
        elseif inHowMany == 36
            return 3578198
        elseif inHowMany == 37
            return 5454263
        elseif inHowMany == 38
            return 8264204
        elseif inHowMany == 39
            return 12536147
        elseif inHowMany == 40
            return 19152757
        elseif inHowMany == 41
            return 28922317
        elseif inHowMany == 42
            return 44009777
        elseif inHowMany == 43
            return 66973023
        elseif inHowMany == 44
            return 101402082
        elseif inHowMany == 45
            return 154480379
        elseif inHowMany == 46
            return 234183111
        elseif inHowMany == 47
            return 355856211
        elseif inHowMany == 48
            return 541248352
        elseif inHowMany == 49
            return 820017137
        elseif inHowMany == 50
            return 1248417586
        end
    elseif num == 62
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 41
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 111
        elseif inHowMany == 12
            return 160
        elseif inHowMany == 13
            return 214
        elseif inHowMany == 14
            return 364
        elseif inHowMany == 15
            return 545
        elseif inHowMany == 16
            return 815
        elseif inHowMany == 17
            return 1261
        elseif inHowMany == 18
            return 1848
        elseif inHowMany == 19
            return 2932
        elseif inHowMany == 20
            return 4303
        elseif inHowMany == 21
            return 6574
        elseif inHowMany == 22
            return 10380
        elseif inHowMany == 23
            return 14973
        elseif inHowMany == 24
            return 23190
        elseif inHowMany == 25
            return 35527
        elseif inHowMany == 26
            return 53311
        elseif inHowMany == 27
            return 82294
        elseif inHowMany == 28
            return 122251
        elseif inHowMany == 29
            return 188199
        elseif inHowMany == 30
            return 287381
        elseif inHowMany == 31
            return 428887
        elseif inHowMany == 32
            return 663331
        elseif inHowMany == 33
            return 998355
        elseif inHowMany == 34
            return 1512857
        elseif inHowMany == 35
            return 2318424
        elseif inHowMany == 36
            return 3486809
        elseif inHowMany == 37
            return 5342128
        elseif inHowMany == 38
            return 8080410
        elseif inHowMany == 39
            return 12231672
        elseif inHowMany == 40
            return 18742057
        elseif inHowMany == 41
            return 28242115
        elseif inHowMany == 42
            return 43041675
        elseif inHowMany == 43
            return 65466458
        elseif inHowMany == 44
            return 98998537
        elseif inHowMany == 45
            return 151161938
        elseif inHowMany == 46
            return 228732095
        elseif inHowMany == 47
            return 347747652
        elseif inHowMany == 48
            return 529347966
        elseif inHowMany == 49
            return 800855603
        elseif inHowMany == 50
            return 1220692815
        end
    elseif num == 63
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 18
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 48
        elseif inHowMany == 10
            return 67
        elseif inHowMany == 11
            return 106
        elseif inHowMany == 12
            return 147
        elseif inHowMany == 13
            return 217
        elseif inHowMany == 14
            return 385
        elseif inHowMany == 15
            return 544
        elseif inHowMany == 16
            return 802
        elseif inHowMany == 17
            return 1242
        elseif inHowMany == 18
            return 1858
        elseif inHowMany == 19
            return 2987
        elseif inHowMany == 20
            return 4314
        elseif inHowMany == 21
            return 6540
        elseif inHowMany == 22
            return 10277
        elseif inHowMany == 23
            return 14966
        elseif inHowMany == 24
            return 23487
        elseif inHowMany == 25
            return 35529
        elseif inHowMany == 26
            return 53038
        elseif inHowMany == 27
            return 82276
        elseif inHowMany == 28
            return 122355
        elseif inHowMany == 29
            return 189031
        elseif inHowMany == 30
            return 287196
        elseif inHowMany == 31
            return 428388
        elseif inHowMany == 32
            return 664215
        elseif inHowMany == 33
            return 997267
        elseif inHowMany == 34
            return 1516495
        elseif inHowMany == 35
            return 2321141
        elseif inHowMany == 36
            return 3483281
        elseif inHowMany == 37
            return 5347098
        elseif inHowMany == 38
            return 8080586
        elseif inHowMany == 39
            return 12248410
        elseif inHowMany == 40
            return 18756784
        elseif inHowMany == 41
            return 28225771
        elseif inHowMany == 42
            return 43093773
        elseif inHowMany == 43
            return 65486561
        elseif inHowMany == 44
            return 99045414
        elseif inHowMany == 45
            return 151310955
        elseif inHowMany == 46
            return 228724455
        elseif inHowMany == 47
            return 348023263
        elseif inHowMany == 48
            return 529594205
        elseif inHowMany == 49
            return 801173623
        elseif inHowMany == 50
            return 1221807483
        end
    elseif num == 64
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 49
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 101
        elseif inHowMany == 12
            return 150
        elseif inHowMany == 13
            return 218
        elseif inHowMany == 14
            return 378
        elseif inHowMany == 15
            return 519
        elseif inHowMany == 16
            return 791
        elseif inHowMany == 17
            return 1237
        elseif inHowMany == 18
            return 1822
        elseif inHowMany == 19
            return 2972
        elseif inHowMany == 20
            return 4215
        elseif inHowMany == 21
            return 6397
        elseif inHowMany == 22
            return 10197
        elseif inHowMany == 23
            return 14773
        elseif inHowMany == 24
            return 23191
        elseif inHowMany == 25
            return 34772
        elseif inHowMany == 26
            return 52138
        elseif inHowMany == 27
            return 81642
        elseif inHowMany == 28
            return 120211
        elseif inHowMany == 29
            return 186123
        elseif inHowMany == 30
            return 283165
        elseif inHowMany == 31
            return 421213
        elseif inHowMany == 32
            return 655812
        elseif inHowMany == 33
            return 981308
        elseif inHowMany == 34
            return 1494460
        elseif inHowMany == 35
            return 2288478
        elseif inHowMany == 36
            return 3423722
        elseif inHowMany == 37
            return 5277288
        elseif inHowMany == 38
            return 7960883
        elseif inHowMany == 39
            return 12055373
        elseif inHowMany == 40
            return 18493863
        elseif inHowMany == 41
            return 27780807
        elseif inHowMany == 42
            return 42483781
        elseif inHowMany == 43
            return 64516699
        elseif inHowMany == 44
            return 97505227
        elseif inHowMany == 45
            return 149192756
        elseif inHowMany == 46
            return 225186515
        elseif inHowMany == 47
            return 342877275
        elseif inHowMany == 48
            return 521949455
        elseif inHowMany == 49
            return 788840043
        elseif inHowMany == 50
            return 1204152645
        end
    elseif num == 65
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 99
        elseif inHowMany == 12
            return 135
        elseif inHowMany == 13
            return 212
        elseif inHowMany == 14
            return 346
        elseif inHowMany == 15
            return 473
        elseif inHowMany == 16
            return 784
        elseif inHowMany == 17
            return 1197
        elseif inHowMany == 18
            return 1679
        elseif inHowMany == 19
            return 2691
        elseif inHowMany == 20
            return 4009
        elseif inHowMany == 21
            return 6246
        elseif inHowMany == 22
            return 9446
        elseif inHowMany == 23
            return 13727
        elseif inHowMany == 24
            return 21998
        elseif inHowMany == 25
            return 32662
        elseif inHowMany == 26
            return 49291
        elseif inHowMany == 27
            return 76738
        elseif inHowMany == 28
            return 113137
        elseif inHowMany == 29
            return 175079
        elseif inHowMany == 30
            return 264824
        elseif inHowMany == 31
            return 399702
        elseif inHowMany == 32
            return 617811
        elseif inHowMany == 33
            return 917956
        elseif inHowMany == 34
            return 1409710
        elseif inHowMany == 35
            return 2152988
        elseif inHowMany == 36
            return 3227484
        elseif inHowMany == 37
            return 4964001
        elseif inHowMany == 38
            return 7476607
        elseif inHowMany == 39
            return 11376378
        elseif inHowMany == 40
            return 17375313
        elseif inHowMany == 41
            return 26142629
        elseif inHowMany == 42
            return 40051797
        elseif inHowMany == 43
            return 60614511
        elseif inHowMany == 44
            return 91823759
        elseif inHowMany == 45
            return 140380741
        elseif inHowMany == 46
            return 211910052
        elseif inHowMany == 47
            return 322978356
        elseif inHowMany == 48
            return 490582567
        elseif inHowMany == 49
            return 742859751
        elseif inHowMany == 50
            return 1133570220
        end
    elseif num == 66
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 108
        elseif inHowMany == 12
            return 136
        elseif inHowMany == 13
            return 206
        elseif inHowMany == 14
            return 366
        elseif inHowMany == 15
            return 500
        elseif inHowMany == 16
            return 802
        elseif inHowMany == 17
            return 1200
        elseif inHowMany == 18
            return 1742
        elseif inHowMany == 19
            return 2862
        elseif inHowMany == 20
            return 4066
        elseif inHowMany == 21
            return 6386
        elseif inHowMany == 22
            return 9834
        elseif inHowMany == 23
            return 14104
        elseif inHowMany == 24
            return 22742
        elseif inHowMany == 25
            return 33630
        elseif inHowMany == 26
            return 50938
        elseif inHowMany == 27
            return 79296
        elseif inHowMany == 28
            return 115952
        elseif inHowMany == 29
            return 181742
        elseif inHowMany == 30
            return 273406
        elseif inHowMany == 31
            return 410314
        elseif inHowMany == 32
            return 639240
        elseif inHowMany == 33
            return 946234
        elseif inHowMany == 34
            return 1455810
        elseif inHowMany == 35
            return 2220718
        elseif inHowMany == 36
            return 3323798
        elseif inHowMany == 37
            return 5135710
        elseif inHowMany == 38
            return 7699976
        elseif inHowMany == 39
            return 11732758
        elseif inHowMany == 40
            return 17956958
        elseif inHowMany == 41
            return 26928340
        elseif inHowMany == 42
            return 41351962
        elseif inHowMany == 43
            return 62521430
        elseif inHowMany == 44
            return 94710554
        elseif inHowMany == 45
            return 144966088
        elseif inHowMany == 46
            return 218363690
        elseif inHowMany == 47
            return 333414866
        elseif inHowMany == 48
            return 506268094
        elseif inHowMany == 49
            return 765829264
        elseif inHowMany == 50
            return 1170332080
        end
    elseif num == 67
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 106
        elseif inHowMany == 12
            return 140
        elseif inHowMany == 13
            return 209
        elseif inHowMany == 14
            return 351
        elseif inHowMany == 15
            return 492
        elseif inHowMany == 16
            return 814
        elseif inHowMany == 17
            return 1202
        elseif inHowMany == 18
            return 1703
        elseif inHowMany == 19
            return 2800
        elseif inHowMany == 20
            return 4098
        elseif inHowMany == 21
            return 6358
        elseif inHowMany == 22
            return 9679
        elseif inHowMany == 23
            return 14046
        elseif inHowMany == 24
            return 22541
        elseif inHowMany == 25
            return 33324
        elseif inHowMany == 26
            return 50540
        elseif inHowMany == 27
            return 78682
        elseif inHowMany == 28
            return 115230
        elseif inHowMany == 29
            return 179543
        elseif inHowMany == 30
            return 271341
        elseif inHowMany == 31
            return 408409
        elseif inHowMany == 32
            return 632560
        elseif inHowMany == 33
            return 938512
        elseif inHowMany == 34
            return 1444342
        elseif inHowMany == 35
            return 2202566
        elseif inHowMany == 36
            return 3298996
        elseif inHowMany == 37
            return 5087733
        elseif inHowMany == 38
            return 7644771
        elseif inHowMany == 39
            return 11638283
        elseif inHowMany == 40
            return 17792500
        elseif inHowMany == 41
            return 26737914
        elseif inHowMany == 42
            return 41004070
        elseif inHowMany == 43
            return 62003071
        elseif inHowMany == 44
            return 93960262
        elseif inHowMany == 45
            return 143734459
        elseif inHowMany == 46
            return 216711406
        elseif inHowMany == 47
            return 330599958
        elseif inHowMany == 48
            return 502073447
        elseif inHowMany == 49
            return 759947147
        elseif inHowMany == 50
            return 1160363737
        end
    elseif num == 68
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 63
        elseif inHowMany == 11
            return 102
        elseif inHowMany == 12
            return 137
        elseif inHowMany == 13
            return 206
        elseif inHowMany == 14
            return 344
        elseif inHowMany == 15
            return 489
        elseif inHowMany == 16
            return 794
        elseif inHowMany == 17
            return 1178
        elseif inHowMany == 18
            return 1683
        elseif inHowMany == 19
            return 2753
        elseif inHowMany == 20
            return 4044
        elseif inHowMany == 21
            return 6227
        elseif inHowMany == 22
            return 9497
        elseif inHowMany == 23
            return 13850
        elseif inHowMany == 24
            return 22109
        elseif inHowMany == 25
            return 32833
        elseif inHowMany == 26
            return 49681
        elseif inHowMany == 27
            return 77173
        elseif inHowMany == 28
            return 113510
        elseif inHowMany == 29
            return 176354
        elseif inHowMany == 30
            return 266886
        elseif inHowMany == 31
            return 401546
        elseif inHowMany == 32
            return 620790
        elseif inHowMany == 33
            return 924013
        elseif inHowMany == 34
            return 1419119
        elseif inHowMany == 35
            return 2164576
        elseif inHowMany == 36
            return 3245421
        elseif inHowMany == 37
            return 4996268
        elseif inHowMany == 38
            return 7519735
        elseif inHowMany == 39
            return 11439869
        elseif inHowMany == 40
            return 17483686
        elseif inHowMany == 41
            return 26299878
        elseif inHowMany == 42
            return 40281128
        elseif inHowMany == 43
            return 60965201
        elseif inHowMany == 44
            return 92383288
        elseif inHowMany == 45
            return 141230734
        elseif inHowMany == 46
            return 213116141
        elseif inHowMany == 47
            return 324893258
        elseif inHowMany == 48
            return 493544817
        elseif inHowMany == 49
            return 747204226
        elseif inHowMany == 50
            return 1140271909
        end
    elseif num == 69
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 108
        elseif inHowMany == 12
            return 138
        elseif inHowMany == 13
            return 206
        elseif inHowMany == 14
            return 366
        elseif inHowMany == 15
            return 512
        elseif inHowMany == 16
            return 820
        elseif inHowMany == 17
            return 1186
        elseif inHowMany == 18
            return 1725
        elseif inHowMany == 19
            return 2899
        elseif inHowMany == 20
            return 4164
        elseif inHowMany == 21
            return 6409
        elseif inHowMany == 22
            return 9805
        elseif inHowMany == 23
            return 14269
        elseif inHowMany == 24
            return 22988
        elseif inHowMany == 25
            return 33874
        elseif inHowMany == 26
            return 51262
        elseif inHowMany == 27
            return 79772
        elseif inHowMany == 28
            return 116796
        elseif inHowMany == 29
            return 182985
        elseif inHowMany == 30
            return 275877
        elseif inHowMany == 31
            return 413715
        elseif inHowMany == 32
            return 642438
        elseif inHowMany == 33
            return 953295
        elseif inHowMany == 34
            return 1468270
        elseif inHowMany == 35
            return 2236711
        elseif inHowMany == 36
            return 3347347
        elseif inHowMany == 37
            return 5170672
        elseif inHowMany == 38
            return 7760482
        elseif inHowMany == 39
            return 11820094
        elseif inHowMany == 40
            return 18081009
        elseif inHowMany == 41
            return 27139964
        elseif inHowMany == 42
            return 41646418
        elseif inHowMany == 43
            return 62966388
        elseif inHowMany == 44
            return 95429523
        elseif inHowMany == 45
            return 146020913
        elseif inHowMany == 46
            return 219993780
        elseif inHowMany == 47
            return 335799514
        elseif inHowMany == 48
            return 509964260
        elseif inHowMany == 49
            return 771642346
        elseif inHowMany == 50
            return 1178700335
        end
    elseif num == 70
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 25
        elseif inHowMany == 9
            return 38
        elseif inHowMany == 10
            return 52
        elseif inHowMany == 11
            return 91
        elseif inHowMany == 12
            return 134
        elseif inHowMany == 13
            return 187
        elseif inHowMany == 14
            return 278
        elseif inHowMany == 15
            return 442
        elseif inHowMany == 16
            return 741
        elseif inHowMany == 17
            return 1020
        elseif inHowMany == 18
            return 1499
        elseif inHowMany == 19
            return 2428
        elseif inHowMany == 20
            return 3611
        elseif inHowMany == 21
            return 5542
        elseif inHowMany == 22
            return 8334
        elseif inHowMany == 23
            return 12596
        elseif inHowMany == 24
            return 19438
        elseif inHowMany == 25
            return 28852
        elseif inHowMany == 26
            return 44849
        elseif inHowMany == 27
            return 68199
        elseif inHowMany == 28
            return 100980
        elseif inHowMany == 29
            return 156396
        elseif inHowMany == 30
            return 236769
        elseif inHowMany == 31
            return 359703
        elseif inHowMany == 32
            return 547451
        elseif inHowMany == 33
            return 823027
        elseif inHowMany == 34
            return 1266386
        elseif inHowMany == 35
            return 1912174
        elseif inHowMany == 36
            return 2895222
        elseif inHowMany == 37
            return 4436177
        elseif inHowMany == 38
            return 6681191
        elseif inHowMany == 39
            return 10186120
        elseif inHowMany == 40
            return 15483789
        elseif inHowMany == 41
            return 23448022
        elseif inHowMany == 42
            return 35786236
        elseif inHowMany == 43
            return 54076152
        elseif inHowMany == 44
            return 82317293
        elseif inHowMany == 45
            return 125298220
        elseif inHowMany == 46
            return 189526896
        elseif inHowMany == 47
            return 288893791
        elseif inHowMany == 48
            return 438088178
        elseif inHowMany == 49
            return 665146820
        elseif inHowMany == 50
            return 1012300202
        end
    elseif num == 71
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 71
        elseif inHowMany == 11
            return 114
        elseif inHowMany == 12
            return 153
        elseif inHowMany == 13
            return 216
        elseif inHowMany == 14
            return 368
        elseif inHowMany == 15
            return 570
        elseif inHowMany == 16
            return 831
        elseif inHowMany == 17
            return 1269
        elseif inHowMany == 18
            return 1891
        elseif inHowMany == 19
            return 2915
        elseif inHowMany == 20
            return 4442
        elseif inHowMany == 21
            return 6737
        elseif inHowMany == 22
            return 10364
        elseif inHowMany == 23
            return 15262
        elseif inHowMany == 24
            return 23513
        elseif inHowMany == 25
            return 36287
        elseif inHowMany == 26
            return 54236
        elseif inHowMany == 27
            return 82760
        elseif inHowMany == 28
            return 124978
        elseif inHowMany == 29
            return 190803
        elseif inHowMany == 30
            return 291089
        elseif inHowMany == 31
            return 437763
        elseif inHowMany == 32
            return 670572
        elseif inHowMany == 33
            return 1015344
        elseif inHowMany == 34
            return 1536404
        elseif inHowMany == 35
            return 2350332
        elseif inHowMany == 36
            return 3553396
        elseif inHowMany == 37
            return 5406286
        elseif inHowMany == 38
            return 8208999
        elseif inHowMany == 39
            return 12441672
        elseif inHowMany == 40
            return 18988299
        elseif inHowMany == 41
            return 28731891
        elseif inHowMany == 42
            return 43661885
        elseif inHowMany == 43
            return 66454664
        elseif inHowMany == 44
            return 100651790
        elseif inHowMany == 45
            return 153248750
        elseif inHowMany == 46
            return 232530827
        elseif inHowMany == 47
            return 353041303
        elseif inHowMany == 48
            return 537053705
        elseif inHowMany == 49
            return 814135020
        elseif inHowMany == 50
            return 1238449243
        end
    elseif num == 72
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 41
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 109
        elseif inHowMany == 12
            return 164
        elseif inHowMany == 13
            return 217
        elseif inHowMany == 14
            return 349
        elseif inHowMany == 15
            return 537
        elseif inHowMany == 16
            return 827
        elseif inHowMany == 17
            return 1263
        elseif inHowMany == 18
            return 1809
        elseif inHowMany == 19
            return 2870
        elseif inHowMany == 20
            return 4335
        elseif inHowMany == 21
            return 6546
        elseif inHowMany == 22
            return 10225
        elseif inHowMany == 23
            return 14915
        elseif inHowMany == 24
            return 22989
        elseif inHowMany == 25
            return 35221
        elseif inHowMany == 26
            return 52913
        elseif inHowMany == 27
            return 81680
        elseif inHowMany == 28
            return 121529
        elseif inHowMany == 29
            return 186000
        elseif inHowMany == 30
            return 285316
        elseif inHowMany == 31
            return 426982
        elseif inHowMany == 32
            return 656651
        elseif inHowMany == 33
            return 990633
        elseif inHowMany == 34
            return 1501389
        elseif inHowMany == 35
            return 2300272
        elseif inHowMany == 36
            return 3462007
        elseif inHowMany == 37
            return 5294151
        elseif inHowMany == 38
            return 8025205
        elseif inHowMany == 39
            return 12137197
        elseif inHowMany == 40
            return 18577599
        elseif inHowMany == 41
            return 28051689
        elseif inHowMany == 42
            return 42693783
        elseif inHowMany == 43
            return 64948099
        elseif inHowMany == 44
            return 98248245
        elseif inHowMany == 45
            return 149930309
        elseif inHowMany == 46
            return 227079811
        elseif inHowMany == 47
            return 344932744
        elseif inHowMany == 48
            return 525153319
        elseif inHowMany == 49
            return 794973486
        elseif inHowMany == 50
            return 1210724472
        end
    elseif num == 73
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 18
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 48
        elseif inHowMany == 10
            return 67
        elseif inHowMany == 11
            return 104
        elseif inHowMany == 12
            return 151
        elseif inHowMany == 13
            return 220
        elseif inHowMany == 14
            return 370
        elseif inHowMany == 15
            return 536
        elseif inHowMany == 16
            return 814
        elseif inHowMany == 17
            return 1244
        elseif inHowMany == 18
            return 1819
        elseif inHowMany == 19
            return 2925
        elseif inHowMany == 20
            return 4346
        elseif inHowMany == 21
            return 6512
        elseif inHowMany == 22
            return 10122
        elseif inHowMany == 23
            return 14908
        elseif inHowMany == 24
            return 23286
        elseif inHowMany == 25
            return 35223
        elseif inHowMany == 26
            return 52640
        elseif inHowMany == 27
            return 81662
        elseif inHowMany == 28
            return 121633
        elseif inHowMany == 29
            return 186832
        elseif inHowMany == 30
            return 285131
        elseif inHowMany == 31
            return 426483
        elseif inHowMany == 32
            return 657535
        elseif inHowMany == 33
            return 989545
        elseif inHowMany == 34
            return 1505027
        elseif inHowMany == 35
            return 2302989
        elseif inHowMany == 36
            return 3458479
        elseif inHowMany == 37
            return 5299121
        elseif inHowMany == 38
            return 8025381
        elseif inHowMany == 39
            return 12153935
        elseif inHowMany == 40
            return 18592326
        elseif inHowMany == 41
            return 28035345
        elseif inHowMany == 42
            return 42745881
        elseif inHowMany == 43
            return 64968202
        elseif inHowMany == 44
            return 98295122
        elseif inHowMany == 45
            return 150079326
        elseif inHowMany == 46
            return 227072171
        elseif inHowMany == 47
            return 345208355
        elseif inHowMany == 48
            return 525399558
        elseif inHowMany == 49
            return 795291506
        elseif inHowMany == 50
            return 1211839140
        end
    elseif num == 74
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 49
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 99
        elseif inHowMany == 12
            return 154
        elseif inHowMany == 13
            return 221
        elseif inHowMany == 14
            return 363
        elseif inHowMany == 15
            return 511
        elseif inHowMany == 16
            return 803
        elseif inHowMany == 17
            return 1239
        elseif inHowMany == 18
            return 1783
        elseif inHowMany == 19
            return 2910
        elseif inHowMany == 20
            return 4247
        elseif inHowMany == 21
            return 6369
        elseif inHowMany == 22
            return 10042
        elseif inHowMany == 23
            return 14715
        elseif inHowMany == 24
            return 22990
        elseif inHowMany == 25
            return 34466
        elseif inHowMany == 26
            return 51740
        elseif inHowMany == 27
            return 81028
        elseif inHowMany == 28
            return 119489
        elseif inHowMany == 29
            return 183924
        elseif inHowMany == 30
            return 281100
        elseif inHowMany == 31
            return 419308
        elseif inHowMany == 32
            return 649132
        elseif inHowMany == 33
            return 973586
        elseif inHowMany == 34
            return 1482992
        elseif inHowMany == 35
            return 2270326
        elseif inHowMany == 36
            return 3398920
        elseif inHowMany == 37
            return 5229311
        elseif inHowMany == 38
            return 7905678
        elseif inHowMany == 39
            return 11960898
        elseif inHowMany == 40
            return 18329405
        elseif inHowMany == 41
            return 27590381
        elseif inHowMany == 42
            return 42135889
        elseif inHowMany == 43
            return 63998340
        elseif inHowMany == 44
            return 96754935
        elseif inHowMany == 45
            return 147961127
        elseif inHowMany == 46
            return 223534231
        elseif inHowMany == 47
            return 340062367
        elseif inHowMany == 48
            return 517754808
        elseif inHowMany == 49
            return 782957926
        elseif inHowMany == 50
            return 1194184302
        end
    elseif num == 75
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 97
        elseif inHowMany == 12
            return 139
        elseif inHowMany == 13
            return 215
        elseif inHowMany == 14
            return 331
        elseif inHowMany == 15
            return 465
        elseif inHowMany == 16
            return 796
        elseif inHowMany == 17
            return 1199
        elseif inHowMany == 18
            return 1640
        elseif inHowMany == 19
            return 2629
        elseif inHowMany == 20
            return 4041
        elseif inHowMany == 21
            return 6218
        elseif inHowMany == 22
            return 9291
        elseif inHowMany == 23
            return 13669
        elseif inHowMany == 24
            return 21797
        elseif inHowMany == 25
            return 32356
        elseif inHowMany == 26
            return 48893
        elseif inHowMany == 27
            return 76124
        elseif inHowMany == 28
            return 112415
        elseif inHowMany == 29
            return 172880
        elseif inHowMany == 30
            return 262759
        elseif inHowMany == 31
            return 397797
        elseif inHowMany == 32
            return 611131
        elseif inHowMany == 33
            return 910234
        elseif inHowMany == 34
            return 1398242
        elseif inHowMany == 35
            return 2134836
        elseif inHowMany == 36
            return 3202682
        elseif inHowMany == 37
            return 4916024
        elseif inHowMany == 38
            return 7421402
        elseif inHowMany == 39
            return 11281903
        elseif inHowMany == 40
            return 17210855
        elseif inHowMany == 41
            return 25952203
        elseif inHowMany == 42
            return 39703905
        elseif inHowMany == 43
            return 60096152
        elseif inHowMany == 44
            return 91073467
        elseif inHowMany == 45
            return 139149112
        elseif inHowMany == 46
            return 210257768
        elseif inHowMany == 47
            return 320163448
        elseif inHowMany == 48
            return 486387920
        elseif inHowMany == 49
            return 736977634
        elseif inHowMany == 50
            return 1123601877
        end
    elseif num == 76
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 106
        elseif inHowMany == 12
            return 140
        elseif inHowMany == 13
            return 209
        elseif inHowMany == 14
            return 351
        elseif inHowMany == 15
            return 492
        elseif inHowMany == 16
            return 814
        elseif inHowMany == 17
            return 1202
        elseif inHowMany == 18
            return 1703
        elseif inHowMany == 19
            return 2800
        elseif inHowMany == 20
            return 4098
        elseif inHowMany == 21
            return 6358
        elseif inHowMany == 22
            return 9679
        elseif inHowMany == 23
            return 14046
        elseif inHowMany == 24
            return 22541
        elseif inHowMany == 25
            return 33324
        elseif inHowMany == 26
            return 50540
        elseif inHowMany == 27
            return 78682
        elseif inHowMany == 28
            return 115230
        elseif inHowMany == 29
            return 179543
        elseif inHowMany == 30
            return 271341
        elseif inHowMany == 31
            return 408409
        elseif inHowMany == 32
            return 632560
        elseif inHowMany == 33
            return 938512
        elseif inHowMany == 34
            return 1444342
        elseif inHowMany == 35
            return 2202566
        elseif inHowMany == 36
            return 3298996
        elseif inHowMany == 37
            return 5087733
        elseif inHowMany == 38
            return 7644771
        elseif inHowMany == 39
            return 11638283
        elseif inHowMany == 40
            return 17792500
        elseif inHowMany == 41
            return 26737914
        elseif inHowMany == 42
            return 41004070
        elseif inHowMany == 43
            return 62003071
        elseif inHowMany == 44
            return 93960262
        elseif inHowMany == 45
            return 143734459
        elseif inHowMany == 46
            return 216711406
        elseif inHowMany == 47
            return 330599958
        elseif inHowMany == 48
            return 502073447
        elseif inHowMany == 49
            return 759947147
        elseif inHowMany == 50
            return 1160363737
        end
    elseif num == 77
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 104
        elseif inHowMany == 12
            return 144
        elseif inHowMany == 13
            return 212
        elseif inHowMany == 14
            return 336
        elseif inHowMany == 15
            return 484
        elseif inHowMany == 16
            return 826
        elseif inHowMany == 17
            return 1204
        elseif inHowMany == 18
            return 1664
        elseif inHowMany == 19
            return 2738
        elseif inHowMany == 20
            return 4130
        elseif inHowMany == 21
            return 6330
        elseif inHowMany == 22
            return 9524
        elseif inHowMany == 23
            return 13988
        elseif inHowMany == 24
            return 22340
        elseif inHowMany == 25
            return 33018
        elseif inHowMany == 26
            return 50142
        elseif inHowMany == 27
            return 78068
        elseif inHowMany == 28
            return 114508
        elseif inHowMany == 29
            return 177344
        elseif inHowMany == 30
            return 269276
        elseif inHowMany == 31
            return 406504
        elseif inHowMany == 32
            return 625880
        elseif inHowMany == 33
            return 930790
        elseif inHowMany == 34
            return 1432874
        elseif inHowMany == 35
            return 2184414
        elseif inHowMany == 36
            return 3274194
        elseif inHowMany == 37
            return 5039756
        elseif inHowMany == 38
            return 7589566
        elseif inHowMany == 39
            return 11543808
        elseif inHowMany == 40
            return 17628042
        elseif inHowMany == 41
            return 26547488
        elseif inHowMany == 42
            return 40656178
        elseif inHowMany == 43
            return 61484712
        elseif inHowMany == 44
            return 93209970
        elseif inHowMany == 45
            return 142502830
        elseif inHowMany == 46
            return 215059122
        elseif inHowMany == 47
            return 327785050
        elseif inHowMany == 48
            return 497878800
        elseif inHowMany == 49
            return 754065030
        elseif inHowMany == 50
            return 1150395394
        end
    elseif num == 78
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 63
        elseif inHowMany == 11
            return 100
        elseif inHowMany == 12
            return 141
        elseif inHowMany == 13
            return 209
        elseif inHowMany == 14
            return 329
        elseif inHowMany == 15
            return 481
        elseif inHowMany == 16
            return 806
        elseif inHowMany == 17
            return 1180
        elseif inHowMany == 18
            return 1644
        elseif inHowMany == 19
            return 2691
        elseif inHowMany == 20
            return 4076
        elseif inHowMany == 21
            return 6199
        elseif inHowMany == 22
            return 9342
        elseif inHowMany == 23
            return 13792
        elseif inHowMany == 24
            return 21908
        elseif inHowMany == 25
            return 32527
        elseif inHowMany == 26
            return 49283
        elseif inHowMany == 27
            return 76559
        elseif inHowMany == 28
            return 112788
        elseif inHowMany == 29
            return 174155
        elseif inHowMany == 30
            return 264821
        elseif inHowMany == 31
            return 399641
        elseif inHowMany == 32
            return 614110
        elseif inHowMany == 33
            return 916291
        elseif inHowMany == 34
            return 1407651
        elseif inHowMany == 35
            return 2146424
        elseif inHowMany == 36
            return 3220619
        elseif inHowMany == 37
            return 4948291
        elseif inHowMany == 38
            return 7464530
        elseif inHowMany == 39
            return 11345394
        elseif inHowMany == 40
            return 17319228
        elseif inHowMany == 41
            return 26109452
        elseif inHowMany == 42
            return 39933236
        elseif inHowMany == 43
            return 60446842
        elseif inHowMany == 44
            return 91632996
        elseif inHowMany == 45
            return 139999105
        elseif inHowMany == 46
            return 211463857
        elseif inHowMany == 47
            return 322078350
        elseif inHowMany == 48
            return 489350170
        elseif inHowMany == 49
            return 741322109
        elseif inHowMany == 50
            return 1130303566
        end
    elseif num == 79
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 106
        elseif inHowMany == 12
            return 142
        elseif inHowMany == 13
            return 209
        elseif inHowMany == 14
            return 351
        elseif inHowMany == 15
            return 504
        elseif inHowMany == 16
            return 832
        elseif inHowMany == 17
            return 1188
        elseif inHowMany == 18
            return 1686
        elseif inHowMany == 19
            return 2837
        elseif inHowMany == 20
            return 4196
        elseif inHowMany == 21
            return 6381
        elseif inHowMany == 22
            return 9650
        elseif inHowMany == 23
            return 14211
        elseif inHowMany == 24
            return 22787
        elseif inHowMany == 25
            return 33568
        elseif inHowMany == 26
            return 50864
        elseif inHowMany == 27
            return 79158
        elseif inHowMany == 28
            return 116074
        elseif inHowMany == 29
            return 180786
        elseif inHowMany == 30
            return 273812
        elseif inHowMany == 31
            return 411810
        elseif inHowMany == 32
            return 635758
        elseif inHowMany == 33
            return 945573
        elseif inHowMany == 34
            return 1456802
        elseif inHowMany == 35
            return 2218559
        elseif inHowMany == 36
            return 3322545
        elseif inHowMany == 37
            return 5122695
        elseif inHowMany == 38
            return 7705277
        elseif inHowMany == 39
            return 11725619
        elseif inHowMany == 40
            return 17916551
        elseif inHowMany == 41
            return 26949538
        elseif inHowMany == 42
            return 41298526
        elseif inHowMany == 43
            return 62448029
        elseif inHowMany == 44
            return 94679231
        elseif inHowMany == 45
            return 144789284
        elseif inHowMany == 46
            return 218341496
        elseif inHowMany == 47
            return 332984606
        elseif inHowMany == 48
            return 505769613
        elseif inHowMany == 49
            return 765760229
        elseif inHowMany == 50
            return 1168731992
        end
    elseif num == 80
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 11
        elseif inHowMany == 7
            return 14
        elseif inHowMany == 8
            return 25
        elseif inHowMany == 9
            return 38
        elseif inHowMany == 10
            return 51
        elseif inHowMany == 11
            return 87
        elseif inHowMany == 12
            return 131
        elseif inHowMany == 13
            return 184
        elseif inHowMany == 14
            return 271
        elseif inHowMany == 15
            return 439
        elseif inHowMany == 16
            return 721
        elseif inHowMany == 17
            return 996
        elseif inHowMany == 18
            return 1479
        elseif inHowMany == 19
            return 2381
        elseif inHowMany == 20
            return 3557
        elseif inHowMany == 21
            return 5411
        elseif inHowMany == 22
            return 8152
        elseif inHowMany == 23
            return 12400
        elseif inHowMany == 24
            return 19006
        elseif inHowMany == 25
            return 28361
        elseif inHowMany == 26
            return 43990
        elseif inHowMany == 27
            return 66690
        elseif inHowMany == 28
            return 99260
        elseif inHowMany == 29
            return 153207
        elseif inHowMany == 30
            return 232314
        elseif inHowMany == 31
            return 352840
        elseif inHowMany == 32
            return 535681
        elseif inHowMany == 33
            return 808528
        elseif inHowMany == 34
            return 1241163
        elseif inHowMany == 35
            return 1874184
        elseif inHowMany == 36
            return 2841647
        elseif inHowMany == 37
            return 4344712
        elseif inHowMany == 38
            return 6556155
        elseif inHowMany == 39
            return 9987706
        elseif inHowMany == 40
            return 15174975
        elseif inHowMany == 41
            return 23009986
        elseif inHowMany == 42
            return 35063294
        elseif inHowMany == 43
            return 53038282
        elseif inHowMany == 44
            return 80740319
        elseif inHowMany == 45
            return 122794495
        elseif inHowMany == 46
            return 185931631
        elseif inHowMany == 47
            return 283187091
        elseif inHowMany == 48
            return 429559548
        elseif inHowMany == 49
            return 652403899
        elseif inHowMany == 50
            return 992208374
        end
    elseif num == 81
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 21
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 70
        elseif inHowMany == 11
            return 110
        elseif inHowMany == 12
            return 150
        elseif inHowMany == 13
            return 213
        elseif inHowMany == 14
            return 361
        elseif inHowMany == 15
            return 567
        elseif inHowMany == 16
            return 811
        elseif inHowMany == 17
            return 1245
        elseif inHowMany == 18
            return 1871
        elseif inHowMany == 19
            return 2868
        elseif inHowMany == 20
            return 4388
        elseif inHowMany == 21
            return 6606
        elseif inHowMany == 22
            return 10182
        elseif inHowMany == 23
            return 15066
        elseif inHowMany == 24
            return 23081
        elseif inHowMany == 25
            return 35796
        elseif inHowMany == 26
            return 53377
        elseif inHowMany == 27
            return 81251
        elseif inHowMany == 28
            return 123258
        elseif inHowMany == 29
            return 187614
        elseif inHowMany == 30
            return 286634
        elseif inHowMany == 31
            return 430900
        elseif inHowMany == 32
            return 658802
        elseif inHowMany == 33
            return 1000845
        elseif inHowMany == 34
            return 1511181
        elseif inHowMany == 35
            return 2312342
        elseif inHowMany == 36
            return 3499821
        elseif inHowMany == 37
            return 5314821
        elseif inHowMany == 38
            return 8083963
        elseif inHowMany == 39
            return 12243258
        elseif inHowMany == 40
            return 18679485
        elseif inHowMany == 41
            return 28293855
        elseif inHowMany == 42
            return 42938943
        elseif inHowMany == 43
            return 65416794
        elseif inHowMany == 44
            return 99074816
        elseif inHowMany == 45
            return 150745025
        elseif inHowMany == 46
            return 228935562
        elseif inHowMany == 47
            return 347334603
        elseif inHowMany == 48
            return 528525075
        elseif inHowMany == 49
            return 801392099
        elseif inHowMany == 50
            return 1218357415
        end
    elseif num == 82
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 19
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 41
        elseif inHowMany == 10
            return 61
        elseif inHowMany == 11
            return 105
        elseif inHowMany == 12
            return 161
        elseif inHowMany == 13
            return 214
        elseif inHowMany == 14
            return 342
        elseif inHowMany == 15
            return 534
        elseif inHowMany == 16
            return 807
        elseif inHowMany == 17
            return 1239
        elseif inHowMany == 18
            return 1789
        elseif inHowMany == 19
            return 2823
        elseif inHowMany == 20
            return 4281
        elseif inHowMany == 21
            return 6415
        elseif inHowMany == 22
            return 10043
        elseif inHowMany == 23
            return 14719
        elseif inHowMany == 24
            return 22557
        elseif inHowMany == 25
            return 34730
        elseif inHowMany == 26
            return 52054
        elseif inHowMany == 27
            return 80171
        elseif inHowMany == 28
            return 119809
        elseif inHowMany == 29
            return 182811
        elseif inHowMany == 30
            return 280861
        elseif inHowMany == 31
            return 420119
        elseif inHowMany == 32
            return 644881
        elseif inHowMany == 33
            return 976134
        elseif inHowMany == 34
            return 1476166
        elseif inHowMany == 35
            return 2262282
        elseif inHowMany == 36
            return 3408432
        elseif inHowMany == 37
            return 5202686
        elseif inHowMany == 38
            return 7900169
        elseif inHowMany == 39
            return 11938783
        elseif inHowMany == 40
            return 18268785
        elseif inHowMany == 41
            return 27613653
        elseif inHowMany == 42
            return 41970841
        elseif inHowMany == 43
            return 63910229
        elseif inHowMany == 44
            return 96671271
        elseif inHowMany == 45
            return 147426584
        elseif inHowMany == 46
            return 223484546
        elseif inHowMany == 47
            return 339226044
        elseif inHowMany == 48
            return 516624689
        elseif inHowMany == 49
            return 782230565
        elseif inHowMany == 50
            return 1190632644
        end
    elseif num == 83
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 17
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 48
        elseif inHowMany == 10
            return 66
        elseif inHowMany == 11
            return 100
        elseif inHowMany == 12
            return 148
        elseif inHowMany == 13
            return 217
        elseif inHowMany == 14
            return 363
        elseif inHowMany == 15
            return 533
        elseif inHowMany == 16
            return 794
        elseif inHowMany == 17
            return 1220
        elseif inHowMany == 18
            return 1799
        elseif inHowMany == 19
            return 2878
        elseif inHowMany == 20
            return 4292
        elseif inHowMany == 21
            return 6381
        elseif inHowMany == 22
            return 9940
        elseif inHowMany == 23
            return 14712
        elseif inHowMany == 24
            return 22854
        elseif inHowMany == 25
            return 34732
        elseif inHowMany == 26
            return 51781
        elseif inHowMany == 27
            return 80153
        elseif inHowMany == 28
            return 119913
        elseif inHowMany == 29
            return 183643
        elseif inHowMany == 30
            return 280676
        elseif inHowMany == 31
            return 419620
        elseif inHowMany == 32
            return 645765
        elseif inHowMany == 33
            return 975046
        elseif inHowMany == 34
            return 1479804
        elseif inHowMany == 35
            return 2264999
        elseif inHowMany == 36
            return 3404904
        elseif inHowMany == 37
            return 5207656
        elseif inHowMany == 38
            return 7900345
        elseif inHowMany == 39
            return 11955521
        elseif inHowMany == 40
            return 18283512
        elseif inHowMany == 41
            return 27597309
        elseif inHowMany == 42
            return 42022939
        elseif inHowMany == 43
            return 63930332
        elseif inHowMany == 44
            return 96718148
        elseif inHowMany == 45
            return 147575601
        elseif inHowMany == 46
            return 223476906
        elseif inHowMany == 47
            return 339501655
        elseif inHowMany == 48
            return 516870928
        elseif inHowMany == 49
            return 782548585
        elseif inHowMany == 50
            return 1191747312
        end
    elseif num == 84
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 11
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 49
        elseif inHowMany == 10
            return 61
        elseif inHowMany == 11
            return 95
        elseif inHowMany == 12
            return 151
        elseif inHowMany == 13
            return 218
        elseif inHowMany == 14
            return 356
        elseif inHowMany == 15
            return 508
        elseif inHowMany == 16
            return 783
        elseif inHowMany == 17
            return 1215
        elseif inHowMany == 18
            return 1763
        elseif inHowMany == 19
            return 2863
        elseif inHowMany == 20
            return 4193
        elseif inHowMany == 21
            return 6238
        elseif inHowMany == 22
            return 9860
        elseif inHowMany == 23
            return 14519
        elseif inHowMany == 24
            return 22558
        elseif inHowMany == 25
            return 33975
        elseif inHowMany == 26
            return 50881
        elseif inHowMany == 27
            return 79519
        elseif inHowMany == 28
            return 117769
        elseif inHowMany == 29
            return 180735
        elseif inHowMany == 30
            return 276645
        elseif inHowMany == 31
            return 412445
        elseif inHowMany == 32
            return 637362
        elseif inHowMany == 33
            return 959087
        elseif inHowMany == 34
            return 1457769
        elseif inHowMany == 35
            return 2232336
        elseif inHowMany == 36
            return 3345345
        elseif inHowMany == 37
            return 5137846
        elseif inHowMany == 38
            return 7780642
        elseif inHowMany == 39
            return 11762484
        elseif inHowMany == 40
            return 18020591
        elseif inHowMany == 41
            return 27152345
        elseif inHowMany == 42
            return 41412947
        elseif inHowMany == 43
            return 62960470
        elseif inHowMany == 44
            return 95177961
        elseif inHowMany == 45
            return 145457402
        elseif inHowMany == 46
            return 219938966
        elseif inHowMany == 47
            return 334355667
        elseif inHowMany == 48
            return 509226178
        elseif inHowMany == 49
            return 770215005
        elseif inHowMany == 50
            return 1174092474
        end
    elseif num == 85
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 63
        elseif inHowMany == 11
            return 93
        elseif inHowMany == 12
            return 136
        elseif inHowMany == 13
            return 212
        elseif inHowMany == 14
            return 324
        elseif inHowMany == 15
            return 462
        elseif inHowMany == 16
            return 776
        elseif inHowMany == 17
            return 1175
        elseif inHowMany == 18
            return 1620
        elseif inHowMany == 19
            return 2582
        elseif inHowMany == 20
            return 3987
        elseif inHowMany == 21
            return 6087
        elseif inHowMany == 22
            return 9109
        elseif inHowMany == 23
            return 13473
        elseif inHowMany == 24
            return 21365
        elseif inHowMany == 25
            return 31865
        elseif inHowMany == 26
            return 48034
        elseif inHowMany == 27
            return 74615
        elseif inHowMany == 28
            return 110695
        elseif inHowMany == 29
            return 169691
        elseif inHowMany == 30
            return 258304
        elseif inHowMany == 31
            return 390934
        elseif inHowMany == 32
            return 599361
        elseif inHowMany == 33
            return 895735
        elseif inHowMany == 34
            return 1373019
        elseif inHowMany == 35
            return 2096846
        elseif inHowMany == 36
            return 3149107
        elseif inHowMany == 37
            return 4824559
        elseif inHowMany == 38
            return 7296366
        elseif inHowMany == 39
            return 11083489
        elseif inHowMany == 40
            return 16902041
        elseif inHowMany == 41
            return 25514167
        elseif inHowMany == 42
            return 38980963
        elseif inHowMany == 43
            return 59058282
        elseif inHowMany == 44
            return 89496493
        elseif inHowMany == 45
            return 136645387
        elseif inHowMany == 46
            return 206662503
        elseif inHowMany == 47
            return 314456748
        elseif inHowMany == 48
            return 477859290
        elseif inHowMany == 49
            return 724234713
        elseif inHowMany == 50
            return 1103510049
        end
    elseif num == 86
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 63
        elseif inHowMany == 11
            return 102
        elseif inHowMany == 12
            return 137
        elseif inHowMany == 13
            return 206
        elseif inHowMany == 14
            return 344
        elseif inHowMany == 15
            return 489
        elseif inHowMany == 16
            return 794
        elseif inHowMany == 17
            return 1178
        elseif inHowMany == 18
            return 1683
        elseif inHowMany == 19
            return 2753
        elseif inHowMany == 20
            return 4044
        elseif inHowMany == 21
            return 6227
        elseif inHowMany == 22
            return 9497
        elseif inHowMany == 23
            return 13850
        elseif inHowMany == 24
            return 22109
        elseif inHowMany == 25
            return 32833
        elseif inHowMany == 26
            return 49681
        elseif inHowMany == 27
            return 77173
        elseif inHowMany == 28
            return 113510
        elseif inHowMany == 29
            return 176354
        elseif inHowMany == 30
            return 266886
        elseif inHowMany == 31
            return 401546
        elseif inHowMany == 32
            return 620790
        elseif inHowMany == 33
            return 924013
        elseif inHowMany == 34
            return 1419119
        elseif inHowMany == 35
            return 2164576
        elseif inHowMany == 36
            return 3245421
        elseif inHowMany == 37
            return 4996268
        elseif inHowMany == 38
            return 7519735
        elseif inHowMany == 39
            return 11439869
        elseif inHowMany == 40
            return 17483686
        elseif inHowMany == 41
            return 26299878
        elseif inHowMany == 42
            return 40281128
        elseif inHowMany == 43
            return 60965201
        elseif inHowMany == 44
            return 92383288
        elseif inHowMany == 45
            return 141230734
        elseif inHowMany == 46
            return 213116141
        elseif inHowMany == 47
            return 324893258
        elseif inHowMany == 48
            return 493544817
        elseif inHowMany == 49
            return 747204226
        elseif inHowMany == 50
            return 1140271909
        end
    elseif num == 87
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 63
        elseif inHowMany == 11
            return 100
        elseif inHowMany == 12
            return 141
        elseif inHowMany == 13
            return 209
        elseif inHowMany == 14
            return 329
        elseif inHowMany == 15
            return 481
        elseif inHowMany == 16
            return 806
        elseif inHowMany == 17
            return 1180
        elseif inHowMany == 18
            return 1644
        elseif inHowMany == 19
            return 2691
        elseif inHowMany == 20
            return 4076
        elseif inHowMany == 21
            return 6199
        elseif inHowMany == 22
            return 9342
        elseif inHowMany == 23
            return 13792
        elseif inHowMany == 24
            return 21908
        elseif inHowMany == 25
            return 32527
        elseif inHowMany == 26
            return 49283
        elseif inHowMany == 27
            return 76559
        elseif inHowMany == 28
            return 112788
        elseif inHowMany == 29
            return 174155
        elseif inHowMany == 30
            return 264821
        elseif inHowMany == 31
            return 399641
        elseif inHowMany == 32
            return 614110
        elseif inHowMany == 33
            return 916291
        elseif inHowMany == 34
            return 1407651
        elseif inHowMany == 35
            return 2146424
        elseif inHowMany == 36
            return 3220619
        elseif inHowMany == 37
            return 4948291
        elseif inHowMany == 38
            return 7464530
        elseif inHowMany == 39
            return 11345394
        elseif inHowMany == 40
            return 17319228
        elseif inHowMany == 41
            return 26109452
        elseif inHowMany == 42
            return 39933236
        elseif inHowMany == 43
            return 60446842
        elseif inHowMany == 44
            return 91632996
        elseif inHowMany == 45
            return 139999105
        elseif inHowMany == 46
            return 211463857
        elseif inHowMany == 47
            return 322078350
        elseif inHowMany == 48
            return 489350170
        elseif inHowMany == 49
            return 741322109
        elseif inHowMany == 50
            return 1130303566
        end
    elseif num == 88
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 14
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 96
        elseif inHowMany == 12
            return 138
        elseif inHowMany == 13
            return 206
        elseif inHowMany == 14
            return 322
        elseif inHowMany == 15
            return 478
        elseif inHowMany == 16
            return 786
        elseif inHowMany == 17
            return 1156
        elseif inHowMany == 18
            return 1624
        elseif inHowMany == 19
            return 2644
        elseif inHowMany == 20
            return 4022
        elseif inHowMany == 21
            return 6068
        elseif inHowMany == 22
            return 9160
        elseif inHowMany == 23
            return 13596
        elseif inHowMany == 24
            return 21476
        elseif inHowMany == 25
            return 32036
        elseif inHowMany == 26
            return 48424
        elseif inHowMany == 27
            return 75050
        elseif inHowMany == 28
            return 111068
        elseif inHowMany == 29
            return 170966
        elseif inHowMany == 30
            return 260366
        elseif inHowMany == 31
            return 392778
        elseif inHowMany == 32
            return 602340
        elseif inHowMany == 33
            return 901792
        elseif inHowMany == 34
            return 1382428
        elseif inHowMany == 35
            return 2108434
        elseif inHowMany == 36
            return 3167044
        elseif inHowMany == 37
            return 4856826
        elseif inHowMany == 38
            return 7339494
        elseif inHowMany == 39
            return 11146980
        elseif inHowMany == 40
            return 17010414
        elseif inHowMany == 41
            return 25671416
        elseif inHowMany == 42
            return 39210294
        elseif inHowMany == 43
            return 59408972
        elseif inHowMany == 44
            return 90056022
        elseif inHowMany == 45
            return 137495380
        elseif inHowMany == 46
            return 207868592
        elseif inHowMany == 47
            return 316371650
        elseif inHowMany == 48
            return 480821540
        elseif inHowMany == 49
            return 728579188
        elseif inHowMany == 50
            return 1110211738
        end
    elseif num == 89
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 63
        elseif inHowMany == 11
            return 102
        elseif inHowMany == 12
            return 139
        elseif inHowMany == 13
            return 206
        elseif inHowMany == 14
            return 344
        elseif inHowMany == 15
            return 501
        elseif inHowMany == 16
            return 812
        elseif inHowMany == 17
            return 1164
        elseif inHowMany == 18
            return 1666
        elseif inHowMany == 19
            return 2790
        elseif inHowMany == 20
            return 4142
        elseif inHowMany == 21
            return 6250
        elseif inHowMany == 22
            return 9468
        elseif inHowMany == 23
            return 14015
        elseif inHowMany == 24
            return 22355
        elseif inHowMany == 25
            return 33077
        elseif inHowMany == 26
            return 50005
        elseif inHowMany == 27
            return 77649
        elseif inHowMany == 28
            return 114354
        elseif inHowMany == 29
            return 177597
        elseif inHowMany == 30
            return 269357
        elseif inHowMany == 31
            return 404947
        elseif inHowMany == 32
            return 623988
        elseif inHowMany == 33
            return 931074
        elseif inHowMany == 34
            return 1431579
        elseif inHowMany == 35
            return 2180569
        elseif inHowMany == 36
            return 3268970
        elseif inHowMany == 37
            return 5031230
        elseif inHowMany == 38
            return 7580241
        elseif inHowMany == 39
            return 11527205
        elseif inHowMany == 40
            return 17607737
        elseif inHowMany == 41
            return 26511502
        elseif inHowMany == 42
            return 40575584
        elseif inHowMany == 43
            return 61410159
        elseif inHowMany == 44
            return 93102257
        elseif inHowMany == 45
            return 142285559
        elseif inHowMany == 46
            return 214746231
        elseif inHowMany == 47
            return 327277906
        elseif inHowMany == 48
            return 497240983
        elseif inHowMany == 49
            return 753017308
        elseif inHowMany == 50
            return 1148640164
        end
    elseif num == 90
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 25
        elseif inHowMany == 9
            return 38
        elseif inHowMany == 10
            return 52
        elseif inHowMany == 11
            return 93
        elseif inHowMany == 12
            return 132
        elseif inHowMany == 13
            return 184
        elseif inHowMany == 14
            return 293
        elseif inHowMany == 15
            return 462
        elseif inHowMany == 16
            return 747
        elseif inHowMany == 17
            return 1004
        elseif inHowMany == 18
            return 1521
        elseif inHowMany == 19
            return 2527
        elseif inHowMany == 20
            return 3677
        elseif inHowMany == 21
            return 5593
        elseif inHowMany == 22
            return 8460
        elseif inHowMany == 23
            return 12819
        elseif inHowMany == 24
            return 19885
        elseif inHowMany == 25
            return 29402
        elseif inHowMany == 26
            return 45571
        elseif inHowMany == 27
            return 69289
        elseif inHowMany == 28
            return 102546
        elseif inHowMany == 29
            return 159838
        elseif inHowMany == 30
            return 241305
        elseif inHowMany == 31
            return 365009
        elseif inHowMany == 32
            return 557329
        elseif inHowMany == 33
            return 837810
        elseif inHowMany == 34
            return 1290314
        elseif inHowMany == 35
            return 1946319
        elseif inHowMany == 36
            return 2943573
        elseif inHowMany == 37
            return 4519116
        elseif inHowMany == 38
            return 6796902
        elseif inHowMany == 39
            return 10367931
        elseif inHowMany == 40
            return 15772298
        elseif inHowMany == 41
            return 23850072
        elseif inHowMany == 42
            return 36428584
        elseif inHowMany == 43
            return 55039469
        elseif inHowMany == 44
            return 83786554
        elseif inHowMany == 45
            return 127584674
        elseif inHowMany == 46
            return 192809270
        elseif inHowMany == 47
            return 294093347
        elseif inHowMany == 48
            return 445978991
        elseif inHowMany == 49
            return 676842019
        elseif inHowMany == 50
            return 1030636800
        end
    elseif num == 91
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 22
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 42
        elseif inHowMany == 10
            return 71
        elseif inHowMany == 11
            return 116
        elseif inHowMany == 12
            return 151
        elseif inHowMany == 13
            return 213
        elseif inHowMany == 14
            return 383
        elseif inHowMany == 15
            return 590
        elseif inHowMany == 16
            return 837
        elseif inHowMany == 17
            return 1253
        elseif inHowMany == 18
            return 1913
        elseif inHowMany == 19
            return 3014
        elseif inHowMany == 20
            return 4508
        elseif inHowMany == 21
            return 6788
        elseif inHowMany == 22
            return 10490
        elseif inHowMany == 23
            return 15485
        elseif inHowMany == 24
            return 23960
        elseif inHowMany == 25
            return 36837
        elseif inHowMany == 26
            return 54958
        elseif inHowMany == 27
            return 83850
        elseif inHowMany == 28
            return 126544
        elseif inHowMany == 29
            return 194245
        elseif inHowMany == 30
            return 295625
        elseif inHowMany == 31
            return 443069
        elseif inHowMany == 32
            return 680450
        elseif inHowMany == 33
            return 1030127
        elseif inHowMany == 34
            return 1560332
        elseif inHowMany == 35
            return 2384477
        elseif inHowMany == 36
            return 3601747
        elseif inHowMany == 37
            return 5489225
        elseif inHowMany == 38
            return 8324710
        elseif inHowMany == 39
            return 12623483
        elseif inHowMany == 40
            return 19276808
        elseif inHowMany == 41
            return 29133941
        elseif inHowMany == 42
            return 44304233
        elseif inHowMany == 43
            return 67417981
        elseif inHowMany == 44
            return 102121051
        elseif inHowMany == 45
            return 155535204
        elseif inHowMany == 46
            return 235813201
        elseif inHowMany == 47
            return 358240859
        elseif inHowMany == 48
            return 544944518
        elseif inHowMany == 49
            return 825830219
        elseif inHowMany == 50
            return 1256785841
        end
    elseif num == 92
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 14
        elseif inHowMany == 7
            return 20
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 41
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 111
        elseif inHowMany == 12
            return 162
        elseif inHowMany == 13
            return 214
        elseif inHowMany == 14
            return 364
        elseif inHowMany == 15
            return 557
        elseif inHowMany == 16
            return 833
        elseif inHowMany == 17
            return 1247
        elseif inHowMany == 18
            return 1831
        elseif inHowMany == 19
            return 2969
        elseif inHowMany == 20
            return 4401
        elseif inHowMany == 21
            return 6597
        elseif inHowMany == 22
            return 10351
        elseif inHowMany == 23
            return 15138
        elseif inHowMany == 24
            return 23436
        elseif inHowMany == 25
            return 35771
        elseif inHowMany == 26
            return 53635
        elseif inHowMany == 27
            return 82770
        elseif inHowMany == 28
            return 123095
        elseif inHowMany == 29
            return 189442
        elseif inHowMany == 30
            return 289852
        elseif inHowMany == 31
            return 432288
        elseif inHowMany == 32
            return 666529
        elseif inHowMany == 33
            return 1005416
        elseif inHowMany == 34
            return 1525317
        elseif inHowMany == 35
            return 2334417
        elseif inHowMany == 36
            return 3510358
        elseif inHowMany == 37
            return 5377090
        elseif inHowMany == 38
            return 8140916
        elseif inHowMany == 39
            return 12319008
        elseif inHowMany == 40
            return 18866108
        elseif inHowMany == 41
            return 28453739
        elseif inHowMany == 42
            return 43336131
        elseif inHowMany == 43
            return 65911416
        elseif inHowMany == 44
            return 99717506
        elseif inHowMany == 45
            return 152216763
        elseif inHowMany == 46
            return 230362185
        elseif inHowMany == 47
            return 350132300
        elseif inHowMany == 48
            return 533044132
        elseif inHowMany == 49
            return 806668685
        elseif inHowMany == 50
            return 1229061070
        end
    elseif num == 93
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 13
        elseif inHowMany == 7
            return 18
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 48
        elseif inHowMany == 10
            return 67
        elseif inHowMany == 11
            return 106
        elseif inHowMany == 12
            return 149
        elseif inHowMany == 13
            return 217
        elseif inHowMany == 14
            return 385
        elseif inHowMany == 15
            return 556
        elseif inHowMany == 16
            return 820
        elseif inHowMany == 17
            return 1228
        elseif inHowMany == 18
            return 1841
        elseif inHowMany == 19
            return 3024
        elseif inHowMany == 20
            return 4412
        elseif inHowMany == 21
            return 6563
        elseif inHowMany == 22
            return 10248
        elseif inHowMany == 23
            return 15131
        elseif inHowMany == 24
            return 23733
        elseif inHowMany == 25
            return 35773
        elseif inHowMany == 26
            return 53362
        elseif inHowMany == 27
            return 82752
        elseif inHowMany == 28
            return 123199
        elseif inHowMany == 29
            return 190274
        elseif inHowMany == 30
            return 289667
        elseif inHowMany == 31
            return 431789
        elseif inHowMany == 32
            return 667413
        elseif inHowMany == 33
            return 1004328
        elseif inHowMany == 34
            return 1528955
        elseif inHowMany == 35
            return 2337134
        elseif inHowMany == 36
            return 3506830
        elseif inHowMany == 37
            return 5382060
        elseif inHowMany == 38
            return 8141092
        elseif inHowMany == 39
            return 12335746
        elseif inHowMany == 40
            return 18880835
        elseif inHowMany == 41
            return 28437395
        elseif inHowMany == 42
            return 43388229
        elseif inHowMany == 43
            return 65931519
        elseif inHowMany == 44
            return 99764383
        elseif inHowMany == 45
            return 152365780
        elseif inHowMany == 46
            return 230354545
        elseif inHowMany == 47
            return 350407911
        elseif inHowMany == 48
            return 533290371
        elseif inHowMany == 49
            return 806986705
        elseif inHowMany == 50
            return 1230175738
        end
    elseif num == 94
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 3
        elseif inHowMany == 4
            return 6
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 12
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 27
        elseif inHowMany == 9
            return 49
        elseif inHowMany == 10
            return 62
        elseif inHowMany == 11
            return 101
        elseif inHowMany == 12
            return 152
        elseif inHowMany == 13
            return 218
        elseif inHowMany == 14
            return 378
        elseif inHowMany == 15
            return 531
        elseif inHowMany == 16
            return 809
        elseif inHowMany == 17
            return 1223
        elseif inHowMany == 18
            return 1805
        elseif inHowMany == 19
            return 3009
        elseif inHowMany == 20
            return 4313
        elseif inHowMany == 21
            return 6420
        elseif inHowMany == 22
            return 10168
        elseif inHowMany == 23
            return 14938
        elseif inHowMany == 24
            return 23437
        elseif inHowMany == 25
            return 35016
        elseif inHowMany == 26
            return 52462
        elseif inHowMany == 27
            return 82118
        elseif inHowMany == 28
            return 121055
        elseif inHowMany == 29
            return 187366
        elseif inHowMany == 30
            return 285636
        elseif inHowMany == 31
            return 424614
        elseif inHowMany == 32
            return 659010
        elseif inHowMany == 33
            return 988369
        elseif inHowMany == 34
            return 1506920
        elseif inHowMany == 35
            return 2304471
        elseif inHowMany == 36
            return 3447271
        elseif inHowMany == 37
            return 5312250
        elseif inHowMany == 38
            return 8021389
        elseif inHowMany == 39
            return 12142709
        elseif inHowMany == 40
            return 18617914
        elseif inHowMany == 41
            return 27992431
        elseif inHowMany == 42
            return 42778237
        elseif inHowMany == 43
            return 64961657
        elseif inHowMany == 44
            return 98224196
        elseif inHowMany == 45
            return 150247581
        elseif inHowMany == 46
            return 226816605
        elseif inHowMany == 47
            return 345261923
        elseif inHowMany == 48
            return 525645621
        elseif inHowMany == 49
            return 794653125
        elseif inHowMany == 50
            return 1212520900
        end
    elseif num == 95
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 99
        elseif inHowMany == 12
            return 137
        elseif inHowMany == 13
            return 212
        elseif inHowMany == 14
            return 346
        elseif inHowMany == 15
            return 485
        elseif inHowMany == 16
            return 802
        elseif inHowMany == 17
            return 1183
        elseif inHowMany == 18
            return 1662
        elseif inHowMany == 19
            return 2728
        elseif inHowMany == 20
            return 4107
        elseif inHowMany == 21
            return 6269
        elseif inHowMany == 22
            return 9417
        elseif inHowMany == 23
            return 13892
        elseif inHowMany == 24
            return 22244
        elseif inHowMany == 25
            return 32906
        elseif inHowMany == 26
            return 49615
        elseif inHowMany == 27
            return 77214
        elseif inHowMany == 28
            return 113981
        elseif inHowMany == 29
            return 176322
        elseif inHowMany == 30
            return 267295
        elseif inHowMany == 31
            return 403103
        elseif inHowMany == 32
            return 621009
        elseif inHowMany == 33
            return 925017
        elseif inHowMany == 34
            return 1422170
        elseif inHowMany == 35
            return 2168981
        elseif inHowMany == 36
            return 3251033
        elseif inHowMany == 37
            return 4998963
        elseif inHowMany == 38
            return 7537113
        elseif inHowMany == 39
            return 11463714
        elseif inHowMany == 40
            return 17499364
        elseif inHowMany == 41
            return 26354253
        elseif inHowMany == 42
            return 40346253
        elseif inHowMany == 43
            return 61059469
        elseif inHowMany == 44
            return 92542728
        elseif inHowMany == 45
            return 141435566
        elseif inHowMany == 46
            return 213540142
        elseif inHowMany == 47
            return 325363004
        elseif inHowMany == 48
            return 494278733
        elseif inHowMany == 49
            return 748672833
        elseif inHowMany == 50
            return 1141938475
        end
    elseif num == 96
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 108
        elseif inHowMany == 12
            return 138
        elseif inHowMany == 13
            return 206
        elseif inHowMany == 14
            return 366
        elseif inHowMany == 15
            return 512
        elseif inHowMany == 16
            return 820
        elseif inHowMany == 17
            return 1186
        elseif inHowMany == 18
            return 1725
        elseif inHowMany == 19
            return 2899
        elseif inHowMany == 20
            return 4164
        elseif inHowMany == 21
            return 6409
        elseif inHowMany == 22
            return 9805
        elseif inHowMany == 23
            return 14269
        elseif inHowMany == 24
            return 22988
        elseif inHowMany == 25
            return 33874
        elseif inHowMany == 26
            return 51262
        elseif inHowMany == 27
            return 79772
        elseif inHowMany == 28
            return 116796
        elseif inHowMany == 29
            return 182985
        elseif inHowMany == 30
            return 275877
        elseif inHowMany == 31
            return 413715
        elseif inHowMany == 32
            return 642438
        elseif inHowMany == 33
            return 953295
        elseif inHowMany == 34
            return 1468270
        elseif inHowMany == 35
            return 2236711
        elseif inHowMany == 36
            return 3347347
        elseif inHowMany == 37
            return 5170672
        elseif inHowMany == 38
            return 7760482
        elseif inHowMany == 39
            return 11820094
        elseif inHowMany == 40
            return 18081009
        elseif inHowMany == 41
            return 27139964
        elseif inHowMany == 42
            return 41646418
        elseif inHowMany == 43
            return 62966388
        elseif inHowMany == 44
            return 95429523
        elseif inHowMany == 45
            return 146020913
        elseif inHowMany == 46
            return 219993780
        elseif inHowMany == 47
            return 335799514
        elseif inHowMany == 48
            return 509964260
        elseif inHowMany == 49
            return 771642346
        elseif inHowMany == 50
            return 1178700335
        end
    elseif num == 97
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 106
        elseif inHowMany == 12
            return 142
        elseif inHowMany == 13
            return 209
        elseif inHowMany == 14
            return 351
        elseif inHowMany == 15
            return 504
        elseif inHowMany == 16
            return 832
        elseif inHowMany == 17
            return 1188
        elseif inHowMany == 18
            return 1686
        elseif inHowMany == 19
            return 2837
        elseif inHowMany == 20
            return 4196
        elseif inHowMany == 21
            return 6381
        elseif inHowMany == 22
            return 9650
        elseif inHowMany == 23
            return 14211
        elseif inHowMany == 24
            return 22787
        elseif inHowMany == 25
            return 33568
        elseif inHowMany == 26
            return 50864
        elseif inHowMany == 27
            return 79158
        elseif inHowMany == 28
            return 116074
        elseif inHowMany == 29
            return 180786
        elseif inHowMany == 30
            return 273812
        elseif inHowMany == 31
            return 411810
        elseif inHowMany == 32
            return 635758
        elseif inHowMany == 33
            return 945573
        elseif inHowMany == 34
            return 1456802
        elseif inHowMany == 35
            return 2218559
        elseif inHowMany == 36
            return 3322545
        elseif inHowMany == 37
            return 5122695
        elseif inHowMany == 38
            return 7705277
        elseif inHowMany == 39
            return 11725619
        elseif inHowMany == 40
            return 17916551
        elseif inHowMany == 41
            return 26949538
        elseif inHowMany == 42
            return 41298526
        elseif inHowMany == 43
            return 62448029
        elseif inHowMany == 44
            return 94679231
        elseif inHowMany == 45
            return 144789284
        elseif inHowMany == 46
            return 218341496
        elseif inHowMany == 47
            return 332984606
        elseif inHowMany == 48
            return 505769613
        elseif inHowMany == 49
            return 765760229
        elseif inHowMany == 50
            return 1168731992
        end
    elseif num == 98
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 15
        elseif inHowMany == 7
            return 15
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 63
        elseif inHowMany == 11
            return 102
        elseif inHowMany == 12
            return 139
        elseif inHowMany == 13
            return 206
        elseif inHowMany == 14
            return 344
        elseif inHowMany == 15
            return 501
        elseif inHowMany == 16
            return 812
        elseif inHowMany == 17
            return 1164
        elseif inHowMany == 18
            return 1666
        elseif inHowMany == 19
            return 2790
        elseif inHowMany == 20
            return 4142
        elseif inHowMany == 21
            return 6250
        elseif inHowMany == 22
            return 9468
        elseif inHowMany == 23
            return 14015
        elseif inHowMany == 24
            return 22355
        elseif inHowMany == 25
            return 33077
        elseif inHowMany == 26
            return 50005
        elseif inHowMany == 27
            return 77649
        elseif inHowMany == 28
            return 114354
        elseif inHowMany == 29
            return 177597
        elseif inHowMany == 30
            return 269357
        elseif inHowMany == 31
            return 404947
        elseif inHowMany == 32
            return 623988
        elseif inHowMany == 33
            return 931074
        elseif inHowMany == 34
            return 1431579
        elseif inHowMany == 35
            return 2180569
        elseif inHowMany == 36
            return 3268970
        elseif inHowMany == 37
            return 5031230
        elseif inHowMany == 38
            return 7580241
        elseif inHowMany == 39
            return 11527205
        elseif inHowMany == 40
            return 17607737
        elseif inHowMany == 41
            return 26511502
        elseif inHowMany == 42
            return 40575584
        elseif inHowMany == 43
            return 61410159
        elseif inHowMany == 44
            return 93102257
        elseif inHowMany == 45
            return 142285559
        elseif inHowMany == 46
            return 214746231
        elseif inHowMany == 47
            return 327277906
        elseif inHowMany == 48
            return 497240983
        elseif inHowMany == 49
            return 753017308
        elseif inHowMany == 50
            return 1148640164
        end
    elseif num == 99
        if inHowMany == 1
            return 2
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 8
        elseif inHowMany == 6
            return 16
        elseif inHowMany == 7
            return 16
        elseif inHowMany == 8
            return 22
        elseif inHowMany == 9
            return 44
        elseif inHowMany == 10
            return 64
        elseif inHowMany == 11
            return 108
        elseif inHowMany == 12
            return 140
        elseif inHowMany == 13
            return 206
        elseif inHowMany == 14
            return 366
        elseif inHowMany == 15
            return 524
        elseif inHowMany == 16
            return 838
        elseif inHowMany == 17
            return 1172
        elseif inHowMany == 18
            return 1708
        elseif inHowMany == 19
            return 2936
        elseif inHowMany == 20
            return 4262
        elseif inHowMany == 21
            return 6432
        elseif inHowMany == 22
            return 9776
        elseif inHowMany == 23
            return 14434
        elseif inHowMany == 24
            return 23234
        elseif inHowMany == 25
            return 34118
        elseif inHowMany == 26
            return 51586
        elseif inHowMany == 27
            return 80248
        elseif inHowMany == 28
            return 117640
        elseif inHowMany == 29
            return 184228
        elseif inHowMany == 30
            return 278348
        elseif inHowMany == 31
            return 417116
        elseif inHowMany == 32
            return 645636
        elseif inHowMany == 33
            return 960356
        elseif inHowMany == 34
            return 1480730
        elseif inHowMany == 35
            return 2252704
        elseif inHowMany == 36
            return 3370896
        elseif inHowMany == 37
            return 5205634
        elseif inHowMany == 38
            return 7820988
        elseif inHowMany == 39
            return 11907430
        elseif inHowMany == 40
            return 18205060
        elseif inHowMany == 41
            return 27351588
        elseif inHowMany == 42
            return 41940874
        elseif inHowMany == 43
            return 63411346
        elseif inHowMany == 44
            return 96148492
        elseif inHowMany == 45
            return 147075738
        elseif inHowMany == 46
            return 221623870
        elseif inHowMany == 47
            return 338184162
        elseif inHowMany == 48
            return 513660426
        elseif inHowMany == 49
            return 777455428
        elseif inHowMany == 50
            return 1187068590
        end
    elseif num == 100
        if inHowMany == 1
            return 1
        elseif inHowMany == 2
            return 2
        elseif inHowMany == 3
            return 2
        elseif inHowMany == 4
            return 4
        elseif inHowMany == 5
            return 4
        elseif inHowMany == 6
            return 5
        elseif inHowMany == 7
            return 8
        elseif inHowMany == 8
            return 8
        elseif inHowMany == 9
            return 15
        elseif inHowMany == 10
            return 26
        elseif inHowMany == 11
            return 48
        elseif inHowMany == 12
            return 55
        elseif inHowMany == 13
            return 82
        elseif inHowMany == 14
            return 138
        elseif inHowMany == 15
            return 205
        elseif inHowMany == 16
            return 328
        elseif inHowMany == 17
            return 445
        elseif inHowMany == 18
            return 687
        elseif inHowMany == 19
            return 1093
        elseif inHowMany == 20
            return 1599
        elseif inHowMany == 21
            return 2585
        elseif inHowMany == 22
            return 3758
        elseif inHowMany == 23
            return 5477
        elseif inHowMany == 24
            return 8769
        elseif inHowMany == 25
            return 13127
        elseif inHowMany == 26
            return 20250
        elseif inHowMany == 27
            return 30229
        elseif inHowMany == 28
            return 45068
        elseif inHowMany == 29
            return 71295
        elseif inHowMany == 30
            return 105819
        elseif inHowMany == 31
            return 160864
        elseif inHowMany == 32
            return 246774
        elseif inHowMany == 33
            return 367858
        elseif inHowMany == 34
            return 568945
        elseif inHowMany == 35
            return 857454
        elseif inHowMany == 36
            return 1300338
        elseif inHowMany == 37
            return 1993771
        elseif inHowMany == 38
            return 2983084
        elseif inHowMany == 39
            return 4582855
        elseif inHowMany == 40
            return 6957483
        elseif inHowMany == 41
            return 10492634
        elseif inHowMany == 42
            return 16077787
        elseif inHowMany == 43
            return 24239430
        elseif inHowMany == 44
            return 36953522
        elseif inHowMany == 45
            return 56232247
        elseif inHowMany == 46
            return 84916300
        elseif inHowMany == 47
            return 129820444
        elseif inHowMany == 48
            return 196377242
        elseif inHowMany == 49
            return 298277031
        elseif inHowMany == 50
            return 454671862
        end
    end
end

# ╔═╡ d192ec04-ca46-4db9-b9f5-b27274ed9159
function blink2(value::Int, currentBlink::Int, maxBlink::Int)
    #println(value)
    if currentBlink > maxBlink
        return 1
	elseif value <= 100 && maxBlink - currentBlink < 50
		return numIn(value, 1 + maxBlink - currentBlink)
	elseif value == 0
        return blink2(1, currentBlink+1, maxBlink)
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

# ╔═╡ 23e0afd8-ba16-11ef-068d-29b597ad2d2c
function main()
    input = readline("day11_input.txt")
    println(input)
    #input = "125 17"


    #@benchmark part1(input, 25)
    
    #println(part1(input, 25))
    #println(part2(input, 75))
	f = open("tmp.txt", "w")
    for i in 0:100
		if i == 0
			write(f, "    if num == 0\n")
		else
			write(f, "    elseif num == ", string(i), "\n")
		end
		
		for j in 1:50
        	#println("    elseif num==", i)
			#println("        return ", blink(string(i), 1, 30))
			if j==1
				write(f, "        if inHowMany == 1\n")
			else
				write(f, "        elseif inHowMany == ", string(j), "\n")
			end
			write(f, "            return ", string(blink2(i, 1, j)), "\n")
		end
		write(f, "        end\n")
    end
	write(f, "    end\n")
	close(f)

end

# ╔═╡ 40406072-8c79-4090-a073-c3d56967ed1c
main()

# ╔═╡ ad39f174-7734-467e-a8c7-5526a77e1f9c
function part2(input, numBlinks)
    values = parse.(Int,split(string(input), " "))

    result = 0
    for value in values
        result += blink2(value, 1, numBlinks)
    end
    return result
end

# ╔═╡ 778a27ee-ee4c-4fe0-a66f-376983491a0c
begin
	input = readline("day11_input.txt")
    println(input)
	println(part2(input, 75))
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"

[compat]
Plots = "~1.40.8"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.2"
manifest_format = "2.0"
project_hash = "37a60a8aadbc2c69d1a38bf02e0fbdfa20784462"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.BitFlags]]
git-tree-sha1 = "0691e34b3bb8be9307330f88d1a3c3f25466c24d"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.9"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9e2a6b69137e6969bab0152632dcb3bc108c8bdd"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+1"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "a2f1c8c668c8e3cb4cca4e57a8efdb09067bb3fd"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.18.0+2"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "bce6804e5e6044c6daab27bb533d1295e4a2e759"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.6"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "PrecompileTools", "Random"]
git-tree-sha1 = "b5278586822443594ff615963b0c09755771b3e0"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.26.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "Requires", "Statistics", "TensorCore"]
git-tree-sha1 = "a1f44953f2382ebb937d60dafbe2deea4bd23249"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.10.0"

    [deps.ColorVectorSpace.extensions]
    SpecialFunctionsExt = "SpecialFunctions"

    [deps.ColorVectorSpace.weakdeps]
    SpecialFunctions = "276daf66-3868-5448-9aa4-cd146d93841b"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "362a287c3aa50601b0bc359053d5c2468f0e7ce0"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.11"

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "8ae8d32e09f0dcf42a36b90d4e17f5dd2e4c4215"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.16.0"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.ConcurrentUtilities]]
deps = ["Serialization", "Sockets"]
git-tree-sha1 = "f36e5e8fdffcb5646ea5da81495a5a7566005127"
uuid = "f0e56b4a-5159-44fe-b623-3e5288b988bb"
version = "2.4.3"

[[deps.Contour]]
git-tree-sha1 = "439e35b0b36e2e5881738abc8857bd92ad6ff9a8"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.3"

[[deps.DataAPI]]
git-tree-sha1 = "abe83f3a2f1b857aac70ef8b269080af17764bbe"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.16.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "1d0a14036acb104d9e89698bd408f63ab58cdc82"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.20"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Dbus_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "fc173b380865f70627d7dd1190dc2fce6cc105af"
uuid = "ee1fde0b-3d02-5ea6-8484-8dfef6360eab"
version = "1.14.10+0"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
git-tree-sha1 = "9e2f36d3c96a820c678f2f1f1782582fcf685bae"
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"
version = "1.9.1"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.EpollShim_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8e9441ee83492030ace98f9789a654a6d0b1f643"
uuid = "2702e6a9-849d-5ed8-8c21-79e8b8f9ee43"
version = "0.0.20230411+0"

[[deps.ExceptionUnwrapping]]
deps = ["Test"]
git-tree-sha1 = "d36f682e590a83d63d1c7dbd287573764682d12a"
uuid = "460bff9d-24e4-43bc-9d9f-a8973cb893f4"
version = "0.1.11"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1c6317308b9dc757616f0b5cb379db10494443a7"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.6.2+0"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "466d45dc38e15794ec7d5d63ec03d776a9aff36e"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.4+1"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Zlib_jll"]
git-tree-sha1 = "db16beca600632c95fc8aca29890d83788dd8b23"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.96+0"

[[deps.Format]]
git-tree-sha1 = "9c68794ef81b08086aeb32eeaf33531668d5f5fc"
uuid = "1fa38f19-a742-5d3f-a2b9-30dd87b9d5f8"
version = "1.3.7"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "5c1d8ae0efc6c2e7b1fc502cbe25def8f661b7bc"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.13.2+0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1ed150b39aebcc805c26b93a8d0122c940f64ce2"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.14+0"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll", "libdecor_jll", "xkbcommon_jll"]
git-tree-sha1 = "532f9126ad901533af1d4f5c198867227a7bb077"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.4.0+1"

[[deps.GR]]
deps = ["Artifacts", "Base64", "DelimitedFiles", "Downloads", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Preferences", "Printf", "Qt6Wayland_jll", "Random", "Serialization", "Sockets", "TOML", "Tar", "Test", "p7zip_jll"]
git-tree-sha1 = "629693584cef594c3f6f99e76e7a7ad17e60e8d5"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.73.7"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "FreeType2_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Qt6Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "a8863b69c2a0859f2c2c87ebdc4c6712e88bdf0d"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.73.7+0"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Zlib_jll"]
git-tree-sha1 = "7c82e6a6cd34e9d935e9aa4051b66c6ff3af59ba"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.80.2+0"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "ConcurrentUtilities", "Dates", "ExceptionUnwrapping", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "PrecompileTools", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "627fcacdb7cb51dc67f557e1598cdffe4dda386d"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.10.14"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll"]
git-tree-sha1 = "401e4f3f30f43af2c8478fc008da50096ea5240f"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "8.3.1+0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.JLFzf]]
deps = ["Pipe", "REPL", "Random", "fzf_jll"]
git-tree-sha1 = "39d64b09147620f5ffbf6b2d3255be3c901bec63"
uuid = "1019f520-868f-41f5-a6de-eb00f4b6a39c"
version = "0.1.8"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "be3dc50a92e5a386872a493a10050136d4703f9b"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.6.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c84a835e1a09b289ffcd2271bf2a337bbdda6637"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "3.0.3+0"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "170b660facf5df5de098d866564877e119141cbd"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.2+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[deps.LLVMOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e16271d212accd09d52ee0ae98956b8a05c4b626"
uuid = "1d63c593-3942-5779-bab2-d838dc0a180e"
version = "17.0.6+0"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "70c5da094887fd2cae843b8db33920bac4b6f07d"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.2+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "50901ebc375ed41dbf8058da26f9de442febbbec"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.1"

[[deps.Latexify]]
deps = ["Format", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Requires"]
git-tree-sha1 = "ce5f5621cac23a86011836badfedf664a612cee4"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.5"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SparseArraysExt = "SparseArrays"
    SymEngineExt = "SymEngine"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.6.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.7.2+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll"]
git-tree-sha1 = "9fd170c4bbfd8b935fdc5f8b7aa33532c991a673"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.11+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "6f73d1dd803986947b2c750138528a999a6c7733"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.6.0+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "fbb1f2bef882392312feb1ede3615ddc1e9b99ed"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.49.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "f9557a255370125b405568f9767d6d195822a175"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.17.0+0"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "0c4f9c4f1a50d8f35048fa0532dabbadf702f81e"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.40.1+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "XZ_jll", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "2da088d113af58221c52828a80378e16be7d037a"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.5.1+1"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "5ee6203157c120d79034c748a2acba45b82b8807"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.40.1+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "a2d09619db4e765091ee5c6ffe8872849de0feea"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.28"

    [deps.LogExpFunctions.extensions]
    LogExpFunctionsChainRulesCoreExt = "ChainRulesCore"
    LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
    LogExpFunctionsInverseFunctionsExt = "InverseFunctions"

    [deps.LogExpFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ChangesOfVariables = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "f02b56007b064fbfddb4c9cd60161b6dd0f40df3"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.1.0"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "2fa9ee3e63fd3a4f7a9a4f4744a52f4856de82df"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.13"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "NetworkOptions", "Random", "Sockets"]
git-tree-sha1 = "c067a280ddc25f196b5e7df3877c6b226d390aaf"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.9"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.6+0"

[[deps.Measures]]
git-tree-sha1 = "c13304c81eec1ed3af7fc20e75fb6b26092a1102"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.2"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "ec4f7fbeab05d7747bdf98eb74d130a2a2ed298d"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.2.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.12.12"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "0877504529a3e5c3343c6f8b4c0381e57e4387e4"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.2"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+2"

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "38cb508d080d21dc1128f7fb04f20387ed4c0af4"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.4.3"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "7493f61f55a6cce7325f197443aa80d32554ba10"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.0.15+1"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6703a85cb3781bd5909d48730a67205f3f31a575"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.3+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "12f1439c4f986bb868acda6ea33ebc78e19b95ad"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.7.0"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.42.0+1"

[[deps.Pango_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "FriBidi_jll", "Glib_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e127b609fb9ecba6f201ba7ab753d5a605d53801"
uuid = "36c8627f-9965-5494-a995-c6b170f724f3"
version = "1.54.1+0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pipe]]
git-tree-sha1 = "6842804e7867b115ca9de748a0cf6b364523c16d"
uuid = "b98c9c47-44ae-5843-9183-064241ee97a0"
version = "1.3.0"

[[deps.Pixman_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "LLVMOpenMP_jll", "Libdl"]
git-tree-sha1 = "35621f10a7531bc8fa58f74610b1bfb70a3cfc6b"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.43.4+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.11.0"
weakdeps = ["REPL"]

    [deps.Pkg.extensions]
    REPLExt = "REPL"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Statistics"]
git-tree-sha1 = "6e55c6841ce3411ccb3457ee52fc48cb698d6fb0"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.2.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "PrecompileTools", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "7b1a9df27f072ac4c9c7cbe5efb198489258d1f5"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.4.1"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "JLFzf", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "PrecompileTools", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "RelocatableFolders", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "TOML", "UUIDs", "UnicodeFun", "UnitfulLatexify", "Unzip"]
git-tree-sha1 = "45470145863035bb124ca51b320ed35d071cc6c2"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.40.8"

    [deps.Plots.extensions]
    FileIOExt = "FileIO"
    GeometryBasicsExt = "GeometryBasics"
    IJuliaExt = "IJulia"
    ImageInTerminalExt = "ImageInTerminal"
    UnitfulExt = "Unitful"

    [deps.Plots.weakdeps]
    FileIO = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
    GeometryBasics = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
    IJulia = "7073ff75-c697-5162-941a-fcdaad2a7d2a"
    ImageInTerminal = "d8c32880-2388-543b-8c61-d9f865259254"
    Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

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

[[deps.Qt6Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Vulkan_Loader_jll", "Xorg_libSM_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_cursor_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "libinput_jll", "xkbcommon_jll"]
git-tree-sha1 = "492601870742dcd38f233b23c3ec629628c1d724"
uuid = "c0090381-4147-56d7-9ebc-da0b1113ec56"
version = "6.7.1+1"

[[deps.Qt6Declarative_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Qt6Base_jll", "Qt6ShaderTools_jll"]
git-tree-sha1 = "e5dd466bf2569fe08c91a2cc29c1003f4797ac3b"
uuid = "629bc702-f1f5-5709-abd5-49b8460ea067"
version = "6.7.1+2"

[[deps.Qt6ShaderTools_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Qt6Base_jll"]
git-tree-sha1 = "1a180aeced866700d4bebc3120ea1451201f16bc"
uuid = "ce943373-25bb-56aa-8eca-768745ed7b5a"
version = "6.7.1+1"

[[deps.Qt6Wayland_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Qt6Base_jll", "Qt6Declarative_jll"]
git-tree-sha1 = "729927532d48cf79f49070341e1d918a65aba6b0"
uuid = "e99dba38-086e-5de3-a5b1-6e4c66e897c3"
version = "6.7.1+1"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "StyledStrings", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.RecipesBase]]
deps = ["PrecompileTools"]
git-tree-sha1 = "5c3d09cc4f31f5fc6af001c250bf1278733100ff"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.4"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "PrecompileTools", "RecipesBase"]
git-tree-sha1 = "45cf9fd0ca5839d06ef333c8201714e888486342"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.6.12"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "ffdaf70d81cf6ff22c2b6e733c900c3321cab864"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "1.0.1"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "3bac05bc7e74a75fd9cba4295cde4045d9fe2386"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.2.1"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "f305871d2f381d21527c770d4788c06c097c9bc1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.2.0"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"
version = "1.11.0"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "66e0a8e672a0bdfca2c3f5937efb8538b9ddc085"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.2.1"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.11.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"
weakdeps = ["SparseArrays"]

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1ff449ad350c9c4cbc756624d6f8a8c3ef56d3ed"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.7.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "5cf7606d6cef84b543b483848d4ae08ad9832b21"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.34.3"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.7.0+0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.TranscodingStreams]]
git-tree-sha1 = "0c45878dcfdcfa8480052b6ab162cdd138781742"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.11.3"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.Unitful]]
deps = ["Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "d95fe458f26209c66a187b1114df96fd70839efd"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.21.0"

    [deps.Unitful.extensions]
    ConstructionBaseUnitfulExt = "ConstructionBase"
    InverseFunctionsUnitfulExt = "InverseFunctions"

    [deps.Unitful.weakdeps]
    ConstructionBase = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.UnitfulLatexify]]
deps = ["LaTeXStrings", "Latexify", "Unitful"]
git-tree-sha1 = "975c354fcd5f7e1ddcc1f1a23e6e091d99e99bc8"
uuid = "45397f5d-5981-4c77-b2b3-fc36d6e9b728"
version = "1.6.4"

[[deps.Unzip]]
git-tree-sha1 = "ca0969166a028236229f63514992fc073799bb78"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.2.0"

[[deps.Vulkan_Loader_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Wayland_jll", "Xorg_libX11_jll", "Xorg_libXrandr_jll", "xkbcommon_jll"]
git-tree-sha1 = "2f0486047a07670caad3a81a075d2e518acc5c59"
uuid = "a44049a8-05dd-5a78-86c9-5fde0876e88c"
version = "1.3.243+0"

[[deps.Wayland_jll]]
deps = ["Artifacts", "EpollShim_jll", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "7558e29847e99bc3f04d6569e82d0f5c54460703"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.21.0+1"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "93f43ab61b16ddfb2fd3bb13b3ce241cafb0e6c9"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.31.0+0"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Zlib_jll"]
git-tree-sha1 = "1165b0443d0eca63ac1e32b8c0eb69ed2f4f8127"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.13.3+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "a54ee957f4c86b526460a720dbc882fa5edcbefc"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.41+0"

[[deps.XZ_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "ac88fb95ae6447c8dda6a5503f3bafd496ae8632"
uuid = "ffd25f8a-64ca-5728-b0f7-c24cf3aae800"
version = "5.4.6+0"

[[deps.Xorg_libICE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "326b4fea307b0b39892b3e85fa451692eda8d46c"
uuid = "f67eecfb-183a-506d-b269-f58e52b52d7c"
version = "1.1.1+0"

[[deps.Xorg_libSM_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libICE_jll"]
git-tree-sha1 = "3796722887072218eabafb494a13c963209754ce"
uuid = "c834827a-8449-5923-a945-d239c165b7dd"
version = "1.2.4+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "afead5aba5aa507ad5a3bf01f58f82c8d1403495"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.8.6+0"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6035850dcc70518ca32f012e46015b9beeda49d8"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.11+0"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "34d526d318358a859d7de23da945578e8e8727b7"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.4+0"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "d2d1a5c49fae4ba39983f63de6afcbea47194e85"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.6+0"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "47e45cd78224c53109495b3e324df0c37bb61fbe"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.11+0"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8fdda4c692503d44d04a0603d9ac0982054635f9"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.1+0"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "bcd466676fef0878338c61e655629fa7bbc69d8e"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.17.0+0"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "730eeca102434283c50ccf7d1ecdadf521a765a4"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.2+0"

[[deps.Xorg_xcb_util_cursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_jll", "Xorg_xcb_util_renderutil_jll"]
git-tree-sha1 = "04341cb870f29dcd5e39055f895c39d016e18ccd"
uuid = "e920d4aa-a673-5f3a-b3d7-f755a4d47c43"
version = "0.1.4+0"

[[deps.Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[deps.Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "330f955bc41bb8f5270a369c473fc4a5a4e4d3cb"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.6+0"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "691634e5453ad362044e2ad653e79f3ee3bb98c3"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.39.0+0"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e92a1a012a10506618f10b7047e478403a046c77"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.5.0+0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e678132f07ddb5bfa46857f0d7620fb9be675d3b"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.6+0"

[[deps.eudev_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "gperf_jll"]
git-tree-sha1 = "431b678a28ebb559d224c0b6b6d01afce87c51ba"
uuid = "35ca27e7-8b34-5b7f-bca9-bdc33f59eb06"
version = "3.2.9+0"

[[deps.fzf_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "936081b536ae4aa65415d869287d43ef3cb576b2"
uuid = "214eeab7-80f7-51ab-84ad-2988db7cef09"
version = "0.53.0+0"

[[deps.gperf_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3516a5630f741c9eecb3720b1ec9d8edc3ecc033"
uuid = "1a1c6b14-54f6-533d-8383-74cd7377aa70"
version = "3.1.1+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1827acba325fdcdf1d2647fc8d5301dd9ba43a9d"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.9.0+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "e17c115d55c5fbb7e52ebedb427a0dca79d4484e"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.2+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"

[[deps.libdecor_jll]]
deps = ["Artifacts", "Dbus_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pango_jll", "Wayland_jll", "xkbcommon_jll"]
git-tree-sha1 = "9bf7903af251d2050b467f76bdbe57ce541f7f4f"
uuid = "1183f4f0-6f2a-5f1a-908b-139f9cdfea6f"
version = "0.2.2+0"

[[deps.libevdev_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "141fe65dc3efabb0b1d5ba74e91f6ad26f84cc22"
uuid = "2db6ffa8-e38f-5e21-84af-90c45d0032cc"
version = "1.11.0+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8a22cf860a7d27e4f3498a0fe0811a7957badb38"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.3+0"

[[deps.libinput_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "eudev_jll", "libevdev_jll", "mtdev_jll"]
git-tree-sha1 = "ad50e5b90f222cfe78aa3d5183a20a12de1322ce"
uuid = "36db933b-70db-51c0-b978-0f229ee0e533"
version = "1.18.0+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "d7015d2e18a5fd9a4f47de711837e980519781a4"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.43+1"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "490376214c4721cdaca654041f635213c6165cb3"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+2"

[[deps.mtdev_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "814e154bdb7be91d78b6802843f76b6ece642f11"
uuid = "009596ad-96f7-51b1-9f1b-5ce2d5e8a71e"
version = "1.1.6+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.59.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "9c304562909ab2bab0262639bd4f444d7bc2be37"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "1.4.1+1"
"""

# ╔═╡ Cell order:
# ╠═001332ef-583d-4647-8f30-0f6f2476d15b
# ╠═5cd87641-46df-4fcd-94b8-e8476106abd3
# ╠═40406072-8c79-4090-a073-c3d56967ed1c
# ╠═6f45ae9d-30aa-41fc-a088-c9dbb620986d
# ╠═778a27ee-ee4c-4fe0-a66f-376983491a0c
# ╠═23e0afd8-ba16-11ef-068d-29b597ad2d2c
# ╠═c9cc049c-4fb1-47e4-939e-ad2aca1bd143
# ╠═b2535a7f-6d58-4428-85cf-57ff78e3c5fb
# ╠═f082ee1d-9bb2-42b9-85c0-14d78481079a
# ╠═d192ec04-ca46-4db9-b9f5-b27274ed9159
# ╠═c3418f6a-b9b9-4909-8894-f958e303dc2a
# ╠═ad39f174-7734-467e-a8c7-5526a77e1f9c
# ╠═e2280d8e-26c8-4fa5-875a-c4bec2667820
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
