local _Players = game:GetService("Players")
local _LocalPlayer = _Players.LocalPlayer

local _config = {
	distance = 5, -- ระยะ
	delay = 0.2 -- ดีเลย์
}

local _v = function (_player)
	local _humanoidRootPart = _player.Character.HumanoidRootPart
	local _newPosition = _LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -_config.distance)
	local _seat = _player.Character.Humanoid.SeatPart

	if _seat then
		_seat.CFrame = _newPosition
	else
		_humanoidRootPart.CFrame = _newPosition
	end

	local _humanoid = _player.Character:FindFirstChildOfClass("Humanoid")
	if _humanoid then
		_humanoid.WalkSpeed = 0
	end
end

while true do
	for _, _player in ipairs(_Players:GetPlayers()) do
		if _player ~= _LocalPlayer and _player.Character and _player.Character:FindFirstChild("HumanoidRootPart") then
			_v(_player)
		end
	end
	task.wait(_config.delay)
end
