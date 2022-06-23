_G.Quest = false
_G.Coin = false
_G.secretEgg = false
_G.dailyEgg = false

local UILibrary = loadstring(game:HttpGet("https://pastebin.com/raw/V1ca2q9s"))()
local player = game.Players.LocalPlayer
local character = player.Character

local MainUI = UILibrary.Load("Dragona Hub")
local main = MainUI.AddPage("Auto Farm")
local egg = MainUI.AddPage("Eggs")
local upgrades = MainUI.AddPage("Upgrades")
local credits = MainUI.AddPage("Credits")

-- Auto Farming
local claimQuest = game:GetService("ReplicatedStorage").Remotes.ClaimQuestReward

local autoQuest = main.AddToggle("Auto Quest", false, function(Value)
    if Value == true then
        _G.Quest = true
    elseif Value == false then
        _G.Quest = false
    end
end)

local autoCollect = main.AddToggle("Auto Collect Coins", false, function(Value)
    if Value == true then
        _G.Coin = true
    elseif Value == false then
        _G.Coin = false
    end
end)

spawn(function()
    while wait() do
        if _G.Coin == true then
            for i,v in pairs(game:GetService("Workspace").Drops:GetDescendants()) do
                if v:IsA("Part") then
                    character.HumanoidRootPart.CFrame = v.CFrame
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.Quest == true then
            claimQuest:FireServer()
            end
        end
end)


-- Eggs
local autoSecret = egg.AddToggle("Auto Collect Secret Eggs", false, function(Value)
    if Value == true then
        _G.secretEgg = true
    elseif Value == false then
        _G.secretEgg = false
    end
end)

local autoDaily = egg.AddToggle("Auto Collect Daily Egg", false, function(Value)
    if Value == true then
        _G.dailyEgg = true
    elseif Value == false then
        _G.dailyEgg = false
    end
end)

local purchaseEgg = egg.AddDropdown("Buy Egg", {
    "Common $7.5k",
    "Uncommon $35k",
    "Rare $160k",
    "Epic $750k",
    "Legendary $3.5m",
    "Prodigious $12m"
    }, function(Value)
        local remote = game.ReplicatedStorage.Remotes.BuyEgg
    if Value == "Common $7.5k" then
        remote:FireServer(1)
        elseif Value == "Uncommon $35k" then
         remote:FireServer(2)
        elseif Value == "Rare $160k" then
            remote:FireServer(3)
        elseif Value == "Epic $750k" then
            remote:FireServer(4)
        elseif Value == "Legendary $3.5m" then
            remote:FireServer(5)
        elseif Value == "Prodigious $12m" then
            remote:FireServer(6)
    end
end)

spawn(function()
    while wait() do
        if _G.secretEgg == true then
            for i,v in pairs(game:GetService("Workspace").HiddenEggs:GetChildren()) do
                v.CFrame = character.HumanoidRootPart.CFrame
            end
        end
    end
end)

spawn(function()
    while wait() do
        if _G.dailyEgg == true then
            game:GetService("ReplicatedStorage").Remotes.ClaimDailyEgg:FireServer()
        end
    end
end)

-- Upgrades
local statIncrease = upgrades.AddDropdown("Upgrade Stats", {
    "Damage",
    "Speed",
    "Drop Collection Range",
    "Exotic Crystal Luck",
    "Shiny Luck",
    "Bonus Drop Collection Range"
    }, function(Value)
        local remote = game.ReplicatedStorage.Remotes.BuyStatIncrease
        if Value == "Damage" then
            remote:FireServer("Damage")
            elseif Value == "Speed" then
             remote:FireServer("Speed")
            elseif Value == "Drop Collection Range" then
                remote:FireServer("DropCollectionRange")
            elseif Value == "Exotic Crystal Luck" then
                remote:FireServer("ExoticChance")
            elseif Value == "Shiny Luck" then
                remote:FireServer("ShinyLuck")
            elseif Value == "Bonus Drop Collection Range" then
                remote:FireServer("BonusDropCollectionRange")
        end
end)

-- Credits

local discUser = credits.AddLabel("dragona#3591")

local discord = credits.AddButton("Copy Discord Link", function()
    setclipboard("https://discord.gg/RpbbxqyUfu")
end)