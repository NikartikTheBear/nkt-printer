exports('doc', function(data, slot)
    exports.ox_inventory:useItem(data, function(data)
        if data then
           if data.metadata.link then
            SendNUIMessage({
                type = "display",
                open = true,
                link = data.metadata.link
            })
            SetNuiFocus(true, true)
           end
        end
    end)
end)

local models = {
    `prop_printer_01`,
    `prop_printer_02`,
    `v_res_printer`
}

local groups
if Config.Esx then
    groups  = Config.Esx.AllowedJobs
else
     groups = nil
end
exports.ox_target:addModel(models, {
    {
        name = "print",
        label = "Print Document",
        icon = "fas fa-print",
        groups = groups,
        onSelect = function()
            SendNUIMessage({
                type = "print",
                open = true
            })
            SetNuiFocus(true, true)
        end
    }
})


RegisterNUICallback("print", function(data, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent("printer:server:printItem",data)
    cb({})
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    cb({})
end)

