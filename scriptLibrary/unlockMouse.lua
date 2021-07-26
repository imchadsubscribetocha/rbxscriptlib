--!nocheck
local CoreGui: CoreGui = game:GetService("CoreGui")
local UserInputService: UserInputService = game:GetService("UserInputService")
local RunService: RunService = game:GetService("RunService")

local ScreenGui: ScreenGui = CoreGui:FindFirstChild("MouseUnlockerGui") or Instance.new("ScreenGui")
ScreenGui.Name = "MouseUnlockerGui"
ScreenGui.Enabled = true
ScreenGui.Parent = CoreGui

local TextButton: TextButton = Instance.new("TextButton")
TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
TextButton.Name = "ModalButton"
TextButton.Modal = true
TextButton.Size = UDim2.new(0, 0, 0, 0)
TextButton.Position = UDim2.new(-0.5, 0, -0.5, 0)
TextButton.Visible = false
TextButton.Text = "."
TextButton.TextTransparency = 0.95
TextButton.TextStrokeTransparency = 1
TextButton.Parent = ScreenGui

UserInputService.InputBegan:Connect(function(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.RightControl then
        TextButton.Visible = not TextButton.Visible
    end
end)

RunService.Stepped:Connect(function()
    if TextButton.Visible == true then
        UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow;
    end;
	UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
end)