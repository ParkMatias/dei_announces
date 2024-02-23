ESX = exports['es_extended']:getSharedObject()
local isallowed = false
local allowedJobs = Config.allowedJobs

RegisterCommand('ad', function(source, args)
    Ad(args)
end, false)

function Ad(args)
    local mensaje = ''
    local playerJob = ESX.GetPlayerData().job.name

    if playerJob == nil then
        playerJob = 'desconocido'
    end

    for _, v in pairs(allowedJobs) do
        if v == playerJob then
            isallowed = true
        end
    end

    if isallowed then
        if args[1] ~= nil then
            if args[1] ~= '' then
                if string.len(args[1]) < 50 then
                    if string.len(args[1]) > 17 then
                        local first = string.sub(args[1], 1, 17)
                        local second = string.sub(args[1], 17 + 1, 17 * 2)
                        local third = string.sub(args[1], 17 * 2 + 1, 17 * 3)
                        local fourth = string.sub(args[1], 17 * 3 + 1)
                        mensaje = first .. '\n' .. second .. '\n' .. third .. '\n' .. fourth
                    else
                        mensaje = table.concat(args, ' ')
                    end
                    SendNUIMessage({
                        action = 'showAnnounce',
                        announce = tostring(mensaje),
                        job = playerJob
                    })
                else
                    ESX.ShowNotification('El mensaje es demasiado largo.')
                end
            else
                ESX.ShowNotification('Debes escribir un mensaje.')
            end
        else
            ESX.ShowNotification('Debes escribir un mensaje.')
        end
    else
        ESX.ShowNotification('No tienes permiso para enviar este anuncio.')
    end
end