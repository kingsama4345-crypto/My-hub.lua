-- Load WindUI library
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- Create main window
local Window = WindUI:CreateWindow({
    Title = "silly and vilry",
    Icon = "sparkles",
    Author = "Vilry loves femboys",
    Folder = "my outcome memories Script",
    Size = UDim2.fromOffset(350, 300),
    Transparent = false,
    Theme = "Dark",
    Resizable = false,
    SideBarWidth = 150,
    HideSearchBar = true,
    ScrollBarEnabled = false,
})

-- Window toggle key
Window:SetToggleKey(Enum.KeyCode.L)

-- Window text font
WindUI:SetFont("rbxasset://fonts/families/AccanthisADFStd.json")

-- Mobile open button
Window:EditOpenButton({
    Title = "vilry&Siliy",
    Icon = "sparkles",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 0,
    Color = ColorSequence.new(Color3.fromHex("000000"), Color3.fromHex("000000")),
    OnlyMobile = true,
    Enabled = true,
    Draggable = true,
})

----------------------------------------------------------------
-- Vote Tab
----------------------------------------------------------------
local VoteTab = Window:Tab({
    Title = "Vote",
    Icon = "vote",
})

local VoteSection = VoteTab:Section({
    Title = "Vote Options",
    Opened = true,
})

-- Function to vote for a character
local function vote(characterName)
    local args = {characterName}
    local votedRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Voted")
    votedRemote:FireServer(unpack(args))
end

-- Characters list
local characters = {
    "Shadow", "Sonic", "Tails", "Amy", "Cream",
    "Knuckles", "Eggman", "MetalSonic", "Blaze", "Silver"
}

-- Execinours list
local execinours = {
    "Kolossos", "Fleetaway", "Tripwire", "2011x"
}

-- Add buttons for characters
for _, name in ipairs(characters) do
    VoteSection:Button({
        Title = name,
        Callback = function()
            vote(name)
            print("Voted for "..name)
        end
    })
end

-- Add buttons for execinours
for _, name in ipairs(execinours) do
    VoteSection:Button({
        Title = name,
        Callback = function()
            vote(name)
            print("Voted for "..name)
        end
    })
end

----------------------------------------------------------------
-- Misc Tab
----------------------------------------------------------------
local MiscTab = Window:Tab({
    Title = "Misc",
    Icon = "sparkles",
})

local MiscSection = MiscTab:Section({
    Title = "Misc Options",
    Opened = true,
})

-- ESP
MiscSection:Button({
    Title = "ESP",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/aurous43/Public/refs/heads/main/Outcome%20Memories%20ESP.luau"))()
    end
})

-- Fake Cream Glide
MiscSection:Button({
    Title = "Fake Cream Glide",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YvHMvSGn"))()
    end
})

-- 2011x Invis Jump
MiscSection:Button({
    Title = "2011x Invis Jump",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nkojimioji-bit/scripts/main/2011x%20invis%20jump.lua"))()
    end
})

-- Fake Knux Glide
MiscSection:Button({
    Title = "Fake Knux Glide",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/50sN8wSX"))()
    end
})

-- Fake Tails Glide (G keyblind + new GUI)
MiscSection:Button({
    Title = "Fake Tails Glide",
    Callback = function()
        -- SERVICES
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
         
        local player = Players.LocalPlayer
         
        local SPEED = 50
        local RISE_SPEED = 32
        local TAP_RISE_BOOST = 22
        local GLIDE_FALL_SPEED = 12
        local FAST_FALL_SPEED = 32
         
        local flying = false
        local uiLocked = false
        local ANIM_ID = "rbxassetid://134795550846208"
         
        local ORANGE = Color3.fromRGB(255, 140, 0)
        local GREEN = Color3.fromRGB(60, 200, 60)
         
        -- GUI
        local gui = Instance.new("ScreenGui")
        gui.Parent = player.PlayerGui
        gui.ResetOnSpawn = false
         
        local frame = Instance.new("Frame")
        frame.Parent = gui
        frame.Size = UDim2.fromScale(0.18, 0.18)
        frame.Position = UDim2.fromScale(0.78, 0.68)
        frame.BackgroundColor3 = Color3.fromRGB(255, 191, 0)
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.Draggable = true
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0.08, 0)
         
        local lockBtn = Instance.new("TextButton")
        lockBtn.Parent = frame
        lockBtn.Size = UDim2.fromScale(0.18, 0.18)
        lockBtn.Position = UDim2.fromScale(0.78, 0.05)
        lockBtn.Text = "🔓"
        lockBtn.TextScaled = true
        lockBtn.BackgroundColor3 = Color3.fromRGB(160, 120, 0)
        lockBtn.TextColor3 = Color3.new(1,1,1)
        lockBtn.BorderSizePixel = 0
        lockBtn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", lockBtn)
         
        local lockText = Instance.new("TextLabel")
        lockText.Parent = frame
        lockText.Size = UDim2.fromScale(0.45, 0.18)
        lockText.Position = UDim2.fromScale(0.3, 0.05)
        lockText.Text = "Lock GUI"
        lockText.TextScaled = true
        lockText.BackgroundTransparency = 1
        lockText.TextColor3 = Color3.fromRGB(60, 40, 0)
        lockText.Font = Enum.Font.GothamBold
        lockText.TextXAlignment = Enum.TextXAlignment.Right
         
        local glideBtn = Instance.new("TextButton")
        glideBtn.Parent = frame
        glideBtn.Size = UDim2.fromScale(0.85, 0.55)
        glideBtn.Position = UDim2.fromScale(0.075, 0.35)
        glideBtn.Text = "GLIDE"
        glideBtn.TextScaled = true
        glideBtn.BackgroundColor3 = ORANGE
        glideBtn.TextColor3 = Color3.new(1,1,1)
        glideBtn.BorderSizePixel = 0
        glideBtn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", glideBtn)
         
        lockBtn.MouseButton1Click:Connect(function()
            uiLocked = not uiLocked
            frame.Draggable = not uiLocked
            lockBtn.Text = uiLocked and "🔒" or "🔓"
        end)
         
        local charData = {}
        local jumpTapBoost = 0
         
        UserInputService.JumpRequest:Connect(function()
            if flying then
                jumpTapBoost = TAP_RISE_BOOST
            end
        end)
         
        local function updateButtonColor()
            glideBtn.BackgroundColor3 = flying and GREEN or ORANGE
        end
         
        local function stopFly()
            if not flying then return end
            flying = false
            jumpTapBoost = 0
         
            if charData.animTrack then charData.animTrack:Stop() end
            if charData.bv then charData.bv:Destroy() end
            if charData.bg then charData.bg:Destroy() end
         
            charData.bv = nil
            charData.bg = nil
            updateButtonColor()
        end
         
        local function startFly()
            if flying or not charData.hrp or not charData.humanoid then return end
            flying = true
         
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            bv.Velocity = Vector3.zero
            bv.Parent = charData.hrp
         
            local bg = Instance.new("BodyGyro")
            bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
            bg.P = 1e5
            bg.Parent = charData.hrp
         
            charData.bv = bv
            charData.bg = bg
         
            if charData.animTrack then charData.animTrack:Play() end
            updateButtonColor()
        end
         
        local function toggleFly()
            if flying then stopFly() else startFly() end
        end
         
        glideBtn.MouseButton1Click:Connect(toggleFly)
        UserInputService.InputBegan:Connect(function(input, processed)
            if processed then return end
            if input.KeyCode == Enum.KeyCode.G then
                toggleFly()
            end
        end)
         
        local function setupCharacter(char)
            stopFly()
            local humanoid = char:WaitForChild("Humanoid")
            local hrp = char:WaitForChild("HumanoidRootPart")
         
            local anim = Instance.new("Animation")
            anim.AnimationId = ANIM_ID
            local animTrack = humanoid:LoadAnimation(anim)
         
            charData = {char = char, humanoid = humanoid, hrp = hrp, animTrack = animTrack}
        end
         
        setupCharacter(player.Character or player.CharacterAdded:Wait())
        player.CharacterAdded:Connect(setupCharacter)
         
        RunService.RenderStepped:Connect(function()
            if not flying or not charData.hrp or not charData.bv or not charData.bg then return end
            if charData.humanoid.FloorMaterial ~= Enum.Material.Air then stopFly() return end
         
            local cam = workspace.CurrentCamera
            local look = cam.CFrame.LookVector
            local forward = Vector3.new(look.X, 0, look.Z)
            if forward.Magnitude > 0 then forward = forward.Unit * SPEED end
         
            local vertical
            if charData.humanoid.Jump then vertical = RISE_SPEED
            elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then vertical = -FAST_FALL_SPEED
            else vertical = -GLIDE_FALL_SPEED end
         
            if jumpTapBoost > 0 then vertical += jumpTapBoost jumpTapBoost = 0 end
            charData.bv.Velocity = Vector3.new(forward.X, vertical, forward.Z)
            charData.bg.CFrame = CFrame.lookAt(charData.hrp.Position, charData.hrp.Position + Vector3.new(look.X, 0, look.Z))
        end)
    end
})

-- Insta Revive
MiscSection:Button({
    Title = "Insta Revive",
    Callback = function()
        local ProximityPromptService = game:GetService("ProximityPromptService")
        local REVIVE_DELAY = 0.02 -- seconds, change if needed

        ProximityPromptService.PromptShown:Connect(function(prompt)
            if not prompt.Enabled then return end
            if prompt.ActionText ~= "Revive" then return end

            task.delay(REVIVE_DELAY, function()
                if prompt and prompt.Enabled then
                    prompt.HoldDuration = 0
                    pcall(function()
                        fireproximityprompt(prompt)
                    end)
                end
            end)
        end)
    end
})

-- Anti Slippery
MiscSection:Button({
    Title = "Anti Slippery",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local DENSITY = 1
        local FRICTION = 2.5
        local ELASTICITY = 0
        local FRICTION_WEIGHT = 1
        local ELASTICITY_WEIGHT = 0

        local function makeAntiSlip(part)
            if not part:IsA("BasePart") then return end
            if part:IsDescendantOf(LocalPlayer.Character or {}) then return end
            if part.Anchored == false then return end

            part.CustomPhysicalProperties = PhysicalProperties.new(
                DENSITY, FRICTION, ELASTICITY, FRICTION_WEIGHT, ELASTICITY_WEIGHT
            )
        end

        for _, obj in ipairs(workspace:GetDescendants()) do
            makeAntiSlip(obj)
        end

        workspace.DescendantAdded:Connect(function(obj)
            task.wait()
            makeAntiSlip(obj)
        end)
    end
})

-- Anti Mines
MiscSection:Button({
    Title = "Anti Mines",
    Callback = function()
        task.spawn(function()
            while true do
                local projectile = workspace:FindFirstChild("Projectile")
                if projectile then
                    local traps = projectile:FindFirstChild("Traps")
                    if traps and traps:IsA("Folder") then
                        traps:Destroy()
                    end
                end
                task.wait(0.2)
            end
        end)

        workspace.DescendantAdded:Connect(function(obj)
            if obj:IsA("Folder")
                and obj.Name == "Traps"
                and obj.Parent
                and obj.Parent.Name == "Projectile" then
                obj:Destroy()
            end
        end)
    end
})
