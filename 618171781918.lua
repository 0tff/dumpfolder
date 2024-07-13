-- Funzione per loggare i risultati con emoji
function logMessage(testName, status, details)
    local statusEmoji = status == "yes" and "✅" or "❌"
    print(string.format("%s %s: %s", statusEmoji, testName, details))
end

-- Funzione per testare vulnerabilità
function testVulnerabilities()
    local testName = "Vulnerabilità Test"

    -- Test 1: Verifica la disponibilità di HttpService
    local httpService = game:GetService("HttpService")
    if httpService then
        logMessage(testName, "yes", "HttpService disponibile.")
    else
        logMessage(testName, "no", "HttpService non disponibile.")
    end

    -- Test 2: Verifica se ci sono funzioni pericolose nel contesto globale
    local dangerousFunctions = {"require", "loadstring"}
    local foundDangerous = false

    for _, func in ipairs(dangerousFunctions) do
        if _G[func] then
            logMessage(testName, "yes", "Funzione pericolosa trovata: " .. func)
            foundDangerous = true
        end
    end

    if not foundDangerous then
        logMessage(testName, "no", "Nessuna funzione pericolosa trovata.")
    end
end

-- Esegui il test
testVulnerabilities()
