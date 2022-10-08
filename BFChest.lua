--[[

Scipt made by ! MIAFA
Join Our Discord Server : https://discord.gg/qyDJcKb3gW

 ▄████▄   ██▀███   ██▓ ███▄ ▄███▓  ██████  ▒█████   ███▄    █ 
▒██▀ ▀█  ▓██ ▒ ██▒▓██▒▓██▒▀█▀ ██▒▒██    ▒ ▒██▒  ██▒ ██ ▀█   █ 
▒▓█    ▄ ▓██ ░▄█ ▒▒██▒▓██    ▓██░░ ▓██▄   ▒██░  ██▒▓██  ▀█ ██▒
▒▓▓▄ ▄██▒▒██▀▀█▄  ░██░▒██    ▒██   ▒   ██▒▒██   ██░▓██▒  ▐▌██▒
▒ ▓███▀ ░░██▓ ▒██▒░██░▒██▒   ░██▒▒██████▒▒░ ████▓▒░▒██░   ▓██░
░ ░▒ ▒  ░░ ▒▓ ░▒▓░░▓  ░ ▒░   ░  ░▒ ▒▓▒ ▒ ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒ 
  ░  ▒     ░▒ ░ ▒░ ▒ ░░  ░      ░░ ░▒  ░ ░  ░ ▒ ▒░ ░ ░░   ░ ▒░
░          ░░   ░  ▒ ░░      ░   ░  ░  ░  ░ ░ ░ ▒     ░   ░ ░ 
░ ░         ░      ░         ░         ░      ░ ░           ░ 
░                                                             

Scipt made by ! MIAFA
Join Our Discord Server : https://discord.gg/qyDJcKb3gW
--]]
getgenv().Chest_Farm = true
local placeId = game.PlaceId
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
repeat wait() until game:IsLoaded() ~= false


local Counter = 0
local PlaceID = game.PlaceId
     local AllIDs = {}
     local foundAnything = ""
     local actualHour = os.date("!*t").hour
     local Deleted = false

     local File = pcall(function()
         AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
     end)
     if not File then
         table.insert(AllIDs, actualHour)
         writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
     end
    
     function TPReturner()
         local Site;
         if foundAnything == "" then
             Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
         else
             Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
         end
         local ID = ""
         if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
             foundAnything = Site.nextPageCursor
         end
         local num = 0;
         for i,v in pairs(Site.data) do
             local Possible = true
             ID = tostring(v.id)
             if tonumber(v.maxPlayers) > tonumber(v.playing) then
                 for _,Existing in pairs(AllIDs) do
                     if num ~= 0 then
                         if ID == tostring(Existing) then
                             Possible = false
                         end
                     else
                         if tonumber(actualHour) ~= tonumber(Existing) then
                             local delFile = pcall(function()
                                delfile("NotSameServers.json")
                                 AllIDs = {}
                                 table.insert(AllIDs, actualHour)
                             end)
                         end
                     end
                     num = num + 1
                 end
                 if Possible == true then
                     table.insert(AllIDs, ID)
                     wait()
                     pcall(function()
                         writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                         wait()
                         game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                     end)
                     wait(4)
                 end
             end
         end
     end
 
     function Teleport()
        while wait() do
            pcall(function()
                 TPReturner()
                 if foundAnything ~= "" then
                     TPReturner()
                 end
            end)
        end
     end


spawn(function()
   while wait(.8) do
      if Chest_Farm then
        pcall(function()
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if string.find(v.Name, "Chest") then
                    print(v.Name)
                    wait(.2)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,0,0.1)
                    wait(.2)
                end
            end
            for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if string.find(v.Name, "Chest") and v:IsA("TouchTransmitter") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0) --0 is touch
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1) -- 1 is untouch
                end
            end
        end)
      end
end
end)

spawn(function()
    while wait() do
        if Server_Hop then
            pcall(function()
                if not game:GetService("Workspace"):FindFirstChild("Chest1") and not game:GetService("Workspace"):FindFirstChild("Chest2") and not game:GetService("Workspace"):FindFirstChild("Chest3") then
                Teleport()
                print("Finding new server")
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait(15) do
        pcall(function()
        if Chest_Farm then
            game.Players.LocalPlayer.Character.Head:Destroy()
        end
    end)
    end
end)
end
