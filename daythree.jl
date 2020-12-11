
function counttrees(data, jinc, flag=false)
    tcount=0
    j=1
    for i in 1:length(data)
        if i==1
            continue 
        elseif flag
            if i%2==0
                continue
            end
        end

        j=j+jinc
        if j > length(data[i])
            j=j-length(data[i])
        end
        if (data[i])[j] == '#'
            tcount=tcount+1
        end
    end
    return tcount
end

function run_it(data)
    println("part 1")
    println(counttrees(data,3))
    println("part 2")
    part2=counttrees(data,1)*counttrees(data,3)*counttrees(data,5)*counttrees(data,7)*counttrees(data,1,true)
    println(part2)
end

data=readlines("map.txt")
run_it(data)