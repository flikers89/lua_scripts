--  Script: Harish's Script for Wager
--  Version 0.1

---------------------
--  MAIN SETTINGS  --
---------------------

target      = balance * 100              -- 1000% profit :)
basebet     = balance / 10000      -- Basebet for Double Wager
wagerbal    = balance / 10000         -- Basebet for Wager Routine
maxchance   = 98                    -- Chance for Wager
percentlose = 1                     -- 1% loss of the current balance
minbet      = basebet/10            -- Min bet of the casino
fakebets    = 5                     -- Number of Fakebets to Recover CHANCE

coinvalue = 0.000212               -- Write the current USD value
printinfo = 0                  -- 0 TO DISABLE PRINTS

dicebot     = 0                   -- Enable / Disable Dicebot

-----------------------
--  CASINO SETTINGS  --
-----------------------
fixcasino   = 0                     -- Enable if you need to fix any casino
betfury     = 0                     -- Enable to fix for speed in Betfury (FIXCASINO MUST BE ENABLE ALSO)
gigaroyale  = 0                     -- Enable to fix GIGABET and CR change of side (FIXCASINO MUST BE ENABLE ALSO)
ninedice    = 0                     -- Enable to fix CHANCES for 999dice (FIXCASINO MUST BE ENABLE ALSO)
cryptogames = 0                     -- Enable to fix CHANCES for Crypto-Games (FIXCASINO MUST BE ENABLE ALSO)

-------------------
--  DONT CHANGE  --
-------------------
chance     = maxchance
chanceone    = 81
chancetwo    = 19
multiplier = 1.28
nextbet     = wagerbal
bethigh     = true
counter     = 0
wincount    = 0
totalloss   = 0
initbalance = balance
stoplose    = balance * (1-(percentlose/100))
gowager     = 1
startbalance    = balance
netprofit       = 0
time            = os.date("*t")
currenttime     = time
local clock     = os.clock
local t0        = clock()
t1              = 0
runtime         = time
starttime       = clock()
curbalance      = balance
totalwager      = 0
recoverbet      = 0
startrecover    = 0
countwin        = 0
countlose       = 0
nextchance      = chanceone
if ninedice == 1 then
    fixcasino()
end

loseAmount    = 0
resultNumber  = 25
resultNumber1 = 25
resultNumber2 = 25
resultNumber3 = 25
resultNumber4 = 25
resultNumber5 = 25
n             = 1
maxbet        = balance/(1000)

function dobet()
    if balance >= curbalance then
        curbalance = balance
    end
    totalwager+=previousbet
    if balance >= stoplose and gowager == 1 then
        countwin = 0
        countlose = 0
        chance = maxchance
        nextbet = wagerbal
        side = math.random(1,2)
        if lastBet.roll >= 50 then
            bethigh = true
        else
            bethigh = false
        end
        nextchance = chanceone
    else
        if initbalance > balance then
           totalloss = initbalance - balance 
        end
        if nextchance == chanceone then
            countlose = 0
            if win then
                countwin+=1
            else    
                countwin = 0
            end
            recoverbet  = basebet+(totalloss/50)
            chance = chanceone
            gowager=0
            nextbet = minbet
            bethigh = true
            if dicebot == 1 then
                winstreak = countwin
            end
            if winstreak > 8 then
                chance = chancetwo
                nextbet = minbet
                startrecover = 1
                countwin = 0
            end
        end
        if chance == chancetwo then
            countwin = 0
            nextchance = chancetwo
            if (win) and previousbet > minbet and startrecover == 0 then
                nextbet = minbet
                chance = chanceone
                nextchance = chanceone
            end
            startrecover = 0
            if (!win) then
                countlose+=1
            else
                countlose = 0
            end
            if dicebot == 1 then
                losestreak = countlose
            end
            if losestreak <= fakebets then
                nextbet = minbet
            end
            if losestreak == fakebets then
                nextbet = recoverbet
                if nextbet < basebet * 3 then
                    nextbet = basebet * 3
                end
            else
                if losestreak > fakebets+1 then
                    nextbet = previousbet * multiplier
                end 
            end
        end
    end
    if initbalance <= balance then
        initbalance = balance
        stoplose    = balance * (1-(percentlose/100))
        gowager = 1
        totalloss   = 0
else 
loseAmount    = initbalance-balance
      if chance!=maxchance or chance!=chanceone or  (loseAmount>initialbalance*2/100) then
       
          chance = math.abs(math.max(resultNumber1,resultNumber2,resultNumber3,resultNumber4,resultNumber5))
           
            resultNumber  = lastBet.roll
            resultNumber5 = resultNumber4
            resultNumber4 = resultNumber3
            resultNumber3 = resultNumber2
            resultNumber2 = resultNumber1
            resultNumber1 = resultNumber
           
            nextbet       = nextbet*(chance/5000+1)
           if (math.abs(math.min(resultNumber1,resultNumber2,resultNumber3,resultNumber4,resultNumber5)))>3 then
                chance=math.abs(math.min(resultNumber1,resultNumber2,resultNumber3,resultNumber4,resultNumber5))
                chance=chance-((chance*2)*25/100)
    nextbet=loseAmount/(98/chance-1)
           end
            if chance==0 then
    chance=1
           end
             if chance>98 then
                chance = 98
            end  
       end
    end

    if nextbet < minbet then
        nextbet = minbet
    end
end