--[[
    ClientSkillControl.client.lua

    @description: Contains the logic for player skills.
    @author: NINJAMASTR999
]]

local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")

if UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then -- Mouse + KB
    ContextActionService:BindAction("SkillQ", function(_, inputState) --TODO: Add a way to change the keybind, and move skills to another place
        if inputState == Enum.UserInputState.Begin then
            print("Q")
        end
    end, false, Enum.KeyCode.Q)
    ContextActionService:BindActionAtPriority("SkillW", function(_, inputState)
        if inputState == Enum.UserInputState.Begin then
            print("W")
        end
        return Enum.ContextActionResult.Sink --Sink the input, so it doesn't move the character
    end, false, Enum.ContextActionPriority.High.Value, Enum.KeyCode.W)
    ContextActionService:BindAction("SkillE", function(_, inputState)
        if inputState == Enum.UserInputState.Begin then
            print("E")
        end
    end, false, Enum.KeyCode.E)
    ContextActionService:BindAction("SkillR", function(_, inputState)
        if inputState == Enum.UserInputState.Begin then
            print("R")
        end
    end, false, Enum.KeyCode.R)
    ContextActionService:BindAction("SkillMB", function(_, inputState)
        if inputState == Enum.UserInputState.Begin then
            print("MB")
        end
    end, false, Enum.UserInputType.MouseButton2)
end

--Disable's default Arrow movement. Courtesy of https://devforum.roblox.com/t/how-do-you-make-movement-only-based-off-of-was-and-space-bar/528219/4
local Arguments = {false, 
Enum.ContextActionPriority.High.Value, 
Enum.KeyCode.Up, 
Enum.KeyCode.Down, 
Enum.KeyCode.Left, 
Enum.KeyCode.Right}

ContextActionService:BindActionAtPriority("DisableArrowMovement", function()
	return Enum.ContextActionResult.Sink 
end, unpack(Arguments))