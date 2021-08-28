game:GetService("Chat"):RegisterChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, function()
	return {
		["BubbleChatEnabled"] = true,
		["ClassicChatEnabled"] = true,
		
		["ChatBarFont"] = Enum.Font.Cartoon,
		["DefaultFont"] = Enum.Font.Cartoon,
	}
end)
