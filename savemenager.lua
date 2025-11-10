--// Auto Save Manager (tanpa UI)
local HttpService = game:GetService("HttpService")

local SaveManager = {}
SaveManager.Folder = "MyScriptHub/specific-game"
SaveManager.SubFolder = "Lobby"
SaveManager.FileName = "autosave.json"
SaveManager.Library = nil

-- Fungsi bantu
local function safeIsFolder(path)
    local ok, result = pcall(isfolder, path)
    return ok and result or false
end

local function safeIsFile(path)
    local ok, result = pcall(isfile, path)
    return ok and result or false
end

local function safeWrite(path, data)
    pcall(writefile, path, data)
end

local function safeRead(path)
    local ok, result = pcall(readfile, path)
    return ok and result or nil
end

local function makeDirs(folder)
    if not safeIsFolder(folder) then
        local parts = string.split(folder, "/")
        local current = ""
        for _, part in ipairs(parts) do
            current = current .. part
            if not safeIsFolder(current) then
                pcall(makefolder, current)
            end
            current = current .. "/"
        end
    end
end

function SaveManager:SetLibrary(lib)
    self.Library = lib
end

function SaveManager:GetPath()
    local folder = self.Folder .. "/settings/" .. self.SubFolder
    makeDirs(folder)
    return folder .. "/" .. self.FileName
end

-- Simpan semua toggle & option
function SaveManager:Save()
    if not self.Library then return end
    local data = { objects = {} }

    for idx, toggle in pairs(self.Library.Toggles or {}) do
        table.insert(data.objects, { idx = idx, value = toggle.Value, type = "Toggle" })
    end

    for idx, option in pairs(self.Library.Options or {}) do
        table.insert(data.objects, { idx = idx, value = option.Value, type = option.Type })
    end

    local json = HttpService:JSONEncode(data)
    safeWrite(self:GetPath(), json)
end

-- Muat ulang semua toggle & option
function SaveManager:Load()
    if not self.Library then return end
    local filePath = self:GetPath()
    if not safeIsFile(filePath) then return end

    local content = safeRead(filePath)
    if not content then return end

    local success, data = pcall(function() return HttpService:JSONDecode(content) end)
    if not success or not data.objects then return end

    for _, v in ipairs(data.objects) do
        if v.type == "Toggle" and self.Library.Toggles[v.idx] then
            self.Library.Toggles[v.idx]:SetValue(v.value)
        elseif self.Library.Options[v.idx] then
            self.Library.Options[v.idx]:SetValue(v.value)
        end
    end
end

-- Auto Save setiap beberapa detik
function SaveManager:AutoSave(interval)
    interval = interval or 30
    task.spawn(function()
        while task.wait(interval) do
            self:Save()
        end
    end)
end

-- Auto Load di awal
function SaveManager:AutoLoadOnStart()
    task.defer(function()
        self:Load()
    end)
end

return SaveManager
