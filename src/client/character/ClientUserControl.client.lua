--[[
    ClientUserControl.client.lua
    
    @description: Contains the logic for player control in the client.
    @author: NINJAMASTR999
]]

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local Character = script.Parent
local Humanoid = Character:WaitForChild("Humanoid") --Not sure if it'll load at the correct time, so wait.

local function getCharacterFilter()
    local IgnoreList = RaycastParams.new()
    IgnoreList.FilterDescendantsInstances = {Character}
    IgnoreList.FilterType = Enum.RaycastFilterType.Blacklist
    return IgnoreList
end

local function getMouseLocationInWorldSpace()
    if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
        local MouseSpace = UserInputService:GetMouseLocation()
        local Ray = Camera:ViewportPointToRay(MouseSpace.X, MouseSpace.Y, 0) --Not sure what depth does lmao
        local Obstruction = Workspace:Raycast(Ray.Origin, Ray.Direction * 100, getCharacterFilter())
        if Obstruction then
            Humanoid:MoveTo(Obstruction.Position)
        end
    end
end

if UserInputService.MouseEnabled then
    RunService.RenderStepped:Connect(getMouseLocationInWorldSpace)
end