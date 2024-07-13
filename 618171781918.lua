
function logMessage(testName, status, details)
    local statusEmoji = ""
    if status == "yes" then
        statusEmoji = "✅"
    elseif status == "no" then
        statusEmoji = "❌"
    elseif status == "medium" then
        statusEmoji = "⚠️"
    else
        statusEmoji = "❓"
    end

    print(string.format("%s %s: %s", statusEmoji, testName, details))
end


function testVulnerabilities()
    local testName = "Vulnerabilità Test"
    

    local httpService = game:GetService("HttpService")
    if httpService and httpService.GetAsync then
        logMessage(testName, "medium", "HttpService e GetAsync disponibili. Verifica se HTTP è sicuro.")
    else
        logMessage(testName, "no", "HttpService o GetAsync non disponibili.")
    end


    local dangerousFunctions = {"require", "loadstring", "getfenv", "setfenv", "debug", "os"}
    local hasDangerousFunctions = false

    for _, func in ipairs(dangerousFunctions) do
        if _G[func] then
            logMessage(testName, "medium", "Funzione potenzialmente pericolosa disponibile: " .. func)
            hasDangerousFunctions = true
        end
    end
    
    if not hasDangerousFunctions then
        logMessage(testName, "yes", "Nessuna funzione pericolosa trovata nel contesto globale.")
    end


    local testObject = Instance.new("Part")
    testObject.Parent = game.Workspace
    local originalName = testObject.Name
    
    pcall(function()
        testObject.Name = "ModifiedName"
    end)
    
    if testObject.Name ~= originalName then
        logMessage(testName, "medium", "Possibilità di modificare le proprietà degli oggetti di gioco.")
        testObject.Name = originalName
    else
        logMessage(testName, "yes", "Le proprietà degli oggetti di gioco sono sicure da modificare.")
    end


    local remoteFunctions = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteFunction") or obj:IsA("RemoteEvent") then
            table.insert(remoteFunctions, obj)
        end
    end
    
    if #remoteFunctions > 0 then
        logMessage(testName, "medium", "Sono state trovate RemoteFunction/RemoteEvent. Assicurati che siano sicuri.")
    else
        logMessage(testName, "yes", "Nessun RemoteFunction/RemoteEvent trovato.")
    end
end


testVulnerabilities()
