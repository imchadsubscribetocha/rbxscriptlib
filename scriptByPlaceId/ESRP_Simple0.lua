--##############################################################################--local Players: Players = game:GetService("Players")
local RunService: RunService = game:GetService("RunService")
local TweenService: TweenService = game:GetService("TweenService")
local UserInputService: UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer;
--##############################################################################--
local speedhack = false
local noclipping = false
--##############################################################################--
local function displaymessage(message)
	for index, value in pairs(CoreGui:GetChildren()) do
		if value.Name == "penis penis penis lol xd" then
			value:Destroy()
		end
	end
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "penis penis penis lol xd"
	ScreenGui.DisplayOrder = 3
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	ScreenGui.Parent = CoreGui
	local TextLabel = Instance.new("TextLabel")
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.TextScaled = true
	TextLabel.Size = UDim2.new(0.325, 0, 0.1, 0)
	TextLabel.Position = UDim2.new(0.5, 0, 0.785, 0)
	TextLabel.Name = "zimbabwe iz kewl"
	TextLabel.BackgroundTransparency = 1
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.Font = Enum.Font.Arcade
	TextLabel.Text = message
	TextLabel.Parent = ScreenGui
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	UITextSizeConstraint.MaxTextSize = 36
	UITextSizeConstraint.MinTextSize = 1
	UITextSizeConstraint.Parent = TextLabel
	wait(2)
	if ScreenGui and TextLabel then
		TweenService:Create(TextLabel, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0), {
			["TextTransparency"] = 1,
			["TextStrokeTransparency"] = 1,
		}):Play()
	end
end
--##############################################################################--
local rawmetatatble = getrawmetatable(game)
setreadonly(rawmetatatble, false)
local defaultmetamethod = rawmetatatble.__namecall
rawmetatatble.__namecall = newcclosure(function(self, ...)
	local tuple = {...};
	local namecallmethod = getnamecallmethod();

	if self and typeof and typeof(self) == "Instance" and self.IsA(self, "Humanoid") and table.find({"Destroy", "Remove", "destroy", "remove"}, namecallmethod) then
		return error("Cannot destroy this Instance.")
	end

	return defaultmetamethod(self, unpack(tuple));
end)
--##############################################################################--
local BindableEvent = Instance.new("BindableEvent")
BindableEvent.Name = "BindableEvent"
BindableEvent.Parent = nil
coroutine.resume(coroutine.create(function()
	while true do
		BindableEvent:Fire()
		wait(1 / 30)
	end
end))
--##############################################################################--
UserInputService.InputBegan:Connect(function(InputObject: InputObject, gameProcessedEvent: boolean)
	if not gameProcessedEvent then
		if InputObject.UserInputType == Enum.UserInputType.Keyboard and InputObject.UserInputState == Enum.UserInputState.Begin then
			if InputObject.KeyCode == Enum.KeyCode.X then
				noclipping = not noclipping
				displaymessage("noclip toggled to " .. noclipping == true and "true" or "false")
			elseif InputObject.KeyCode == Enum.KeyCode.LeftShift then
				speedhack = true
				displaymessage("speed hack enabled")
			end
		end
	end
end)
UserInputService.InputEnded:Connect(function(InputObject: InputObject)
	if InputObject.KeyCode == Enum.KeyCode.LeftShift then
		speedhack = false
		displaymessage("speed hack disabled")
	end
end)
--##############################################################################--
RunService.Stepped:Connect(function()
	local Character = LocalPlayer.Character
	assert(Character)
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	assert(Humanoid)
	local RootPart = Humanoid.RootPart
	assert(RootPart)
	if noclipping then
		for _, BasePart in pairs(Character:GetChildren()) do
			if BasePart:IsA("BasePart") and BasePart.CanCollide then
				BasePart.CanCollide = false
			end
		end
	end
	if speedhack then
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then
			RootPart.CFrame = RootPart.CFrame * CFrame.new(0, 0, -0.5)
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then
			RootPart.CFrame = RootPart.CFrame * CFrame.new(-0.5, 0, 0)
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
			RootPart.CFrame = RootPart.CFrame * CFrame.new(0, 0, 0.5)
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then
			RootPart.CFrame = RootPart.CFrame * CFrame.new(0.5, 0, 0)
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
			RootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			RootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
			RootPart.CFrame = RootPart.CFrame * CFrame.new(0, 0.5, 0)
		end
	end
end)
--##############################################################################--