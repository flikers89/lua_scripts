-- example lua code
chance   = 98
bethigh  = true
basebet  = balance/6500 -- use above 5000 for safe
nextbet  = basebet
increase = 2.88
countH   = 0
countL   = 0

function dobet()
 
   
 
  if (win) then
    nextbet = basebet
    chance  = 98
  else
   if ( chance == 98 ) then
        nextbet=basebet
   else 
      nextbet = previousbet*increase
  end 
  end

if (lastBet.roll > 50) then
       countL= 1 + countL
       countH=0
       if  ( countL > 7 ) then -- use 8 for safe
      chance  = 62
      bethigh = false
      if ( profit > 0 ) then
          nextbet = balance/1100
      else
          nextbet = profit* (-2)
      end
      countL  = 0
    end
  end
if (lastBet.roll < 50) then 
       countH= 1 + countH
       countL=0
       if  ( countH > 7 ) then -- use 8 for safe
      chance  = 62
      bethigh = true
      if ( profit > 0 ) then
          nextbet = balance/1100
      else
          nextbet = profit* (-2)
      end
      countH  = 0
    end
  end

end