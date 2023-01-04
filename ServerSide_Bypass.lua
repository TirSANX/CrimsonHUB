if not game:IsLoaded() then
    game.Loaded:Wait()
end
repeat
    task.wait()
until game:IsLoaded()
local System = {
379614936,
860428890,
866472074,
2664771962,
2664773504,
5006801542,
5122567177,
5122568155,
5122568874,
5827139096,
6938803436,
6990129309
}
if not table.find(System, game.PlaceId) then
    return
end
local Player = game:GetService("Players").LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local Table = {
    "xpcall",
    "pcall",
    "Idle",
    "Deactivate",
    "PreloadAsync",
    "FindService",
    "collectgarbage",
    "GetPropertyChangedSignal",
    "getfenv",
    "Kick",
    "kick"
}
local Table2 = {Char, game:GetService("CoreGui"), Player,Player.Kick,}
local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall" or "__Index",
    function(self, ...)
        local Args = {...}
        if table.find(Table, getnamecallmethod()) and table.find(Table2, self) then
            return OldNameCall(self, ...)
        end
        return OldNameCall(self, ...)
    end
)

local Disables = {
    game:GetService("Players").LocalPlayer.Idled,
    game:GetService("ScriptContext").Error,
    game:GetService("LogService").MessageOut
}

local Nos = {
    "PreloadAsync",
    "Kick",
    "kick",
    "xpcall",
    "gcinfo",
    "collectgarbage",
}

local Yes = {
    game:GetService("Players").LocalPlayer,
    game:GetService("CoreGui"),
}

for i, v in pairs(Disables) do
    for i, v in pairs(getconnections(v)) do
        v:Disable()
    end
end

local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall",
    newcclosure(
        function(self, ...)
            local A = {...}

            if table.find(Nos, getnamecallmethod()) and table.find(Yes, self)   then
                return nil or wait(math.huge)
            end
            if getnamecallmethod()=="FindService" and self.Name == "VirtualUser" and self.Name == "VirtualInputManager" then
                return 
            end
            if typeof(A) ~= "Instance" then
                return OldNameCall(self, ...)
            end
            return OldNameCall(unpack(A), self, ...)
        end
    )
)

if setfflag then
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
end
if setfpscap then
    setfpscap(144)
end

game:GetService("ScriptContext"):SetTimeout(0.5)
warn("bypassing server detection..")
