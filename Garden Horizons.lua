local success, err = pcall(function()
    local url = "https://fitri324.pythonanywhere.com/Garden_Horizons_Freemium.lua/raw"
    
    local code = game:HttpGet(url)
    
    local func, compileErr = loadstring(code)
    if func then
        print("[Script] Script berhasil di-compile, menjalankan...")
        func()
        print("[Script] Script selesai dijalankan!")
    else
        warn(tostring(compileErr))
    end
end)

if not success then
    print("[Script] Error: " .. tostring(err))
end
