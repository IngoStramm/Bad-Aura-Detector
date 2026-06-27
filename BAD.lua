local ADDON_NAME = ...

local Bad = CreateFrame("Frame", "BADFrame")
Bad.name = "BAD"

local LOCALE = GetLocale and GetLocale() or "enUS"

local L = {
    ADDON_TITLE = "BAD",
    ADDON_LONG = "Bad Aura Detector",
    LOADED = "loaded. Use /bad config or /bad help.",
    ENABLED = "enabled.",
    DISABLED = "disabled.",
    HELP_HEADER = "BAD commands:",
    HELP_CONFIG = "/bad config - open options",
    HELP_TEST = "/bad test - play the alert sound",
    HELP_ON = "/bad on - enable alerts",
    HELP_OFF = "/bad off - disable alerts",
    HELP_STATUS = "/bad status - show current settings",
    HELP_SOUND = "/bad sound [next|decursive|bell|raid|ready|deadly] - set alert sound",
    HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - set the minimum time between sounds",
    HELP_CHAT = "/bad chat - toggle chat messages",
    HELP_DEBUG = "/bad debug - toggle debug messages",
    HELP_COMBAT = "/bad combat - toggle combat-only alerts",
    STATUS = "Status",
    OPTIONS = "Options",
    CLOSE = "Close",
    TEST_SOUND = "Test sound",
    RESET_DEFAULTS = "Reset defaults",
    ENABLE_ADDON = "Enable alerts",
    IGNORE_PETS = "Ignore pets",
    IGNORE_DEAD = "Ignore dead/offline units",
    ONLY_COMBAT = "Only alert in combat",
    CHAT_MESSAGES = "Print chat message",
    REQUIRE_KNOWN = "Require known spell",
    REQUIRE_USABLE = "Require usable spell",
    CHECK_COOLDOWN = "Require spell off cooldown",
    ADVANCED = "Advanced",
    SOUND = "Sound",
    NORMAL_SOUND = "Normal sound",
    DANGEROUS_SOUND = "Danger sound",
    COOLDOWN = "Sound interval",
    SECONDS = "sec",
    PREVIOUS = "Previous",
    NEXT = "Next",
    DEBUG = "Debug chat messages",
    TYPE_MAGIC = "Magic",
    TYPE_CURSE = "Curse",
    TYPE_POISON = "Poison",
    TYPE_DISEASE = "Disease",
    SOUND_DECURSIVE = "Decursive affliction",
    SOUND_BELL = "Bell",
    SOUND_RAID = "Raid warning",
    SOUND_READY = "Ready check",
    SOUND_DEADLY = "Decursive deadly",
    UNKNOWN_SOUND = "Unknown sound:",
    SOUND_SET = "Sound set to:",
    COOLDOWN_SET = "Minimum time between sounds set to %d seconds.",
    CHAT_ON = "Chat messages enabled.",
    CHAT_OFF = "Chat messages disabled.",
    DEBUG_ON = "Debug enabled.",
    DEBUG_OFF = "Debug disabled.",
    COMBAT_ON = "Combat-only alerts enabled.",
    COMBAT_OFF = "Combat-only alerts disabled.",
    ALERT_FORMAT = "%s has removable %s: %s",
    DANGEROUS_FORMAT = "Dangerous dispel warning: %s has %s.",
    NONE = "None",
    CLASS_UNSUPPORTED = "Your class has no configured defensive dispel in BAD.",
    NO_DISPEL = "No removable debuff found.",
    SPELL_LOCKED = "No known dispel spell for this debuff type.",
}

if LOCALE == "ptBR" then
    L = {
        ADDON_TITLE = "BAD",
        ADDON_LONG = "Bad Aura Detector",
        LOADED = "carregado. Use /bad config ou /bad help.",
        ENABLED = "ativado.",
        DISABLED = "desativado.",
        HELP_HEADER = "Comandos do BAD:",
        HELP_CONFIG = "/bad config - abrir opcoes",
        HELP_TEST = "/bad test - tocar o som de alerta",
        HELP_ON = "/bad on - ativar alertas",
        HELP_OFF = "/bad off - desativar alertas",
        HELP_STATUS = "/bad status - mostrar configuracao atual",
        HELP_SOUND = "/bad sound [next|decursive|bell|raid|ready|deadly] - escolher som",
        HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - definir tempo minimo entre sons",
        HELP_CHAT = "/bad chat - alternar mensagens no chat",
        HELP_DEBUG = "/bad debug - alternar mensagens de debug",
        HELP_COMBAT = "/bad combat - alternar alertas apenas em combate",
        STATUS = "Status",
        OPTIONS = "Opcoes",
        CLOSE = "Fechar",
        TEST_SOUND = "Testar som",
        RESET_DEFAULTS = "Restaurar padroes",
        ENABLE_ADDON = "Ativar alertas",
        IGNORE_PETS = "Ignorar pets",
        IGNORE_DEAD = "Ignorar mortos/offline",
        ONLY_COMBAT = "Alertar apenas em combate",
        CHAT_MESSAGES = "Mostrar mensagem no chat",
        REQUIRE_KNOWN = "Exigir spell conhecida",
        REQUIRE_USABLE = "Exigir spell usavel",
        CHECK_COOLDOWN = "Exigir spell fora do cooldown",
        ADVANCED = "Avancado",
        SOUND = "Som",
        NORMAL_SOUND = "Som normal",
        DANGEROUS_SOUND = "Som de perigo",
        COOLDOWN = "Intervalo do som",
        SECONDS = "s",
        PREVIOUS = "Anterior",
        NEXT = "Proximo",
        DEBUG = "Mensagens de debug no chat",
        TYPE_MAGIC = "Magia",
        TYPE_CURSE = "Maldicao",
        TYPE_POISON = "Veneno",
        TYPE_DISEASE = "Doenca",
        SOUND_DECURSIVE = "Aflicao do Decursive",
        SOUND_BELL = "Sino",
        SOUND_RAID = "Aviso de raid",
        SOUND_READY = "Ready check",
        SOUND_DEADLY = "Perigo do Decursive",
        UNKNOWN_SOUND = "Som desconhecido:",
        SOUND_SET = "Som definido:",
        COOLDOWN_SET = "Tempo minimo entre sons definido para %d segundos.",
        CHAT_ON = "Mensagens no chat ativadas.",
        CHAT_OFF = "Mensagens no chat desativadas.",
        DEBUG_ON = "Debug ativado.",
        DEBUG_OFF = "Debug desativado.",
        COMBAT_ON = "Alertas apenas em combate ativados.",
        COMBAT_OFF = "Alertas apenas em combate desativados.",
        ALERT_FORMAT = "%s tem %s removivel: %s",
        DANGEROUS_FORMAT = "Aviso de dispel perigoso: %s tem %s.",
        NONE = "Nenhum",
        CLASS_UNSUPPORTED = "Sua classe nao tem dispel defensivo configurado no BAD.",
        NO_DISPEL = "Nenhum debuff removivel encontrado.",
        SPELL_LOCKED = "Nenhuma spell conhecida para este tipo de debuff.",
    }
end

local TYPE_LABELS = {
    Magic = L.TYPE_MAGIC,
    Curse = L.TYPE_CURSE,
    Poison = L.TYPE_POISON,
    Disease = L.TYPE_DISEASE,
}

local DEFAULT_DB = {
    version = 1,
    enabled = true,
    ignorePets = true,
    ignoreDeadOffline = true,
    onlyCombat = false,
    chat = false,
    debug = false,
    sound = "decursive",
    dangerousSound = "deadly",
    cooldown = 5,
    requireKnownSpell = true,
    requireUsableSpell = false,
    checkSpellCooldown = false,
    warnDangerous = true,
}

local SOUND_ORDER = { "decursive", "bell", "raid", "ready", "deadly" }
local COOLDOWN_OPTIONS = { 1, 3, 5, 10, 15, 30 }

local SOUND_OPTIONS = {
    decursive = {
        label = L.SOUND_DECURSIVE,
        file = "Interface\\AddOns\\Decursive\\Sounds\\AfflictionAlert.ogg",
        fallbackKit = "RAID_WARNING",
    },
    bell = {
        label = L.SOUND_BELL,
        file = "Sound\\Doodad\\BellTollAlliance.ogg",
        fallbackKit = "IG_MAINMENU_OPTION_CHECKBOX_ON",
    },
    raid = {
        label = L.SOUND_RAID,
        kit = "RAID_WARNING",
        fallback = 895,
    },
    ready = {
        label = L.SOUND_READY,
        kit = "READY_CHECK",
        fallback = 896,
    },
    deadly = {
        label = L.SOUND_DEADLY,
        file = "Interface\\AddOns\\Decursive\\Sounds\\G_NecropolisWound-fast.ogg",
        fallbackKit = "RAID_WARNING",
    },
}

local CLASS_DISPELS = {
    DRUID = {
        Curse = { 2782 },
        Poison = { 8946, 2893 },
    },
    MAGE = {
        Curse = { 475 },
    },
    PALADIN = {
        Magic = { 4987 },
        Poison = { 1152, 4987 },
        Disease = { 1152, 4987 },
    },
    PRIEST = {
        Magic = { 527, 988 },
        Disease = { 528, 552 },
    },
    SHAMAN = {
        Poison = { 526, 8166 },
        Disease = { 2870, 8170 },
    },
    WARLOCK = {
        Magic = { 19505 },
    },
}

local DANGEROUS_DEBUFFS = {
    [30108] = true, -- Unstable Affliction
    [30404] = true,
    [30405] = true,
}

local DANGEROUS_NAMES = {
    ["Unstable Affliction"] = true,
    ["Afligimento Instavel"] = true,
    ["Aflicao Instavel"] = true,
}

local db
local playerClass
local activeDebuffs = {}
local lastSoundTime = 0
local scanQueued = false
local optionsFrame
local interfacePanel
local settingsCategory
local standaloneWindow

local function CopyDefaults(source)
    local copy = {}
    for key, value in pairs(source) do
        if type(value) == "table" then
            copy[key] = CopyDefaults(value)
        else
            copy[key] = value
        end
    end
    return copy
end

local function MergeDefaults(target, defaults)
    if type(target) ~= "table" then
        target = {}
    end

    for key, value in pairs(defaults) do
        if type(value) == "table" then
            target[key] = MergeDefaults(target[key], value)
        elseif target[key] == nil then
            target[key] = value
        end
    end

    return target
end

local function GetCooldownLabel(value)
    return tostring(tonumber(value) or DEFAULT_DB.cooldown) .. " " .. L.SECONDS
end

local function IsAllowedCooldown(value)
    value = tonumber(value)
    for _, option in ipairs(COOLDOWN_OPTIONS) do
        if option == value then
            return true
        end
    end
    return false
end

local function NormalizeCooldown(value)
    value = tonumber(value) or DEFAULT_DB.cooldown
    local closest = COOLDOWN_OPTIONS[1]
    local closestDistance = math.abs(value - closest)

    for _, option in ipairs(COOLDOWN_OPTIONS) do
        local distance = math.abs(value - option)
        if distance < closestDistance then
            closest = option
            closestDistance = distance
        end
    end

    return closest
end

local function EnsureDb()
    if type(BADDB) ~= "table" then
        BADDB = CopyDefaults(DEFAULT_DB)
    else
        BADDB = MergeDefaults(BADDB, DEFAULT_DB)
    end

    db = BADDB
    db.ignoreDeadOffline = true
    db.requireKnownSpell = true
    db.requireUsableSpell = false
    db.checkSpellCooldown = false
    db.warnDangerous = true
    if not SOUND_OPTIONS[db.sound] then
        db.sound = DEFAULT_DB.sound
    end
    if not SOUND_OPTIONS[db.dangerousSound] then
        db.dangerousSound = DEFAULT_DB.dangerousSound
    end
    db.cooldown = NormalizeCooldown(db.cooldown)
    db.alertPlayer = nil
    db.alertGroup = nil
    db.alertRaid = nil
    db.types = nil
    return db
end

local function Print(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff33ff99BAD|r: " .. tostring(message))
end

local function Debug(message)
    if db and db.debug then
        Print(L.DEBUG .. ": " .. tostring(message))
    end
end

local function BoolText(value)
    return value and "on" or "off"
end

local function GetSoundKit(kitName, fallback)
    if SOUNDKIT and kitName and SOUNDKIT[kitName] then
        return SOUNDKIT[kitName]
    end
    return fallback
end

local function PlaySoundKit(kitName, fallback)
    local kit = GetSoundKit(kitName, fallback)
    if kit and PlaySound then
        PlaySound(kit, "Master")
        return true
    end
    return false
end

local function PlaySoundOption(soundKey)
    local option = SOUND_OPTIONS[soundKey] or SOUND_OPTIONS.decursive
    if option.file and PlaySoundFile then
        local ok = PlaySoundFile(option.file, "Master")
        if ok then
            return true
        end
    end

    if option.kit then
        return PlaySoundKit(option.kit, option.fallback)
    end

    if option.fallbackKit then
        return PlaySoundKit(option.fallbackKit, option.fallback)
    end

    return false
end

function Bad:PlayAlertSound(force, soundKey)
    local now = GetTime and GetTime() or 0
    if not force and db.cooldown and db.cooldown > 0 and now - lastSoundTime < db.cooldown then
        Debug("sound throttled")
        return false
    end

    lastSoundTime = now
    return PlaySoundOption(soundKey or db.sound)
end

local function SafeIsSpellKnown(spellID)
    if not spellID then
        return false
    end

    if IsPlayerSpell then
        local ok, known = pcall(IsPlayerSpell, spellID)
        if ok and known then
            return true
        end
    end

    if IsSpellKnown then
        local ok, known = pcall(IsSpellKnown, spellID)
        if ok and known then
            return true
        end

        ok, known = pcall(IsSpellKnown, spellID, true)
        if ok and known then
            return true
        end
    end

    if C_Spell and C_Spell.IsSpellKnown then
        local ok, known = pcall(C_Spell.IsSpellKnown, spellID)
        if ok and known then
            return true
        end
    end

    return false
end

local function SafeIsSpellUsable(spellID)
    if not spellID then
        return false
    end

    if IsUsableSpell then
        local ok, usable = pcall(IsUsableSpell, spellID)
        if ok and usable then
            return true
        end
    end

    return false
end

local function SafeIsSpellReady(spellID)
    if not spellID then
        return false
    end

    if GetSpellCooldown then
        local ok, startTime, duration, enabled = pcall(GetSpellCooldown, spellID)
        if ok then
            if enabled == 0 then
                return false
            end
            if not startTime or startTime == 0 or not duration or duration <= 1.5 then
                return true
            end
            return false
        end
    end

    return true
end

local function GetKnownSpellForType(debuffType)
    local classSpells = playerClass and CLASS_DISPELS[playerClass]
    local spells = classSpells and classSpells[debuffType]

    if not spells then
        return nil
    end

    for _, spellID in ipairs(spells) do
        if SafeIsSpellKnown(spellID) then
            return spellID
        end
    end

    if not db.requireKnownSpell then
        return spells[1]
    end

    return nil
end

local function PlayerCanDispel(debuffType)
    if not debuffType then
        return false
    end

    local classSpells = playerClass and CLASS_DISPELS[playerClass]
    if not classSpells or not classSpells[debuffType] then
        return false
    end

    local spellID = GetKnownSpellForType(debuffType)
    if db.requireKnownSpell and not spellID then
        Debug(L.SPELL_LOCKED .. " " .. tostring(debuffType))
        return false
    end

    if db.requireUsableSpell and spellID and not SafeIsSpellUsable(spellID) then
        Debug("spell not usable: " .. tostring(spellID))
        return false
    end

    if db.checkSpellCooldown and spellID and not SafeIsSpellReady(spellID) then
        Debug("spell on cooldown: " .. tostring(spellID))
        return false
    end

    return true, spellID
end

local function UnitShouldBeScanned(unit)
    if not UnitExists or not UnitExists(unit) then
        return false
    end

    if UnitCanAssist and not UnitCanAssist("player", unit) then
        return false
    end

    if db.ignoreDeadOffline then
        if UnitIsDeadOrGhost and UnitIsDeadOrGhost(unit) then
            return false
        end
        if UnitIsConnected and not UnitIsConnected(unit) then
            return false
        end
    end

    return true
end

local function AddUnit(units, unit)
    units[#units + 1] = unit
end

local function BuildUnitList()
    local units = {}

    AddUnit(units, "player")
    if not db.ignorePets then
        AddUnit(units, "pet")
    end

    if IsInRaid and IsInRaid() then
        local count = GetNumGroupMembers and GetNumGroupMembers() or 40
        for i = 1, count do
            AddUnit(units, "raid" .. i)
            if not db.ignorePets then
                AddUnit(units, "raidpet" .. i)
            end
        end
    elseif IsInGroup and IsInGroup() then
        local count = GetNumSubgroupMembers and GetNumSubgroupMembers() or 4
        for i = 1, count do
            AddUnit(units, "party" .. i)
            if not db.ignorePets then
                AddUnit(units, "partypet" .. i)
            end
        end
    end

    return units
end

local function IsDangerousDebuff(name, spellID)
    if spellID and DANGEROUS_DEBUFFS[spellID] then
        return true
    end
    return name and DANGEROUS_NAMES[name] == true
end

local function GetUnitDisplayName(unit)
    if GetUnitName then
        return GetUnitName(unit, true) or unit
    end
    if UnitName then
        return UnitName(unit) or unit
    end
    return unit
end

local function GetUnitKey(unit)
    if UnitGUID then
        return UnitGUID(unit) or unit
    end
    return unit
end

local function FindRemovableDebuffs(unit)
    local alerts = {}

    if not UnitDebuff then
        return alerts
    end

    for index = 1, 40 do
        local name, _, _, debuffType, _, _, _, _, _, spellID = UnitDebuff(unit, index)
        if not name then
            return alerts
        end

        if debuffType and PlayerCanDispel(debuffType) then
            alerts[#alerts + 1] = {
                unit = unit,
                unitName = GetUnitDisplayName(unit),
                unitKey = GetUnitKey(unit),
                name = name,
                type = debuffType,
                spellID = spellID,
                dangerous = IsDangerousDebuff(name, spellID),
            }
        end
    end

    return alerts
end

local function GetAlertKey(alert)
    return tostring(alert.unitKey) .. ":" .. tostring(alert.spellID or alert.name) .. ":" .. tostring(alert.type)
end

local function PrintAlert(alert)
    local typeName = TYPE_LABELS[alert.type] or alert.type
    if alert.dangerous and db.warnDangerous then
        Print(L.DANGEROUS_FORMAT:format(alert.unitName, alert.name))
    elseif db.chat then
        Print(L.ALERT_FORMAT:format(alert.unitName, typeName, alert.name))
    end
end

function Bad:Scan()
    if not db or not db.enabled then
        return
    end

    if db.onlyCombat and UnitAffectingCombat and not UnitAffectingCombat("player") then
        return
    end

    local classSpells = playerClass and CLASS_DISPELS[playerClass]
    if not classSpells then
        Debug(L.CLASS_UNSUPPORTED)
        return
    end

    local current = {}
    local firstNewAlert

    for _, unit in ipairs(BuildUnitList()) do
        if UnitShouldBeScanned(unit) then
            local alerts = FindRemovableDebuffs(unit)
            for _, alert in ipairs(alerts) do
                local key = GetAlertKey(alert)
                current[key] = true

                if not activeDebuffs[key] and not firstNewAlert then
                    firstNewAlert = alert
                end
            end
        end
    end

    activeDebuffs = current

    if firstNewAlert then
        PrintAlert(firstNewAlert)
        local soundKey = firstNewAlert.dangerous and db.warnDangerous and db.dangerousSound or db.sound
        self:PlayAlertSound(false, soundKey)
    else
        Debug(L.NO_DISPEL)
    end
end

function Bad:QueueScan()
    if scanQueued then
        return
    end

    scanQueued = true

    if C_Timer and C_Timer.After then
        C_Timer.After(0.15, function()
            scanQueued = false
            Bad:Scan()
        end)
    else
        scanQueued = false
        Bad:Scan()
    end
end

local function CreateText(parent, text, size)
    local fs = parent:CreateFontString(nil, "OVERLAY", size or "GameFontNormal")
    fs:SetText(text)
    fs:SetJustifyH("LEFT")
    return fs
end

local function CreateButton(parent, text, width, height)
    local button = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    button:SetSize(width or 120, height or 24)
    button:SetText(text)
    return button
end

local function SetCheckboxLabel(check, text)
    if check.Text then
        check.Text:SetText(text)
    elseif check.text then
        check.text:SetText(text)
    else
        check.label = check:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        check.label:SetPoint("LEFT", check, "RIGHT", 2, 0)
        check.label:SetText(text)
    end
end

local function CreateCheckbox(parent, text, getter, setter)
    local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    check:SetSize(24, 24)
    SetCheckboxLabel(check, text)
    check.getter = getter
    check.setter = setter
    check:SetScript("OnClick", function(self)
        self.setter(self:GetChecked() and true or false)
        Bad:RefreshOptions()
        Bad:QueueScan()
    end)
    return check
end

local function GetSoundLabel(soundKey)
    local option = SOUND_OPTIONS[soundKey] or SOUND_OPTIONS.decursive
    return option.label
end

local function CreateSoundDropdown(parent, frameName, dbKey)
    if not UIDropDownMenu_Initialize or not UIDropDownMenu_CreateInfo or not UIDropDownMenu_AddButton or not UIDropDownMenu_SetWidth or not UIDropDownMenu_SetText then
        return nil
    end

    local ok, dropdown = pcall(CreateFrame, "Frame", frameName, parent, "UIDropDownMenuTemplate")
    if not ok or not dropdown then
        return nil
    end

    UIDropDownMenu_SetWidth(dropdown, 150)
    UIDropDownMenu_Initialize(dropdown, function(self, level)
        for _, key in ipairs(SOUND_ORDER) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = GetSoundLabel(key)
            info.checked = db[dbKey] == key
            info.func = function()
                db[dbKey] = key
                UIDropDownMenu_SetText(dropdown, GetSoundLabel(db[dbKey]))
                Bad:RefreshOptions()
                Bad:PlayAlertSound(true, key)
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)
    UIDropDownMenu_SetText(dropdown, GetSoundLabel(db[dbKey]))

    return dropdown
end

local function CreateCooldownDropdown(parent)
    if not UIDropDownMenu_Initialize or not UIDropDownMenu_CreateInfo or not UIDropDownMenu_AddButton or not UIDropDownMenu_SetWidth or not UIDropDownMenu_SetText then
        return nil
    end

    local ok, dropdown = pcall(CreateFrame, "Frame", "BADCooldownDropdown", parent, "UIDropDownMenuTemplate")
    if not ok or not dropdown then
        return nil
    end

    UIDropDownMenu_SetWidth(dropdown, 100)
    UIDropDownMenu_Initialize(dropdown, function(self, level)
        for _, value in ipairs(COOLDOWN_OPTIONS) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = GetCooldownLabel(value)
            info.checked = db.cooldown == value
            info.func = function()
                db.cooldown = value
                UIDropDownMenu_SetText(dropdown, GetCooldownLabel(db.cooldown))
                Bad:RefreshOptions()
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)
    UIDropDownMenu_SetText(dropdown, GetCooldownLabel(db.cooldown))

    return dropdown
end

local function CycleSound(direction)
    local currentIndex = 1
    for index, key in ipairs(SOUND_ORDER) do
        if key == db.sound then
            currentIndex = index
            break
        end
    end

    currentIndex = currentIndex + direction
    if currentIndex < 1 then
        currentIndex = #SOUND_ORDER
    elseif currentIndex > #SOUND_ORDER then
        currentIndex = 1
    end

    db.sound = SOUND_ORDER[currentIndex]
end

function Bad:CreateOptionsFrame()
    if optionsFrame then
        return optionsFrame
    end

    local frame = CreateFrame("Frame", "BADOptionsPanel", UIParent)
    frame.name = L.ADDON_TITLE
    frame:SetSize(640, 360)
    frame:Hide()

    local title = CreateText(frame, L.ADDON_TITLE .. " - " .. L.ADDON_LONG, "GameFontHighlightLarge")
    title:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -16)

    local testButton = CreateButton(frame, L.TEST_SOUND, 110, 24)
    testButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -282)
    testButton:SetScript("OnClick", function()
        Bad:PlayAlertSound(true)
    end)

    local resetButton = CreateButton(frame, L.RESET_DEFAULTS, 130, 24)
    resetButton:SetPoint("LEFT", testButton, "RIGHT", 8, 0)
    resetButton:SetScript("OnClick", function()
        BADDB = CopyDefaults(DEFAULT_DB)
        db = BADDB
        activeDebuffs = {}
        Bad:RefreshOptions()
        Bad:QueueScan()
    end)

    frame.checkboxes = {}
    local function AddCheckbox(text, x, y, getter, setter)
        local check = CreateCheckbox(frame, text, getter, setter)
        check:SetPoint("TOPLEFT", frame, "TOPLEFT", x, y)
        frame.checkboxes[#frame.checkboxes + 1] = check
        return check
    end

    AddCheckbox(L.ENABLE_ADDON, 16, -56, function() return db.enabled end, function(value) db.enabled = value end)
    AddCheckbox(L.IGNORE_PETS, 16, -86, function() return db.ignorePets end, function(value) db.ignorePets = value end)
    AddCheckbox(L.ONLY_COMBAT, 16, -116, function() return db.onlyCombat end, function(value) db.onlyCombat = value end)
    AddCheckbox(L.CHAT_MESSAGES, 16, -146, function() return db.chat end, function(value) db.chat = value end)

    local advancedTitle = CreateText(frame, L.ADVANCED, "GameFontNormalLarge")
    advancedTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 280, -56)

    AddCheckbox(L.DEBUG, 280, -84, function() return db.debug end, function(value) db.debug = value end)

    local soundTitle = CreateText(frame, L.NORMAL_SOUND, "GameFontNormalLarge")
    soundTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -194)

    frame.soundDropdown = CreateSoundDropdown(frame, "BADSoundDropdown", "sound")
    if frame.soundDropdown then
        frame.soundDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -216)
    else
        local prevSound = CreateButton(frame, L.PREVIOUS, 90, 24)
        prevSound:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -219)
        prevSound:SetScript("OnClick", function()
            CycleSound(-1)
            Bad:RefreshOptions()
            Bad:PlayAlertSound(true)
        end)

        local nextSound = CreateButton(frame, L.NEXT, 90, 24)
        nextSound:SetPoint("LEFT", prevSound, "RIGHT", 8, 0)
        nextSound:SetScript("OnClick", function()
            CycleSound(1)
            Bad:RefreshOptions()
            Bad:PlayAlertSound(true)
        end)
    end

    local dangerousSoundTitle = CreateText(frame, L.DANGEROUS_SOUND, "GameFontNormalLarge")
    dangerousSoundTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 208, -194)

    frame.dangerousSoundDropdown = CreateSoundDropdown(frame, "BADDangerousSoundDropdown", "dangerousSound")
    if frame.dangerousSoundDropdown then
        frame.dangerousSoundDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 198, -216)
    else
        frame.dangerousSoundValue = CreateText(frame, "", "GameFontHighlight")
        frame.dangerousSoundValue:SetPoint("TOPLEFT", frame, "TOPLEFT", 208, -222)
    end

    local cooldownTitle = CreateText(frame, L.COOLDOWN, "GameFontNormalLarge")
    cooldownTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 420, -194)

    frame.cooldownDropdown = CreateCooldownDropdown(frame)
    if frame.cooldownDropdown then
        frame.cooldownDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 410, -216)
    else
        frame.cooldownValue = CreateText(frame, "", "GameFontHighlight")
        frame.cooldownValue:SetPoint("TOPLEFT", frame, "TOPLEFT", 420, -222)
    end

    optionsFrame = frame
    return frame
end

function Bad:RefreshOptions()
    if not optionsFrame then
        return
    end

    for _, check in ipairs(optionsFrame.checkboxes or {}) do
        check:SetChecked(check.getter() and true or false)
    end

    if optionsFrame.soundValue then
        optionsFrame.soundValue:SetText(GetSoundLabel(db.sound))
    end

    if optionsFrame.soundDropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(optionsFrame.soundDropdown, GetSoundLabel(db.sound))
    end

    if optionsFrame.dangerousSoundDropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(optionsFrame.dangerousSoundDropdown, GetSoundLabel(db.dangerousSound))
    end

    if optionsFrame.dangerousSoundValue then
        optionsFrame.dangerousSoundValue:SetText(GetSoundLabel(db.dangerousSound))
    end

    if optionsFrame.cooldownDropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(optionsFrame.cooldownDropdown, GetCooldownLabel(db.cooldown))
    end

    if optionsFrame.cooldownValue then
        optionsFrame.cooldownValue:SetText(GetCooldownLabel(db.cooldown))
    end
end

function Bad:OpenOptions()
    self:CreateOptionsFrame()
    self:RefreshOptions()

    if not standaloneWindow then
        local ok, window = pcall(CreateFrame, "Frame", "BADStandaloneOptionsFrame", UIParent, "BasicFrameTemplateWithInset")
        if not ok then
            window = CreateFrame("Frame", "BADStandaloneOptionsFrame", UIParent)
        end
        window:SetSize(680, 430)
        window:SetPoint("CENTER")
        window:SetFrameStrata("FULLSCREEN_DIALOG")
        window:SetToplevel(true)
        window:EnableMouse(true)
        window:SetMovable(true)
        window:RegisterForDrag("LeftButton")
        window:SetScript("OnDragStart", window.StartMoving)
        window:SetScript("OnDragStop", window.StopMovingOrSizing)
        window:Hide()

        if UISpecialFrames then
            UISpecialFrames[#UISpecialFrames + 1] = "BADStandaloneOptionsFrame"
        end

        local title = CreateText(window, L.ADDON_TITLE, "GameFontHighlight")
        title:SetPoint("TOP", window, "TOP", 0, -6)

        local content = CreateFrame("Frame", nil, window)
        content:SetPoint("TOPLEFT", window, "TOPLEFT", 16, -32)
        content:SetPoint("BOTTOMRIGHT", window, "BOTTOMRIGHT", -16, 16)
        window.content = content

        standaloneWindow = window
    end

    optionsFrame:SetParent(standaloneWindow.content)
    optionsFrame:ClearAllPoints()
    optionsFrame:SetPoint("TOPLEFT", standaloneWindow.content, "TOPLEFT", 0, 0)
    optionsFrame:SetSize(640, 360)
    optionsFrame:Show()
    standaloneWindow:Show()
    standaloneWindow:Raise()
end

function Bad:RegisterInterfaceOptions()
    if interfacePanel then
        return
    end

    local panel = self:CreateOptionsFrame()
    interfacePanel = panel

    if Settings and Settings.RegisterCanvasLayoutCategory and Settings.RegisterAddOnCategory then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
        settingsCategory = category
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    end
end

local function PrintStatus()
    Print(L.STATUS .. ": " .. (db.enabled and L.ENABLED or L.DISABLED))
    Print(L.NORMAL_SOUND .. ": " .. GetSoundLabel(db.sound) .. " / " .. L.DANGEROUS_SOUND .. ": " .. GetSoundLabel(db.dangerousSound))
    Print(L.COOLDOWN .. ": " .. tostring(db.cooldown) .. " " .. L.SECONDS)
    Print(L.CHAT_MESSAGES .. ": " .. BoolText(db.chat) .. " / " .. L.ONLY_COMBAT .. ": " .. BoolText(db.onlyCombat))
end

local function PrintHelp()
    Print(L.HELP_HEADER)
    Print(L.HELP_CONFIG)
    Print(L.HELP_TEST)
    Print(L.HELP_ON)
    Print(L.HELP_OFF)
    Print(L.HELP_STATUS)
    Print(L.HELP_SOUND)
    Print(L.HELP_COOLDOWN)
    Print(L.HELP_CHAT)
    Print(L.HELP_DEBUG)
    Print(L.HELP_COMBAT)
end

local function NormalizeMessage(message)
    message = message or ""
    message = message:match("^%s*(.-)%s*$") or ""
    return string.lower(message)
end

local function HandleSoundCommand(arg)
    if arg == "" or arg == "next" then
        CycleSound(1)
    elseif SOUND_OPTIONS[arg] then
        db.sound = arg
    else
        Print(L.UNKNOWN_SOUND .. " " .. tostring(arg))
        return
    end

    Print(L.SOUND_SET .. " " .. GetSoundLabel(db.sound))
    Bad:RefreshOptions()
    Bad:PlayAlertSound(true)
end

local function HandleSlash(message)
    EnsureDb()

    local normalized = NormalizeMessage(message)
    local command, rest = normalized:match("^(%S+)%s*(.*)$")
    command = command or ""
    rest = rest or ""

    if command == "" or command == "config" or command == "options" then
        Bad:OpenOptions()
    elseif command == "help" then
        PrintHelp()
    elseif command == "test" then
        Bad:PlayAlertSound(true)
    elseif command == "on" or command == "enable" then
        db.enabled = true
        Print(L.ENABLED)
        Bad:RefreshOptions()
        Bad:QueueScan()
    elseif command == "off" or command == "disable" then
        db.enabled = false
        activeDebuffs = {}
        Print(L.DISABLED)
        Bad:RefreshOptions()
    elseif command == "status" then
        PrintStatus()
    elseif command == "sound" then
        HandleSoundCommand(rest)
    elseif command == "cooldown" then
        local value = tonumber(rest)
        if value and IsAllowedCooldown(value) then
            db.cooldown = value
            Print(L.COOLDOWN_SET:format(db.cooldown))
            Bad:RefreshOptions()
        else
            Print(L.HELP_COOLDOWN)
        end
    elseif command == "chat" then
        db.chat = not db.chat
        Print(db.chat and L.CHAT_ON or L.CHAT_OFF)
        Bad:RefreshOptions()
    elseif command == "debug" then
        db.debug = not db.debug
        Print(db.debug and L.DEBUG_ON or L.DEBUG_OFF)
        Bad:RefreshOptions()
    elseif command == "combat" then
        db.onlyCombat = not db.onlyCombat
        Print(db.onlyCombat and L.COMBAT_ON or L.COMBAT_OFF)
        Bad:RefreshOptions()
    else
        PrintHelp()
    end
end

function Bad:PLAYER_LOGIN()
    EnsureDb()
    local _, class = UnitClass("player")
    playerClass = class

    SLASH_BAD1 = "/bad"
    SlashCmdList.BAD = HandleSlash

    self:CreateOptionsFrame()
    self:RegisterInterfaceOptions()
    self:RefreshOptions()
    Print(L.LOADED)
    self:QueueScan()
end

function Bad:UNIT_AURA(unit)
    if not unit then
        return
    end

    if unit == "player" or unit == "pet" or unit:match("^party") or unit:match("^raid") then
        self:QueueScan()
    end
end

function Bad:GROUP_ROSTER_UPDATE()
    activeDebuffs = {}
    self:QueueScan()
end

function Bad:PLAYER_ENTERING_WORLD()
    activeDebuffs = {}
    self:QueueScan()
end

function Bad:SPELLS_CHANGED()
    self:QueueScan()
end

function Bad:PLAYER_REGEN_DISABLED()
    self:QueueScan()
end

Bad:SetScript("OnEvent", function(self, event, ...)
    if self[event] then
        self[event](self, ...)
    end
end)

Bad:RegisterEvent("PLAYER_LOGIN")
Bad:RegisterEvent("UNIT_AURA")
Bad:RegisterEvent("GROUP_ROSTER_UPDATE")
Bad:RegisterEvent("PLAYER_ENTERING_WORLD")
Bad:RegisterEvent("SPELLS_CHANGED")
Bad:RegisterEvent("PLAYER_REGEN_DISABLED")
