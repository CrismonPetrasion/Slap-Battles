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

    function IncorrectKeyNofitication()
        OrionLib:MakeNotification({
            Name = "Incorrect Key!",
            Content = "You have entered the incorrect key!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end

    _G.Key = "7z0q41yGlGs6U5gF"
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

        local MiscSection = MiscTab:AddSection({
            Name = "Miscellaneous"
        })

        local PlayerSection = PlayerTab:AddSection({
            Name = "Player"
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

        local Toogle = MiscTab:AddToogle({
            Name = "Anti-Void",
            Defualt = nil,
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
                    Value = false
                end
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
