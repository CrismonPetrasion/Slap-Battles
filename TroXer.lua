if game.PlaceId == 6403373529 then
    local Player = game.Players.LocalPlayer
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local KeyWindow = OrionLib:MakeWindow({Name = "Key System | Slap Battles", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionHub"})

    OrionLib:MakeNotification({
        Name = "Logged in!",
        Content = "You are logged in as "..Player.Name..".",
        Image = "rbxassetid://4483345998",
        Time = 5
    })

    function KeyNofitication()
        OrionLib:MakeNotification({
            Name = "Key System!",
            Content = "You need to join this server (https://discord.gg/GajSbcfHxh) to get a key",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end

    function CorrectKeyNofitication()
        OrionLib:MakeNotification({
            Name = "Correct Key!",
            Content = "You have entered the correct key!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end

    function Incorrect()
        OrionLib:MakeNotification({
            Name = "Error!",
            Content = "The error has happended! Please try to report this bug to our discord!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end

    function IncorrectKeyNofitication()
        OrionLib:MakeNotification({
            Name = "Incorrect Key!",
            Content = "You have entered the incorrect key!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end

    _G.InfiniteJump = false
    _G.Key = "RELEASE"
    _G.KeyInput = "string"

    function ScriptHub()
        print("Player who is logged name is ".. Player.Name ..".")
        warn(_G.Key)
        local SystemWindow = OrionLib:MakeWindow({Name = "The Crimson Who Exsist | Slap Battles Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionHub", IntroText = "The Crimson Who Exsist"})

        local PlayerTab = SystemWindow:MakeTab({
            Name = "Player Settings",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false,
        })

        local MiscTab = SystemWindow:MakeTab({
            Name = "Miscellaneous Settings",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false,
        })

        local TeleportsTab = SystemWindow:MakeTab({
            Name = "Teleports Settings",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false,
        })

        local BadgesTab = SystemWindow:MakeTab({
            Name = "Badges Settings",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false,
        })

        local MiscSection = MiscTab:AddSection({
            Name = "Miscellaneous"
        })

        local BadgeSection = BadgesTab:AddSection({
            Name = "Badges"
        })

        local PlayerSection = PlayerTab:AddSection({
            Name = "Player"
        })

        local TeleportSection = TeleportsTab:AddSection({
            Name = "Teleports"
        })

        local Slider = PlayerTab:AddSlider({
                Name = "Player's WalkSpeed",
                Min = 0,
                Max = 250,
                Defualt = 16,
                Color = Color3.fromRGB(255,255,255),
                Increment = 1,
                ValueName = "WalkSpeed",
                Callback = function(Value)
                   print(Value)  
                   local Bypass;
                   Bypass = hookmetamethod(game, "__namecall", function(method, ...) 
                    if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
                        return
                    elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
                        return
                    elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
                        return
                    end
                    return Bypass(method, ...)
                end)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
                end,
            })
    
        local Slider2 = PlayerTab:AddSlider({
                Name = "Player's JumpPower",
                Min = 0,
                Max = 250,
                Defualt = 16,
                Color = Color3.fromRGB(255,255,255),
                Increment = 1,
                ValueName = "WalkSpeed",
                Callback = function(Value)
                    Player.Character.Humanoid.UseJumpPower = true
                    Player.Character.Humanoid.JumpPower = Value
                end
            })
    
        local Slider3 = PlayerTab:AddSlider({
                Name = "Player's Gravity",
                Min = 0,
                Max = 350,
                Defualt = 16,
                Color = Color3.fromRGB(255,255,255),
                Increment = 1,
                ValueName = "Gravity",
                Callback = function(Value)
                    workspace.Gravity = Value
                end
            })

        local Button = PlayerTab:AddButton({
                Name = "Infinite Jump",
                Callback = function()
                    _G.InfiniteJump = true
                    if _G.InfiniteJump == false then
                        Incorrect()
                    end
                    if _G.InfiniteJump == true then
                        local Bypass;
                        Bypass = hookmetamethod(game, "__namecall", function(method, ...) 
                         if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
                             return
                         elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
                             return
                         elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
                             return
                         end
                         return Bypass(method, ...)
                     end) 
                     game:GetService("UserInputService").JumpRequest:Connect(function()
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState("Jumping")
                     end)  
                    end
                end
            })

        local DeathBlocks = MiscTab:AddToogle({
                Name = "Anti Death Barriers, Cube",
                Default = false,
                Callback = function(Value)
                    if Value == true then
                        for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                            if v.ClassName == "Part" and v.Name == "BLOCK" then
                                v.CanTouch = false
                            end
                        end
                        workspace.DEATHBARRIER.CanTouch = false
                        workspace.DEATHBARRIER2.CanTouch = false
                        workspace.dedBarrier.CanTouch = false
                        workspace.ArenaBarrier.CanTouch = false
                        workspace.AntiDefaultArena.CanTouch = false
                        workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
    
                    else
                        for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                            if v.ClassName == "Part" and v.Name == "BLOCK" then
                                v.CanTouch = true
                            end
                        end
                        workspace.DEATHBARRIER.CanTouch = true
                        workspace.DEATHBARRIER2.CanTouch = true
                        workspace.dedBarrier.CanTouch = true
                        workspace.ArenaBarrier.CanTouch = true
                        workspace.AntiDefaultArena.CanTouch = true
                        workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
    
                    end
                end
            })

        local AdminToogle = MiscTab:AddToogle({
                Name = "Anti Admins",
                Defualt = false,
                Callback = function(Value)
                    AntiAdmins = Value
                    while AntiAdmins do
                        for i,v in pairs(game.Players:GetChildren()) do
                            if v:GetRankInGroup(9950771) >= 2 then
                                game.Players.LocalPlayer:Kick("High Rank Player")
                            end
                        end
                    end
                end
            })

        local Toogle = MiscTab:AddToogle({
                Name = "Anti-Void",
                Defualt = false,
                Callback = function(Value)
                    print("Pressed")
                    if Value == false then
                        Value = true
                        local Part = Instance.new("Part", workspace)
                        Part.Name = "AntiVoid"
                        Part.CFrame = CFrame.new(0,-7.5,0)
                        Part.Size = Vector3.new(1000,0,1000)
                        Part.Anchored = true
                        Part.Transparency = 0.8
                    elseif Value == true then
                        Value = false
                        local DestroyPart = workspace.AntiVoid
                        DestroyPart:Destroy()
                    elseif Value == nil then
                        warn("Error")
                        Incorrect()
                        Value = false
                    end
                end
            })
    
        local Toogle = MiscTab:AddToogle({
                Name = "Anti-Void",
                Defualt = false,
                Callback = function(Value)
                    print("Pressed")
                    if Value == false then
                        Value = true
                        local Part = Instance.new("Part", workspace)
                        Part.Name = "AntiVoid"
                        Part.CFrame = CFrame.new(0,-7.5,0)
                        Part.Size = Vector3.new(1000,0,1000)
                        Part.Anchored = true
                        Part.Transparency = 0.8
                    elseif Value == true then
                        Value = false
                        local DestroyPart = workspace.AntiVoid
                        DestroyPart:Destroy()
                    elseif Value == nil then
                        warn("Error")
                        Incorrect()
                        Value = false
                    end
                end
            })

        local Dropdown = TeleportsTab:AddDropdown({
                Name = "Teleports",
                Defualt = "Input",
                Options = {"Plate", "Safe Spot", "Defualt Arena", "Lobby", "Slapple Island", "Moai Island", "Arena", "Tournament"},
                Callback = function(Value)
                    if Value == nil then
                        Incorrect()
                    elseif Value == false then
                        Incorrect()
                    elseif Value == true then
                        Incorrect()
                    elseif Value == "Plate" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,2,0)
                    elseif Value == "Safe Spot" then
                        local SafeSpot = Instance.new("Part", workspace)
                        SafeSpot.Position = Vector3.new(-1500,100,-1500)
                        SafeSpot.Name = "Spot"
                        SafeSpot.Size = Vector3.new(50,50,50)
                        SafeSpot.Anchored = true
                        SafeSpot.Transparency = 0.7
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Spot.CFrame * CFrame.new(0,28,0)
                    elseif Value == "Default  Arena" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120,360,-3)
                    elseif Value == "Arena" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
                    elseif Value == "Lobby" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-800,328,-2.5)
                    elseif Value == "Tournament" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,10,0)
                    elseif Value == "Slapple Island" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.island5.Union.CFrame * CFrame.new(0,3.25,0)
                    elseif Value == "Moai Island" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215, -15.5, 0.5)
                    end
                end
            })


        local Button = BadgesTab:AddButton({
                Name = "Get Lone Orange Badge, Get Court Evidence Badge",
                Callback = function()
                    fireclickdetector(game.Workspace.Arena.island5.Orange.ClickDetector)
                    fireclickdetector(game.Workspace.Lobby.Scene.knofe.ClickDetector)
                end
            })
    
        local Button2 = BadgesTab:AddButton({
                Name = "Get Brazil Badge",
                Callback = function()
                    local Player = game.Players.LocalPlayer
                    local Character = Player.Character
    
                    Character.HumanoidRootPart.CFrame = game.workspace.Lobby.brazil.portal.CFrame
    
                end
            })

        local Button3 = BadgesTab:AddButton({
                Name = "Get Brazil Badge",
                Callback = function()
                    fireclickdetector(game.Workspace.Arena["default island"]["Rubber Ducky"].ClickDetector)
                end
            })
    end

    local KeyTab = KeyWindow:MakeTab({
        Name = "Key",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false,
    })

    KeyTab:AddTextbox({
        Name = "Enter Key",
        Defualt = "Nothing",
        TextDisappear = true,
        Callback = function(Value)
            _G.KeyInput = Value
        end
    })
    
    KeyTab:AddButton({
        Name = "Check Key",
        Callback = function()
            if _G.KeyInput == _G.Key then
                ScriptHub()
                CorrectKeyNofitication()
                KeyWindow:Destroy()
            else
                warn("Player's Name is: ".. Player.Name.. ". Player's UserId is: " .. Player.UserId.. ".")
                IncorrectKeyNofitication()
                KeyNofitication()
            end
        end
    })
end
