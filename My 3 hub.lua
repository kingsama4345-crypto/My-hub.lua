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
        loadstring(game:HttpGet("https://pastebin.com/raw/Mr29drJ9"))()
    end
})

-- Insta Revive
MiscSection:Button({
    Title = "Insta Revive",
    Callback = function()
        local ProximityPromptService = game:GetService("ProximityPromptService")
        local REVIVE_DELAY = 0.02

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

-- Shadow Fake Boost (NEW VERSION)
MiscSection:Button({
    Title = "Shadow Fake Boost",
    Callback = function()
        -- SERVICES
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")

        local player = Players.LocalPlayer
        local cam = workspace.CurrentCamera

        local BOOST_SPEED = 85
        local BOOST_TIME = 1.5
        local boosting = false

        -- UI (permanent, no duplicates)
        local gui = player:WaitForChild("PlayerGui"):FindFirstChild("BoostGui")
        if not gui then
            gui = Instance.new("ScreenGui")
            gui.Name = "BoostGui"
            gui.ResetOnSpawn = false
            gui.Parent = player:WaitForChild("PlayerGui")
        end

        local frame = gui:FindFirstChild("BoostFrame")
        if not frame then
            frame = Instance.new("Frame")
            frame.Name = "BoostFrame"
            frame.Size = UDim2.new(0, 100, 0, 70)
            frame.Position = UDim2.new(0.8, 0, 0.75, 0)
            frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            frame.BorderSizePixel = 0
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 8)
            corner.Parent = frame
            frame.Parent = gui
        end

        local title = frame:FindFirstChild("Title")
        if not title then
            title = Instance.new("TextLabel")
            title.Name = "Title"
            title.Size = UDim2.new(1, 0, 0, 25)
            title.Position = UDim2.new(0, 0, 0, 0)
            title.Text = "BOOST"
            title.BackgroundTransparency = 1
            title.TextColor3 = Color3.new(1,1,1)
            title.TextScaled = true
            title.Parent = frame
        end

        local btn = frame:FindFirstChild("BoostButton")
        if not btn then
            btn = Instance.new("TextButton")
            btn.Name = "BoostButton"
            btn.Size = UDim2.new(0.8, 0, 0, 30)
            btn.Position = UDim2.new(0.1, 0, 0, 35)
            btn.Text = "BOOST"
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            btn.TextColor3 = Color3.new(1,1,1)
            btn.TextScaled = true
            btn.BorderSizePixel = 0
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0,5)
            btnCorner.Parent = btn
            btn.Parent = frame
        end

        -- CHARACTER SETUP
        local hum, root, lv, alignOri, boostAnim

        local function setupCharacter(char)
            hum = char:WaitForChild("Humanoid")
            root = char:WaitForChild("HumanoidRootPart")

            local att = Instance.new("Attachment")
            att.Parent = root

            lv = Instance.new("LinearVelocity")
            lv.Attachment0 = att
            lv.MaxForce = math.huge
            lv.RelativeTo = Enum.ActuatorRelativeTo.World
            lv.Enabled = false
            lv.Parent = root

            alignOri = Instance.new("AlignOrientation")
            alignOri.Attachment0 = att
            alignOri.Mode = Enum.OrientationAlignmentMode.OneAttachment
            alignOri.MaxTorque = math.huge
            alignOri.Responsiveness = 200
            alignOri.Enabled = false
            alignOri.Parent = root

            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://129555938474948"
            boostAnim = hum:LoadAnimation(anim)
            boostAnim.Looped = true
        end

        if player.Character then setupCharacter(player.Character) end
        player.CharacterAdded:Connect(setupCharacter)

        -- BOOST LOGIC
        btn.MouseButton1Click:Connect(function()
            if boosting or not root then return end
            boosting = true
            boostAnim:Play()
            lv.Enabled = true
            alignOri.Enabled = true

            local startTime = os.clock()
            local conn
            conn = RunService.RenderStepped:Connect(function()
                if os.clock() - startTime >= BOOST_TIME then
                    conn:Disconnect()
                    lv.Enabled = false
                    alignOri.Enabled = false
                    boostAnim:Stop()
                    boosting = false
                    return
                end

                local look = cam.CFrame.LookVector
                lv.VectorVelocity = look * BOOST_SPEED
                alignOri.CFrame = CFrame.lookAt(root.Position, root.Position + look)
            end)
        end)
    end
})
