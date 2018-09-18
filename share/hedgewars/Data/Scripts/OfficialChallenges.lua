local maps = {
    ["Border,60526986531,838018718"] = "Racer Challenge #1"
    , ["Border,71022545335,-490229244"] = "Racer Challenge #2"
    , ["Border,40469748943,806689586"] = "Racer Challenge #3"
    , ["85940488650,-134869715"] = "Racer Challenge #4"
    , ["62080348735,-661895109"] = "Racer Challenge #5"
    , ["56818170733,479034891"] = "Racer Challenge #6"
    , ["Border,25372705797,1770509913"] = "Racer Challenge #7"
    , ["Border,10917540013,1902370941"] = "Racer Challenge #8"
    , ["Border,43890274319,185940363"] = "Racer Challenge #9"
    , ["Border,27870148394,751885839"] = "Racer Challenge #10"
    , ["Border,22647869226,178845011"] = "Racer Challenge #11"
    , ["Border,46954401793,706743197"] = "Racer Challenge #12"
    , ["Border,60760377667,157242054"] = "Racer Challenge #13"
    , ["Border,51825989393,-1585582638"] = "Racer Challenge #14"
    , ["81841189250,256715557"] = "Racer Challenge #15"
    , ["Border,44246064625,-528106034"] = "Racer Challenge #16"
    , ["60906776802,-1389184823"] = "Racer Challenge #17"
    , ["Border,70774747774,-534640804"] = "Racer Challenge #18"
    , ["Border,50512019610,-1839546856"] = "Racer Challenge #19"
    , ["60715683005,-281312897"] = "Racer Challenge #20"
-- tech racer
    , ["Border,19661006772,-975391975"] = "Tech Racer #1"
    , ["Border,19661306766,-975391975"] = "Tech Racer #2"
    , ["Border,19661606760,-975391975"] = "Tech Racer #3"
    , ["Border,19661906754,-975391975"] = "Tech Racer #4"
    , ["Border,19662206748,-975391975"] = "Tech Racer #5"
    , ["Border,19662506742,-975391975"] = "Tech Racer #6"
    , ["Border,19662806736,-975391975"] = "Tech Racer #7"
    , ["Border,19663106730,-975391975"] = "Tech Racer #8"
    }

-- modified Adler hash
local hashA = 0
local hashB = 0
local hashModule = 299993

function resetHash()
    hashA = 0
    hashB = 0
end

function addHashData(i)
    hashA = (hashA + i + 65536) % hashModule
    hashB = (hashB + hashA) % hashModule
end

function hashDigest()
    return(hashB * hashModule + hashA)
end

function detectMapWithDigest()
    if RopePercent == 100 and MinesNum == 0 then
        mapString = hashDigest() .. "," .. LandDigest

        if band(GameFlags, gfBorder) ~= 0 then
            mapString = "Border," .. mapString
        end

        --WriteLnToConsole(mapString)
        return(maps[mapString])
    end
end
