-- more = requires better pc but gains more money

local Loops = 100

if shared.booster then shared.booster = false return end

if gethiddenproperty(game.Players.LocalPlayer, "SimulationRadius") ~= math.huge then

    game["Run Service"].RenderStepped:connect(

       function()

           setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)

           game.Players.LocalPlayer.SimulationRadius = math.huge * math.huge, math.huge * math.huge * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0

       end

    )

    

    local player = game.Players.LocalPlayer

    player.SimulationRadiusChanged:Connect(function(radius)

       radius = 9e9

       return radius

    end)

end

local function getTycoon()

    local player = game.Players.LocalPlayer

    for _, tycoon in next, workspace.Tycoons:GetChildren() do

        if not tycoon.Name:match(player.Name) then continue end

        return tycoon

    end

    

    return false

end

local tycoon = getTycoon()

if not tycoon then return end

shared.booster = true

local function getUpgraders()

    local found = {}

    for _, upgrader in next, tycoon.Bought:GetChildren() do

        if not upgrader.Name:match("Upgrader") then continue end

        table.insert(found, upgrader)

    end

    

    return found

end

while shared.booster do

    local upgraders = getUpgraders()

    for _, part in next, tycoon.DropsParts:GetChildren() do

        for _=1, Loops do

            for _, upgrader in next, upgraders do

                firetouchinterest(part, upgrader.MainPart, 1)

                firetouchinterest(part, upgrader.MainPart, 0)

            end

        end

    end

    task.wait()

end
