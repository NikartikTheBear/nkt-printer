RegisterNetEvent("printer:server:printItem", function(data)
    local source = source
    local image
    local name 
    local item = exports.ox_inventory:GetItem(source, "paper").count
    if item >= 1 then
        if Config.Esx then
            local xPlayer = ESX.GetPlayerFromId(source)
            local job = xPlayer.job.name
            image = Config.Esx.Images[job]
            name = xPlayer.name.." - "..job
        else
            name = GetPlayerName(source)
            if string.match(data.title, "MED") then image = "ambulance_doc" end
            if string.match(data.title, "POL") then image = "police_doc" end
        end
        exports.ox_inventory:RemoveItem(source, "paper", 1)
        exports.ox_inventory:AddItem(source, "doc", 1, {
            label = data.title,
            description = data.desc.."\n\nMade by: "..name.."\n\nDate: "..os.date("%d/%m/%Y"),
            image = image,
            link = data.link
        })
    end
end)