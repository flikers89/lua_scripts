-- example lua code
chance=49
bethigh=true
basebet=0.00000001
nextbet=basebet
  a=0
  b=0
  
function dobet()
	if lastBet.roll > 30.00 then
		a = a+1
	else 
		a=0
	end

	if (win) then
		nextbet=basebet
		chance =50
		bethigh=true
	end

	if a == 15 then
		nextbet = 0.00000010
		chance = 10
		bethigh=false
	end
	
	if a == 16 then
		nextbet = 0.00000001
		chance = 10
		bethigh=false
		a = 0
	end

end
