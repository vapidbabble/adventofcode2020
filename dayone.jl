using DelimitedFiles

function twonumbersum_old(a,numsum)
    for i in a
        test=numsum-i
        if test ∈ a
            println([i,test])
            return i*test
        end
    end
    return "not found"
end

function twonumbersum(a,numsum)
    n=length(a)
    for i in 1:n
        ele=a[i]
        test=numsum-ele
        if test ∈ view(a,i+1:n)
            println([ele,test])
            return ele*test
        end
    end
    return "not found"
end

function threenumbersum(a,numsum)
    n=length(a)
    for i in 1:n, j in i+1:n
        test=numsum-a[i]-a[j]
        if test ∈ view(a,j+1:n)
            println([a[i],test,a[j]])
            return a[i]*test*a[j]
        end
    end
    return "not found"
end

function threenumbersum_old(a,numsum)
    n1=n2=n3=0
    for i in a
        sum2=numsum-i
        n1=i
        for j in a
            test=sum2-j
            if test ∈ a
                n2=test
                n3=j
                println([n1,n2,n3])
                return n1*n2*n3
            end
        end
    end
    return "not found"
end