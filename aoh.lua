_G.orbfarm = false 
_G.thugfarm = false
_G.policefarm = false
_G.civilianfarm = false

local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()

local MainUI = UILibrary.Load("Dragona Hub")
local farming = MainUI.AddPage("Farming")
local other = MainUI.AddPage("Other")
local credits = MainUI.AddPage("Credits")
--farming
local orbFarm = farming.AddToggle("Orb Farm", false, function(Value)
    if Value == true then
        _G.orbfarm = true
    elseif Value == false then
        _G.orbfarm = false
    end
end)

local thugFarm = farming.AddToggle("Thug Farm", false, function(Value)
    if Value == true then
        _G.thugfarm = true
    elseif Value == false then
        _G.thugfarm = false
    end
end)

local policeFarm = farming.AddToggle("Police Farm", false, function(Value)
    if Value == true then
        _G.policefarm = true
    elseif Value == false then
        _G.policefarm = false
    end
end)

local civFarm = farming.AddToggle("Civilian Farm", false, function(Value)
    if Value == true then
        _G.civilianfarm = true
    elseif Value == false then
        _G.civilianfarm = false
    end
end)

--Other
local levelRemove = other.AddButton("Remove levelup popup", function()
    game:GetService("Players").LocalPlayer.PlayerGui.uiMain.levelUp:Destroy()
end)

local xpRemove = other.AddButton("Remove XP sound", function()
    game:GetService("Players").LocalPlayer.PlayerGui.uiMain.xpSound:Destroy()
    game:GetService("Players").LocalPlayer.PlayerGui.uiMain.levelSound:Destroy()
end)

local moneyRemove = other.AddButton("Remove money sound", function()
    game:GetService("Players").LocalPlayer.PlayerGui.uiMain.income:Destroy()
end)

--Credits
local discUser = credits.AddLabel("dragona#3591")

local discord = credits.AddButton("Copy Discord Link", function()
    setclipboard("https://discord.gg/RpbbxqyUfu")
end)

-- Scripts
local funcName = "Punch"
local func

spawn(function()
    while wait() do
        if _G.orbfarm == true then
           for i, v in pairs(game:GetService("Workspace").ExperienceOrbs:GetDescendants()) do
               if v:IsA("Attachment") then
                  v:Destroy() 
               end
               if v:IsA("Part") then
                  v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
               end
           end
        end
     end
end)

spawn(function()
    for i, v in pairs(getgc()) do
        if type(v) == 'function' and not is_synapse_function(v) and getinfo(v).name then
           if getinfo(v).name == funcName then
               func = v
           end
        end
     end
end)

spawn(function()
    coroutine.wrap(function()
        while wait() do
            if _G.thugfarm == true then
                pcall(function()
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA("Model") and v.Name == "Thug" then
                            if v.Humanoid.Health > 0 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                                repeat
                                    wait()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-5,0) * CFrame.Angles(math.rad(0),90,0)
                                until v.Humanoid.Health <= 0 or _G.thugfarm == false
                            end
                        end
                    end
                end)
            end
        end
    end)()
end)

spawn(function()
    coroutine.wrap(function()
        while wait() do
            if _G.policefarm == true then
                pcall(function()
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA("Model") and v.Name == "Police" then
                            if v.Humanoid.Health > 0 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                                repeat
                                    wait()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-5,0) * CFrame.Angles(math.rad(0),90,0)
                                until v.Humanoid.Health <= 0 or _G.policefarm == false
                            end
                        end
                    end
                end)
            end
        end
    end)()
end)

spawn(function()
    coroutine.wrap(function()
        while wait() do
            if _G.civilianfarm == true then
                pcall(function()
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA("Model") and v.Name == "Civilian" then
                            if v.Humanoid.Health > 0 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                                repeat
                                    wait()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-5,0) * CFrame.Angles(math.rad(0),90,0)
                                until v.Humanoid.Health <= 0 or _G.civilianfarm == false
                            end
                        end
                    end
                end)
            end
        end
    end)()
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function() 
        if _G.thugfarm == true or _G.civilianfarm == true or _G.policefarm == true then
            repeat
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            func()
            until _G.thugfarm == false or _G.civilianfarm == false or _G.policefarm == false
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(8)
        end
    end)
end)