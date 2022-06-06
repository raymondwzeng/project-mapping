--[[
    ClientCamera.client.lua

    @description: Contains the logic for client side camera
    @author: NINJAMASTR999
]]

local RunService = game:GetService("RunService")

local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera --Consider using just .Camera?
local Character = script.Parent

Camera.CameraType = Enum.CameraType.Scriptable

local function followLocalCharacter()
    Camera.CFrame = CFrame.new(Character:GetPrimaryPartCFrame().p + Vector3.new(0, 20, 0)) -- It's important for the CFrame, otherwise we end up with rotating the camera on strafe
    Camera.CFrame = Camera.CFrame:ToWorldSpace(CFrame.Angles(math.rad(-70), 0, 0))
end

RunService:BindToRenderStep("followLocalCharacter", Enum.RenderPriority.Camera.Value - 1, followLocalCharacter)