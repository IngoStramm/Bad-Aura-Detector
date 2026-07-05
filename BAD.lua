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
    HELP_SOUND = "/bad sound [next|sound key] - set alert sound",
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
    SOUND_CHANNEL = "Sound channel",
    SOUND_VOLUME = "Sound volume",
    CHANNEL_MASTER = "Master",
    CHANNEL_SFX = "SFX",
    CHANNEL_AMBIENCE = "Ambience",
    CHANNEL_MUSIC = "Music",
    CHANNEL_DIALOG = "Dialog",
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
    SOUND_WA_AIRHORN = "WA: Air Horn",
    SOUND_WA_WARNING = "WA: Warning Siren",
    SOUND_WA_TEMPLE = "WA: Temple Bell",
    SOUND_WA_ERROR = "WA: Error Beep",
    SOUND_WA_HEARTBEAT = "WA: Heartbeat",
    SOUND_WA_ROBOT = "WA: Robot Blip",
    SOUND_WA_WATER = "WA: Water Drop",
    SOUND_WA_BIKE = "WA: Bike Horn",
    SOUND_WA_TADA = "WA: Tada Fanfare",
    SOUND_WA_XYLOPHONE = "WA: Xylophone",
    SOUND_WA_BRASS = "WA: Brass",
    SOUND_WA_GLASS = "WA: Glass",
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
        HELP_SOUND = "/bad sound [next|chave do som] - escolher som",
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
        SOUND_CHANNEL = "Canal do som",
        SOUND_VOLUME = "Volume do som",
        CHANNEL_MASTER = "Mestre",
        CHANNEL_SFX = "Efeitos",
        CHANNEL_AMBIENCE = "Ambiente",
        CHANNEL_MUSIC = "Musica",
        CHANNEL_DIALOG = "Dialogo",
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
        SOUND_WA_AIRHORN = "WA: Buzina",
        SOUND_WA_WARNING = "WA: Sirene",
        SOUND_WA_TEMPLE = "WA: Sino do templo",
        SOUND_WA_ERROR = "WA: Erro",
        SOUND_WA_HEARTBEAT = "WA: Batimento",
        SOUND_WA_ROBOT = "WA: Bip robo",
        SOUND_WA_WATER = "WA: Gota",
        SOUND_WA_BIKE = "WA: Buzina curta",
        SOUND_WA_TADA = "WA: Fanfarra",
        SOUND_WA_XYLOPHONE = "WA: Xilofone",
        SOUND_WA_BRASS = "WA: Metais",
        SOUND_WA_GLASS = "WA: Vidro",
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
    soundChannel = "Master",
    soundVolume = 1,
    cooldown = 5,
    requireKnownSpell = true,
    requireUsableSpell = false,
    checkSpellCooldown = false,
    warnDangerous = true,
}

local SOUND_ORDER = {
    "decursive",
    "bell",
    "raid",
    "ready",
    "deadly",
}
local COOLDOWN_OPTIONS = { 1, 3, 5, 10, 15, 30 }
local CHANNEL_ORDER = { "Master", "SFX", "Ambience", "Music", "Dialog" }
local CHANNEL_LABELS = {
    Master = L.CHANNEL_MASTER,
    SFX = L.CHANNEL_SFX,
    Ambience = L.CHANNEL_AMBIENCE,
    Music = L.CHANNEL_MUSIC,
    Dialog = L.CHANNEL_DIALOG,
}
local VOLUME_OPTIONS = { 0.1, 0.25, 0.5, 0.75, 1 }

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

local WA_MEDIA_PATH = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\"
local WA_POWER_AURAS_PATH = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\"

local WA_SOUND_DEFINITIONS = {
    { key = "wa_heartbeat_single", label = "WA: Heartbeat Single", file = WA_MEDIA_PATH .. "HeartbeatSingle.ogg" },
    { key = "wa_batman_punch", label = "WA: Batman Punch", file = WA_MEDIA_PATH .. "BatmanPunch.ogg" },
    { key = "wa_bike_horn", label = "WA: Bike Horn", file = WA_MEDIA_PATH .. "BikeHorn.ogg" },
    { key = "wa_boxing_arena_gong", label = "WA: Boxing Arena Gong", file = WA_MEDIA_PATH .. "BoxingArenaSound.ogg" },
    { key = "wa_bleat", label = "WA: Bleat", file = WA_MEDIA_PATH .. "Bleat.ogg" },
    { key = "wa_cartoon_hop", label = "WA: Cartoon Hop", file = WA_MEDIA_PATH .. "CartoonHop.ogg" },
    { key = "wa_cat_meow", label = "WA: Cat Meow", file = WA_MEDIA_PATH .. "CatMeow2.ogg" },
    { key = "wa_kitten_meow", label = "WA: Kitten Meow", file = WA_MEDIA_PATH .. "KittenMeow.ogg" },
    { key = "wa_robot_blip", label = "WA: Robot Blip", file = WA_MEDIA_PATH .. "RobotBlip.ogg" },
    { key = "wa_sharp_punch", label = "WA: Sharp Punch", file = WA_MEDIA_PATH .. "SharpPunch.ogg" },
    { key = "wa_water_drop", label = "WA: Water Drop", file = WA_MEDIA_PATH .. "WaterDrop.ogg" },
    { key = "wa_air_horn", label = "WA: Air Horn", file = WA_MEDIA_PATH .. "AirHorn.ogg" },
    { key = "wa_applause", label = "WA: Applause", file = WA_MEDIA_PATH .. "Applause.ogg" },
    { key = "wa_banana_peel_slip", label = "WA: Banana Peel Slip", file = WA_MEDIA_PATH .. "BananaPeelSlip.ogg" },
    { key = "wa_blast", label = "WA: Blast", file = WA_MEDIA_PATH .. "Blast.ogg" },
    { key = "wa_cartoon_voice_baritone", label = "WA: Cartoon Voice Baritone", file = WA_MEDIA_PATH .. "CartoonVoiceBaritone.ogg" },
    { key = "wa_cartoon_walking", label = "WA: Cartoon Walking", file = WA_MEDIA_PATH .. "CartoonWalking.ogg" },
    { key = "wa_cow_mooing", label = "WA: Cow Mooing", file = WA_MEDIA_PATH .. "CowMooing.ogg" },
    { key = "wa_ringing_phone", label = "WA: Ringing Phone", file = WA_MEDIA_PATH .. "RingingPhone.ogg" },
    { key = "wa_roaring_lion", label = "WA: Roaring Lion", file = WA_MEDIA_PATH .. "RoaringLion.ogg" },
    { key = "wa_shotgun", label = "WA: Shotgun", file = WA_MEDIA_PATH .. "Shotgun.ogg" },
    { key = "wa_squish_fart", label = "WA: Squish Fart", file = WA_MEDIA_PATH .. "SquishFart.ogg" },
    { key = "wa_temple_bell", label = "WA: Temple Bell", file = WA_MEDIA_PATH .. "TempleBellHuge.ogg" },
    { key = "wa_torch", label = "WA: Torch", file = WA_MEDIA_PATH .. "Torch.ogg" },
    { key = "wa_warning_siren", label = "WA: Warning Siren", file = WA_MEDIA_PATH .. "WarningSiren.ogg" },
    { key = "wa_lich_king_apocalypse", label = "WA: Lich King Apocalypse", kit = 554003 },
    { key = "wa_sheep_blerping", label = "WA: Sheep Blerping", file = WA_MEDIA_PATH .. "SheepBleat.ogg" },
    { key = "wa_rooster_chicken_call", label = "WA: Rooster Chicken Call", file = WA_MEDIA_PATH .. "RoosterChickenCalls.ogg" },
    { key = "wa_goat_bleeting", label = "WA: Goat Bleeting", file = WA_MEDIA_PATH .. "GoatBleating.ogg" },
    { key = "wa_acoustic_guitar", label = "WA: Acoustic Guitar", file = WA_MEDIA_PATH .. "AcousticGuitar.ogg" },
    { key = "wa_synth_chord", label = "WA: Synth Chord", file = WA_MEDIA_PATH .. "SynthChord.ogg" },
    { key = "wa_chicken_alarm", label = "WA: Chicken Alarm", file = WA_MEDIA_PATH .. "ChickenAlarm.ogg" },
    { key = "wa_xylophone", label = "WA: Xylophone", file = WA_MEDIA_PATH .. "Xylophone.ogg" },
    { key = "wa_drums", label = "WA: Drums", file = WA_MEDIA_PATH .. "Drums.ogg" },
    { key = "wa_tada_fanfare", label = "WA: Tada Fanfare", file = WA_MEDIA_PATH .. "TadaFanfare.ogg" },
    { key = "wa_squeaky_toy_short", label = "WA: Squeaky Toy Short", file = WA_MEDIA_PATH .. "SqueakyToyShort.ogg" },
    { key = "wa_error_beep", label = "WA: Error Beep", file = WA_MEDIA_PATH .. "ErrorBeep.ogg" },
    { key = "wa_oh_no", label = "WA: Oh No", file = WA_MEDIA_PATH .. "OhNo.ogg" },
    { key = "wa_double_whoosh", label = "WA: Double Whoosh", file = WA_MEDIA_PATH .. "DoubleWhoosh.ogg" },
    { key = "wa_brass", label = "WA: Brass", file = WA_MEDIA_PATH .. "Brass.mp3" },
    { key = "wa_glass", label = "WA: Glass", file = WA_MEDIA_PATH .. "Glass.mp3" },
    { key = "wa_voice_adds", label = "WA: Voice: Adds", file = WA_MEDIA_PATH .. "Adds.ogg" },
    { key = "wa_voice_boss", label = "WA: Voice: Boss", file = WA_MEDIA_PATH .. "Boss.ogg" },
    { key = "wa_voice_circle", label = "WA: Voice: Circle", file = WA_MEDIA_PATH .. "Circle.ogg" },
    { key = "wa_voice_cross", label = "WA: Voice: Cross", file = WA_MEDIA_PATH .. "Cross.ogg" },
    { key = "wa_voice_diamond", label = "WA: Voice: Diamond", file = WA_MEDIA_PATH .. "Diamond.ogg" },
    { key = "wa_voice_don_t_release", label = "WA: Voice: Don't Release", file = WA_MEDIA_PATH .. "DontRelease.ogg" },
    { key = "wa_voice_empowered", label = "WA: Voice: Empowered", file = WA_MEDIA_PATH .. "Empowered.ogg" },
    { key = "wa_voice_focus", label = "WA: Voice: Focus", file = WA_MEDIA_PATH .. "Focus.ogg" },
    { key = "wa_voice_idiot", label = "WA: Voice: Idiot", file = WA_MEDIA_PATH .. "Idiot.ogg" },
    { key = "wa_voice_left", label = "WA: Voice: Left", file = WA_MEDIA_PATH .. "Left.ogg" },
    { key = "wa_voice_moon", label = "WA: Voice: Moon", file = WA_MEDIA_PATH .. "Moon.ogg" },
    { key = "wa_voice_next", label = "WA: Voice: Next", file = WA_MEDIA_PATH .. "Next.ogg" },
    { key = "wa_voice_portal", label = "WA: Voice: Portal", file = WA_MEDIA_PATH .. "Portal.ogg" },
    { key = "wa_voice_protected", label = "WA: Voice: Protected", file = WA_MEDIA_PATH .. "Protected.ogg" },
    { key = "wa_voice_release", label = "WA: Voice: Release", file = WA_MEDIA_PATH .. "Release.ogg" },
    { key = "wa_voice_right", label = "WA: Voice: Right", file = WA_MEDIA_PATH .. "Right.ogg" },
    { key = "wa_voice_run_away", label = "WA: Voice: Run Away", file = WA_MEDIA_PATH .. "RunAway.ogg" },
    { key = "wa_voice_skull", label = "WA: Voice: Skull", file = WA_MEDIA_PATH .. "Skull.ogg" },
    { key = "wa_voice_spread", label = "WA: Voice: Spread", file = WA_MEDIA_PATH .. "Spread.ogg" },
    { key = "wa_voice_square", label = "WA: Voice: Square", file = WA_MEDIA_PATH .. "Square.ogg" },
    { key = "wa_voice_stack", label = "WA: Voice: Stack", file = WA_MEDIA_PATH .. "Stack.ogg" },
    { key = "wa_voice_star", label = "WA: Voice: Star", file = WA_MEDIA_PATH .. "Star.ogg" },
    { key = "wa_voice_switch", label = "WA: Voice: Switch", file = WA_MEDIA_PATH .. "Switch.ogg" },
    { key = "wa_voice_taunt", label = "WA: Voice: Taunt", file = WA_MEDIA_PATH .. "Taunt.ogg" },
    { key = "wa_voice_triangle", label = "WA: Voice: Triangle", file = WA_MEDIA_PATH .. "Triangle.ogg" },
    { key = "wa_pa_aggro", label = "WA: Aggro", file = WA_POWER_AURAS_PATH .. "aggro.ogg" },
    { key = "wa_pa_arrow_swoosh", label = "WA: Arrow Swoosh", file = WA_POWER_AURAS_PATH .. "Arrow_swoosh.ogg" },
    { key = "wa_pa_bam", label = "WA: Bam", file = WA_POWER_AURAS_PATH .. "bam.ogg" },
    { key = "wa_pa_polar_bear", label = "WA: Polar Bear", file = WA_POWER_AURAS_PATH .. "bear_polar.ogg" },
    { key = "wa_pa_big_kiss", label = "WA: Big Kiss", file = WA_POWER_AURAS_PATH .. "bigkiss.ogg" },
    { key = "wa_pa_bite", label = "WA: Bite", file = WA_POWER_AURAS_PATH .. "BITE.ogg" },
    { key = "wa_pa_burp", label = "WA: Burp", file = WA_POWER_AURAS_PATH .. "burp4.ogg" },
    { key = "wa_pa_cat", label = "WA: Cat", file = WA_POWER_AURAS_PATH .. "cat2.ogg" },
    { key = "wa_pa_chant_major_2nd", label = "WA: Chant Major 2nd", file = WA_POWER_AURAS_PATH .. "chant2.ogg" },
    { key = "wa_pa_chant_minor_3rd", label = "WA: Chant Minor 3rd", file = WA_POWER_AURAS_PATH .. "chant4.ogg" },
    { key = "wa_pa_chimes", label = "WA: Chimes", file = WA_POWER_AURAS_PATH .. "chimes.ogg" },
    { key = "wa_pa_cookie_monster", label = "WA: Cookie Monster", file = WA_POWER_AURAS_PATH .. "cookie.ogg" },
    { key = "wa_pa_electrical_spark", label = "WA: Electrical Spark", file = WA_POWER_AURAS_PATH .. "ESPARK1.ogg" },
    { key = "wa_pa_fireball", label = "WA: Fireball", file = WA_POWER_AURAS_PATH .. "Fireball.ogg" },
    { key = "wa_pa_gasp", label = "WA: Gasp", file = WA_POWER_AURAS_PATH .. "Gasp.ogg" },
    { key = "wa_pa_heartbeat", label = "WA: Heartbeat", file = WA_POWER_AURAS_PATH .. "heartbeat.ogg" },
    { key = "wa_pa_hiccup", label = "WA: Hiccup", file = WA_POWER_AURAS_PATH .. "hic3.ogg" },
    { key = "wa_pa_huh", label = "WA: Huh?", file = WA_POWER_AURAS_PATH .. "huh_1.ogg" },
    { key = "wa_pa_hurricane", label = "WA: Hurricane", file = WA_POWER_AURAS_PATH .. "hurricane.ogg" },
    { key = "wa_pa_hyena", label = "WA: Hyena", file = WA_POWER_AURAS_PATH .. "hyena.ogg" },
    { key = "wa_pa_kaching", label = "WA: Kaching", file = WA_POWER_AURAS_PATH .. "kaching.ogg" },
    { key = "wa_pa_moan", label = "WA: Moan", file = WA_POWER_AURAS_PATH .. "moan.ogg" },
    { key = "wa_pa_panther", label = "WA: Panther", file = WA_POWER_AURAS_PATH .. "panther1.ogg" },
    { key = "wa_pa_phone", label = "WA: Phone", file = WA_POWER_AURAS_PATH .. "phone.ogg" },
    { key = "wa_pa_punch", label = "WA: Punch", file = WA_POWER_AURAS_PATH .. "PUNCH.ogg" },
    { key = "wa_pa_rain", label = "WA: Rain", file = WA_POWER_AURAS_PATH .. "rainroof.ogg" },
    { key = "wa_pa_rocket", label = "WA: Rocket", file = WA_POWER_AURAS_PATH .. "rocket.ogg" },
    { key = "wa_pa_ship_s_whistle", label = "WA: Ship's Whistle", file = WA_POWER_AURAS_PATH .. "shipswhistle.ogg" },
    { key = "wa_pa_gunshot", label = "WA: Gunshot", file = WA_POWER_AURAS_PATH .. "shot.ogg" },
    { key = "wa_pa_snake_attack", label = "WA: Snake Attack", file = WA_POWER_AURAS_PATH .. "snakeatt.ogg" },
    { key = "wa_pa_sneeze", label = "WA: Sneeze", file = WA_POWER_AURAS_PATH .. "sneeze.ogg" },
    { key = "wa_pa_sonar", label = "WA: Sonar", file = WA_POWER_AURAS_PATH .. "sonar.ogg" },
    { key = "wa_pa_splash", label = "WA: Splash", file = WA_POWER_AURAS_PATH .. "splash.ogg" },
    { key = "wa_pa_squeaky_toy", label = "WA: Squeaky Toy", file = WA_POWER_AURAS_PATH .. "Squeakypig.ogg" },
    { key = "wa_pa_sword_ring", label = "WA: Sword Ring", file = WA_POWER_AURAS_PATH .. "swordecho.ogg" },
    { key = "wa_pa_throwing_knife", label = "WA: Throwing Knife", file = WA_POWER_AURAS_PATH .. "throwknife.ogg" },
    { key = "wa_pa_thunder", label = "WA: Thunder", file = WA_POWER_AURAS_PATH .. "thunder.ogg" },
    { key = "wa_pa_wicked_male_laugh", label = "WA: Wicked Male Laugh", file = WA_POWER_AURAS_PATH .. "wickedmalelaugh1.ogg" },
    { key = "wa_pa_wilhelm_scream", label = "WA: Wilhelm Scream", file = WA_POWER_AURAS_PATH .. "wilhelm.ogg" },
    { key = "wa_pa_wicked_female_laugh", label = "WA: Wicked Female Laugh", file = WA_POWER_AURAS_PATH .. "wlaugh.ogg" },
    { key = "wa_pa_wolf_howl", label = "WA: Wolf Howl", file = WA_POWER_AURAS_PATH .. "wolf5.ogg" },
    { key = "wa_pa_yeehaw", label = "WA: Yeehaw", file = WA_POWER_AURAS_PATH .. "yeehaw.ogg" },
}

for _, sound in ipairs(WA_SOUND_DEFINITIONS) do
    SOUND_ORDER[#SOUND_ORDER + 1] = sound.key
    if sound.kit then
        SOUND_OPTIONS[sound.key] = {
            label = sound.label,
            kit = sound.kit,
            fallback = sound.kit,
        }
    else
        SOUND_OPTIONS[sound.key] = {
            label = sound.label,
            file = sound.file,
            fallbackKit = "IG_MAINMENU_OPTION_CHECKBOX_ON",
        }
    end
end

local SOUND_ALIASES = {
    wa_airhorn = "wa_air_horn",
    wa_warning = "wa_warning_siren",
    wa_temple = "wa_temple_bell",
    wa_error = "wa_error_beep",
    wa_heartbeat = "wa_heartbeat_single",
    wa_robot = "wa_robot_blip",
    wa_water = "wa_water_drop",
    wa_bike = "wa_bike_horn",
    wa_tada = "wa_tada_fanfare",
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

local function IsAllowedChannel(value)
    for _, channel in ipairs(CHANNEL_ORDER) do
        if value == channel then
            return true
        end
    end
    return false
end

local function NormalizeChannel(value)
    if IsAllowedChannel(value) then
        return value
    end
    return DEFAULT_DB.soundChannel
end

local function NormalizeVolume(value)
    value = tonumber(value) or DEFAULT_DB.soundVolume
    local closest = VOLUME_OPTIONS[1]
    local closestDistance = math.abs(value - closest)

    for _, option in ipairs(VOLUME_OPTIONS) do
        local distance = math.abs(value - option)
        if distance < closestDistance then
            closest = option
            closestDistance = distance
        end
    end

    return closest
end

local function GetChannelLabel(value)
    return CHANNEL_LABELS[value] or CHANNEL_LABELS[DEFAULT_DB.soundChannel]
end

local function GetVolumeLabel(value)
    value = NormalizeVolume(value)
    return tostring(math.floor((value * 100) + 0.5)) .. "%"
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
    db.sound = SOUND_ALIASES[db.sound] or db.sound
    db.dangerousSound = SOUND_ALIASES[db.dangerousSound] or db.dangerousSound
    if not SOUND_OPTIONS[db.sound] then
        db.sound = DEFAULT_DB.sound
    end
    if not SOUND_OPTIONS[db.dangerousSound] then
        db.dangerousSound = DEFAULT_DB.dangerousSound
    end
    db.soundChannel = NormalizeChannel(db.soundChannel)
    db.soundVolume = NormalizeVolume(db.soundVolume)
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
        local channel = db.soundChannel or DEFAULT_DB.soundChannel
        local volume = db.soundVolume or DEFAULT_DB.soundVolume
        if volume < 1 then
            local ok = pcall(PlaySound, kit, channel, volume)
            if ok then
                return true
            end
        end
        PlaySound(kit, channel)
        return true
    end
    return false
end

local function PlaySoundOption(soundKey)
    local option = SOUND_OPTIONS[soundKey] or SOUND_OPTIONS.decursive
    if option.file and PlaySoundFile then
        local channel = db.soundChannel or DEFAULT_DB.soundChannel
        local volume = db.soundVolume or DEFAULT_DB.soundVolume
        if volume < 1 then
            local callOk, played = pcall(PlaySoundFile, option.file, channel, volume)
            if callOk and played then
                return true
            end
        end
        local callOk, played = pcall(PlaySoundFile, option.file, channel)
        if callOk and played then
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

local function CloseOpenDropdowns()
    if CloseDropDownMenus then
        CloseDropDownMenus()
    end
    if optionsFrame then
        if optionsFrame.soundDropdown and optionsFrame.soundDropdown.CloseMenu then
            optionsFrame.soundDropdown:CloseMenu()
        end
        if optionsFrame.dangerousSoundDropdown and optionsFrame.dangerousSoundDropdown.CloseMenu then
            optionsFrame.dangerousSoundDropdown:CloseMenu()
        end
    end
end

local SOUND_DROPDOWN_WIDTH = 180
local SOUND_DROPDOWN_MENU_WIDTH = 210
local SOUND_DROPDOWN_ROW_HEIGHT = 18
local SOUND_DROPDOWN_VISIBLE_ROWS = 14

local function CreateSoundDropdown(parent, frameName, dbKey)
    local dropdown = CreateFrame("Button", frameName, parent, "UIPanelButtonTemplate")
    dropdown:SetSize(SOUND_DROPDOWN_WIDTH, 22)
    dropdown.dbKey = dbKey

    local ok, menu = pcall(CreateFrame, "Frame", frameName .. "Menu", dropdown, "BackdropTemplate")
    if not ok or not menu then
        menu = CreateFrame("Frame", frameName .. "Menu", dropdown)
    end
    menu:SetSize(SOUND_DROPDOWN_MENU_WIDTH, SOUND_DROPDOWN_ROW_HEIGHT * SOUND_DROPDOWN_VISIBLE_ROWS + 10)
    menu:SetPoint("BOTTOMLEFT", dropdown, "TOPLEFT", 0, 2)
    menu:SetFrameStrata("FULLSCREEN_DIALOG")
    menu:SetFrameLevel(dropdown:GetFrameLevel() + 20)
    menu:EnableMouse(true)
    menu:Hide()

    if menu.SetBackdrop then
        menu:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 },
        })
        menu:SetBackdropColor(0, 0, 0, 0.94)
        menu:SetBackdropBorderColor(0.55, 0.55, 0.55, 1)
    end

    local scrollFrame = CreateFrame("ScrollFrame", frameName .. "ScrollFrame", menu, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", menu, "TOPLEFT", 6, -5)
    scrollFrame:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", -28, 5)

    local content = CreateFrame("Frame", frameName .. "ScrollChild", scrollFrame)
    content:SetSize(SOUND_DROPDOWN_MENU_WIDTH - 34, #SOUND_ORDER * SOUND_DROPDOWN_ROW_HEIGHT)
    scrollFrame:SetScrollChild(content)
    scrollFrame:EnableMouseWheel(true)
    scrollFrame:SetScript("OnMouseWheel", function(self, delta)
        local maxScroll = math.max(0, content:GetHeight() - self:GetHeight())
        local nextScroll = self:GetVerticalScroll() - (delta * SOUND_DROPDOWN_ROW_HEIGHT * 3)
        if nextScroll < 0 then
            nextScroll = 0
        elseif nextScroll > maxScroll then
            nextScroll = maxScroll
        end
        self:SetVerticalScroll(nextScroll)
        local scrollBar = _G[self:GetName() .. "ScrollBar"]
        if scrollBar then
            scrollBar:SetValue(nextScroll)
        end
    end)

    dropdown.menu = menu
    dropdown.rows = {}

    function dropdown:CloseMenu()
        self.menu:Hide()
    end

    function dropdown:PositionMenu()
        self.menu:ClearAllPoints()
        local top = self:GetTop() or 0
        if top > self.menu:GetHeight() + 20 then
            self.menu:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 2)
        else
            self.menu:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -2)
        end
    end

    function dropdown:OpenMenu()
        if CloseDropDownMenus then
            CloseDropDownMenus()
        end
        if optionsFrame then
            if optionsFrame.soundDropdown and optionsFrame.soundDropdown ~= self and optionsFrame.soundDropdown.CloseMenu then
                optionsFrame.soundDropdown:CloseMenu()
            end
            if optionsFrame.dangerousSoundDropdown and optionsFrame.dangerousSoundDropdown ~= self and optionsFrame.dangerousSoundDropdown.CloseMenu then
                optionsFrame.dangerousSoundDropdown:CloseMenu()
            end
        end
        self:PositionMenu()
        self.menu:Show()
    end

    function dropdown:ToggleMenu()
        if self.menu:IsShown() then
            self:CloseMenu()
        else
            self:OpenMenu()
        end
    end

    function dropdown:UpdateText()
        self:SetText(GetSoundLabel(db[self.dbKey]))
    end

    for index, key in ipairs(SOUND_ORDER) do
        local row = CreateFrame("Button", nil, content)
        row:SetHeight(SOUND_DROPDOWN_ROW_HEIGHT)
        row:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -((index - 1) * SOUND_DROPDOWN_ROW_HEIGHT))
        row:SetPoint("RIGHT", content, "RIGHT", 0, 0)
        row.key = key

        row.check = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        row.check:SetPoint("LEFT", row, "LEFT", 2, 0)
        row.check:SetWidth(14)
        row.check:SetJustifyH("LEFT")

        row.text = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        row.text:SetPoint("LEFT", row.check, "RIGHT", 2, 0)
        row.text:SetPoint("RIGHT", row, "RIGHT", -2, 0)
        row.text:SetJustifyH("LEFT")
        row.text:SetText(GetSoundLabel(key))

        row.highlight = row:CreateTexture(nil, "BACKGROUND")
        row.highlight:SetAllPoints(row)
        row.highlight:SetColorTexture(1, 0.82, 0, 0.22)
        row.highlight:Hide()

        row:SetScript("OnEnter", function(self)
            self.highlight:Show()
        end)
        row:SetScript("OnLeave", function(self)
            self.highlight:Hide()
        end)
        row:SetScript("OnClick", function(self)
            db[dbKey] = self.key
            dropdown:UpdateText()
            dropdown:CloseMenu()
            Bad:RefreshOptions()
            Bad:PlayAlertSound(true, self.key)
        end)

        dropdown.rows[#dropdown.rows + 1] = row
    end

    function dropdown:RefreshChecked()
        local selected = db[self.dbKey]
        for _, row in ipairs(self.rows) do
            row.check:SetText(row.key == selected and ">" or "")
        end
        self:UpdateText()
    end

    dropdown:SetScript("OnClick", function(self)
        self:ToggleMenu()
    end)
    dropdown:SetScript("OnHide", function(self)
        self:CloseMenu()
    end)
    dropdown:RefreshChecked()

    return dropdown
end

local function RefreshSoundDropdown(dropdown)
    if dropdown and dropdown.RefreshChecked then
        dropdown:RefreshChecked()
    end
end

-- The sound lists are too large for WoW's global UIDropDownMenu without
-- detaching from the movable options window, so small option lists use
-- stock dropdowns and sound lists use the custom scrollable dropdown.
local function CreateSimpleDropdown(parent, frameName, width, options, getLabel, isSelected, onSelect)
    if not UIDropDownMenu_Initialize or not UIDropDownMenu_CreateInfo or not UIDropDownMenu_AddButton or not UIDropDownMenu_SetWidth or not UIDropDownMenu_SetText then
        return nil
    end

    local ok, dropdown = pcall(CreateFrame, "Frame", frameName, parent, "UIDropDownMenuTemplate")
    if not ok or not dropdown then
        return nil
    end

    UIDropDownMenu_SetWidth(dropdown, width)
    UIDropDownMenu_Initialize(dropdown, function(self, level)
        for _, value in ipairs(options) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = getLabel(value)
            info.checked = isSelected(value)
            info.func = function()
                onSelect(value)
                Bad:RefreshOptions()
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    return dropdown
end

local function CreateCooldownDropdown(parent)
    local dropdown = CreateSimpleDropdown(parent, "BADCooldownDropdown", 100, COOLDOWN_OPTIONS, GetCooldownLabel, function(value)
        return db.cooldown == value
    end, function(value)
        db.cooldown = value
    end)
    if dropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(dropdown, GetCooldownLabel(db.cooldown))
    end

    return dropdown
end

local function CreateChannelDropdown(parent)
    local dropdown = CreateSimpleDropdown(parent, "BADChannelDropdown", 100, CHANNEL_ORDER, GetChannelLabel, function(value)
        return db.soundChannel == value
    end, function(value)
        db.soundChannel = value
        Bad:PlayAlertSound(true)
    end)
    if dropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(dropdown, GetChannelLabel(db.soundChannel))
    end

    return dropdown
end

local function CreateVolumeDropdown(parent)
    local dropdown = CreateSimpleDropdown(parent, "BADVolumeDropdown", 100, VOLUME_OPTIONS, GetVolumeLabel, function(value)
        return db.soundVolume == value
    end, function(value)
        db.soundVolume = value
        Bad:PlayAlertSound(true)
    end)
    if dropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(dropdown, GetVolumeLabel(db.soundVolume))
    end

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
    testButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -318)
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

    local channelTitle = CreateText(frame, L.SOUND_CHANNEL, "GameFontNormalLarge")
    channelTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -254)

    frame.channelDropdown = CreateChannelDropdown(frame)
    if frame.channelDropdown then
        frame.channelDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -276)
    else
        frame.channelValue = CreateText(frame, "", "GameFontHighlight")
        frame.channelValue:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -282)
    end

    local volumeTitle = CreateText(frame, L.SOUND_VOLUME, "GameFontNormalLarge")
    volumeTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 208, -254)

    frame.volumeDropdown = CreateVolumeDropdown(frame)
    if frame.volumeDropdown then
        frame.volumeDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 198, -276)
    else
        frame.volumeValue = CreateText(frame, "", "GameFontHighlight")
        frame.volumeValue:SetPoint("TOPLEFT", frame, "TOPLEFT", 208, -282)
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

    RefreshSoundDropdown(optionsFrame.soundDropdown)

    RefreshSoundDropdown(optionsFrame.dangerousSoundDropdown)

    if optionsFrame.dangerousSoundValue then
        optionsFrame.dangerousSoundValue:SetText(GetSoundLabel(db.dangerousSound))
    end

    if optionsFrame.cooldownDropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(optionsFrame.cooldownDropdown, GetCooldownLabel(db.cooldown))
    end

    if optionsFrame.cooldownValue then
        optionsFrame.cooldownValue:SetText(GetCooldownLabel(db.cooldown))
    end

    if optionsFrame.channelDropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(optionsFrame.channelDropdown, GetChannelLabel(db.soundChannel))
    end

    if optionsFrame.channelValue then
        optionsFrame.channelValue:SetText(GetChannelLabel(db.soundChannel))
    end

    if optionsFrame.volumeDropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(optionsFrame.volumeDropdown, GetVolumeLabel(db.soundVolume))
    end

    if optionsFrame.volumeValue then
        optionsFrame.volumeValue:SetText(GetVolumeLabel(db.soundVolume))
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
        window:SetScript("OnDragStart", function(self)
            CloseOpenDropdowns()
            self:StartMoving()
        end)
        window:SetScript("OnDragStop", window.StopMovingOrSizing)
        window:SetScript("OnHide", CloseOpenDropdowns)
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
    Print(L.SOUND_CHANNEL .. ": " .. GetChannelLabel(db.soundChannel) .. " / " .. L.SOUND_VOLUME .. ": " .. GetVolumeLabel(db.soundVolume))
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
