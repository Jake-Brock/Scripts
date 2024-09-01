local list = {
  --bladeball
  [13772394625] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/Fsploit/Frost/main/F-r-o-s-t-w-a-r-e'))()",
  --hnse
  [205224386] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/Jake-Brock/Scripts/main/FrostWareHNSE.txt',true))()",
  --rivals
  [17625359962] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/RileyBeeRBLX4/frostware/main/FrostWareRivals.lua'))()",
}


if list[tonumber(game.GameId)] then
  loadstring(list[tonumber(game.GameId)])()
else
  game.Players.LocalPlayer:Kick("This Game Doesnt Support Frostware")
end
