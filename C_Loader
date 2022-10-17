repeat wait() until game:IsLoaded()

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local gtl = "https://raw.githubusercontent.com/TirSANX/CrimsonHUB/main/"

local games = {
    [9264222904] = "Auto_raid",
    [9572329421] = "Auto_raid",
    [9812430518] = "Auto_raid",
    [8396586868] = "1_Sea",
    [9432106399] = "2_Sea",
    [286090429] = "arsenal.lua",
    [6284583030] = "petxnew.lua",
    [10321372166] = "petxnew.lua",
    [9993529229] = "counterblox",
    [2753915549] = "BF.lua",
    [4442272183] = "BF.lua",
    [7449423635] = "BF.lua",
    [5985165520] = "newhr.lua",
    [6622096267] = "newhr.lua",
    [8304191830] = "AAT.lua",
    [8349889591] = "AAT.lua",
    [914010731] = "Ro_ghoul.lua",
}

for i, v in pairs(games) do
    if i == game.PlaceId or i == game.GameId then
        loadstring(game:HttpGet(gtl .. v))()
    end
end
