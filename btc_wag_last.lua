-- example lua code
chance=49
bethigh=true
basebet=0.00000001
nextbet=basebet
a=0
b=0

  
function dobet()
	if lastBet.roll < 99.00 then
	a = a+1
  else 
    a=0
	end

  if (win) then
    
    nextbet=basebet
    chance =50
  b=0
end
if b == 1 then
  nextbet = nextbet * 1.0103
end

  if lastBet.profit > 0.0000004 then
    
    a=0
  end
  

  if a == 123 then
  nextbet = 0.00000021
  chance = 1
  b = 1
end
  
  --print("seria = ",a)
end
