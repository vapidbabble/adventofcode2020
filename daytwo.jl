function parseline(line)
    structure=r"(\d+)\-(\d+)\s+([a-z])\:\s+([a-z]+)"
    (pos1,pos2,searchchar,pword)=match(structure,line).captures
    return (
        parse(Int, pos1), 
        parse(Int, pos2), 
        searchchar,
        pword)
end

function parseline_a(line)
    structure=r"(\d+)\-(\d+)\s+([a-z])\:\s+([a-z]+)"
    (pos1,pos2,searchchar,pword)=match(structure,line).captures
    return (
        parse(Int, pos1), 
        parse(Int, pos2), 
        only(searchchar),
        pword)
end

#myabe usei only letter in above to get 
function isvalidpword_1(line)
    (minchar, maxchar, searchchar, pword)=parseline(line)
    charcount=length(findall(searchchar,pword))
    return (minchar <= charcount <= maxchar)
end

function isvalidpword_1a(line)
    (minchar, maxchar, searchchar, pword)=parseline_a(line)
    charcount=count(==(searchchar),pword)
    return (minchar <= charcount <= maxchar)
end

function isvalidpword_2(line)
    (pos1, pos2, searchchar, pword)=parseline(line)
 
    return ((string(pword[pos1])==searchchar) ⊻ (string(pword[pos2])==searchchar))
end 

function isvalidpword_2a(line)
    (pos1, pos2, searchchar, pword)=parseline_a(line)
 
    return ((pword[pos1]==searchchar) ⊻ (pword[pos2]==searchchar))
end

lines=readlines("passwords.txt");
println(sum(isvalidpword_1,lines))
println(sum(isvalidpword_2,lines))
