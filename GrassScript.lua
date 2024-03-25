local Players = game:GetService("Players")
local object = script.Parent;
local restPos = object.Position;
local velocity = object.Velocity;
local gravity = workspace.Gravity;
local bodyForce = Instance.new("BodyVelocity", object); -- Creating a BodyForce.
bodyForce.Velocity = Vector3.new(0, 0, 0); -- Setting the force to have no impact at the moment I create it.

function returnPos()
	local currPos = object.Position;
	
	local numX = currPos.X - restPos.X;
	local numY = currPos.Y - restPos.Y;
	local numZ = currPos.Z - restPos.Z;
	
		bodyForce.Velocity = Vector3.new(numX * (-0.1), numY * (-0.1), numZ * (-0.1))
	
end

function pushPos(character)
	local currPos = object.Position;
	
	local numX = (currPos.X - character.HumanoidRootPart.Position.X);
	local numY = (currPos.Y - character.HumanoidRootPart.Position.Y);
	local numZ = (currPos.Z - character.HumanoidRootPart.Position.Z);
	
	local scaleX = (numX)/(math.abs(numX));
	local scaleY = (numY)/(math.abs(numY));
	local scaleZ = (numZ)/(math.abs(numZ));
	
	if (1 < math.abs(currPos.X - restPos.X)) or
		(1 < math.abs(currPos.Z - restPos.Z))
	then
		bodyForce.Velocity = Vector3.new(0,0,0);
	else
		bodyForce.Velocity = Vector3.new(scaleX * (2), scaleY * (0.01), scaleZ * (2));
	end
		
	--print(currPos.Z);
	--print(restPos.Z);
	--print(math.abs(currPos.X - restPos.X));
	--print(math.abs(currPos.Y - restPos.Y));
	--print(math.abs(currPos.Z - restPos.Z));
	
	print(1 > math.abs(currPos.X - restPos.X));
	print(1 > math.abs(currPos.Z - restPos.Z));
	
end

while true do
	wait(0.1)
	for _, player in ipairs(Players:GetPlayers()) do
		
	local character = player.Character
	local distance = player:DistanceFromCharacter(object.Position)
		
		if not (character) or (distance > 4)
		then 
			returnPos();
		else
			print("goog2")
			
			pushPos(character);
		end

	end
	

end