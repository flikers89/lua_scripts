bb      = 0.00000001
nextbet = bb
chance  = 0.05
bethigh = true
function dobet()
	if currentstreak == -3000 then 
	nextbet = 0.0000001
	end

	if currentstreak < -3000 then 
	nextbet = previousbet * 1.0005 
	end
  
	if win then 
	nextbet = bb
	bethigh = !bethigh
	end
end