function StartPayCheck()
    CreateThread(function()
        while true do
            Wait(Config.PaycheckInterval)
            for player, xPlayer in pairs(ESX.Players) do
                local jobLabel = xPlayer.job.label
                local job = xPlayer.job.grade_name
                local salary = xPlayer.job.grade_salary

                if salary > 0 then
                    if job == "unemployed" then -- unemployed
                        xPlayer.addAccountMoney("bank", salary, "Welfare Check")
                        lib.notify(xPlayer.source, {
                            title = TranslateCap('bank'),
                            description = TranslateCap("received_paycheck").. '  \n'..TranslateCap("received_help", salary),
                            duration = 5000,
                        })
                        if Config.LogPaycheck then
                            ESX.DiscordLogFields("Paycheck", "Paycheck - Unemployment Benefits", "green", {
                                { name = "Player", value = xPlayer.name, inline = true },
                                { name = "ID", value = xPlayer.source, inline = true },
                                { name = "Amount", value = salary, inline = true },
                            })
                        end
                    elseif Config.EnableSocietyPayouts then -- possibly a society
                        TriggerEvent("esx_society:getSociety", xPlayer.job.name, function(society)
                            if society ~= nil then -- verified society
                                TriggerEvent("esx_addonaccount:getSharedAccount", society.account, function(account)
                                    if account.money >= salary then -- does the society money to pay its employees?
                                        xPlayer.addAccountMoney("bank", salary, "Paycheck")
                                        account.removeMoney(salary)
                                        if Config.LogPaycheck then
                                            ESX.DiscordLogFields("Paycheck", "Paycheck - " .. jobLabel, "green", {
                                                { name = "Player", value = xPlayer.name, inline = true },
                                                { name = "ID", value = xPlayer.source, inline = true },
                                                { name = "Amount", value = salary, inline = true },
                                            })
                                        end
                                        lib.notify(xPlayer.source, {
                                            title = TranslateCap('bank'),
                                            description = TranslateCap("received_paycheck").. '  \n'..TranslateCap("received_help", salary),
                                            duration = 5000,
                                        })
                                    else
                                        lib.notify(xPlayer.source, {
                                            title = TranslateCap('bank'),
                                            description = TranslateCap("company_nomoney"),
                                            duration = 5000,
                                        })
                                    end
                                end)
                            else -- not a society
                                xPlayer.addAccountMoney("bank", salary, "Paycheck")
                                if Config.LogPaycheck then
                                    ESX.DiscordLogFields("Paycheck", "Paycheck - " .. jobLabel, "green", {
                                        { name = "Player", value = xPlayer.name, inline = true },
                                        { name = "ID", value = xPlayer.source, inline = true },
                                        { name = "Amount", value = salary, inline = true },
                                    })
                                end
                                lib.notify(xPlayer.source, {
                                    title = TranslateCap('bank'),
                                    description = TranslateCap("received_paycheck").. '  \n'..TranslateCap("received_help", salary),
                                    duration = 5000,
                                })
                            end
                        end)
                    else -- generic job
                        xPlayer.addAccountMoney("bank", salary, "Paycheck")
                        if Config.LogPaycheck then
                            ESX.DiscordLogFields("Paycheck", "Paycheck - Generic", "green", {
                                { name = "Player", value = xPlayer.name, inline = true },
                                { name = "ID", value = xPlayer.source, inline = true },
                                { name = "Amount", value = salary, inline = true },
                            })
                        end
                        lib.notify(xPlayer.source, {
                            title = TranslateCap('bank'),
                            description = TranslateCap("received_paycheck").. '  \n'..TranslateCap("received_help", salary),
                            duration = 5000,
                        })
                    end
                end
            end
        end
    end)
end
