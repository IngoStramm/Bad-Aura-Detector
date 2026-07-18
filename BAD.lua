local ADDON_NAME = ...

local Bad = CreateFrame("Frame", "BADFrame")
Bad.name = "BAD"

local LOCALE = GetLocale and GetLocale() or "enUS"

local LOCALES = {
    enUS = {
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
        HELP_PREVIEW = "/bad preview - toggle the Blizzard frame preview",
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
        VISUALS = "Blizzard frames",
        SHOW_BORDER = "Colored frame highlight",
        SHOW_ICONS = "Dispel type icons",
        BORDER_SIZE = "Border size",
        ICON_SIZE = "Icon size",
        CUSTOMIZE_COLORS = "Colors...",
        COLOR_TITLE = "Debuff colors",
        RESTORE_COLORS = "Restore default colors",
        PREVIEW_FRAMES = "Preview frames",
        PREVIEW_TITLE = "BAD frame preview",
        PREVIEW_LIVE = "Live player",
        PREVIEW_MULTIPLE = "Multiple",
        PREVIEW_UNAVAILABLE = "Blizzard compact frames are unavailable. Reload the UI and try again.",
    },
    ptBR = {
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
        HELP_PREVIEW = "/bad preview - alternar a previa dos frames da Blizzard",
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
        VISUALS = "Frames da Blizzard",
        SHOW_BORDER = "Destaque colorido do frame",
        SHOW_ICONS = "Icones do tipo de debuff",
        BORDER_SIZE = "Tamanho da borda",
        ICON_SIZE = "Tamanho do icone",
        CUSTOMIZE_COLORS = "Cores...",
        COLOR_TITLE = "Cores dos debuffs",
        RESTORE_COLORS = "Restaurar cores padrao",
        PREVIEW_FRAMES = "Previa dos frames",
        PREVIEW_TITLE = "Previa dos frames do BAD",
        PREVIEW_LIVE = "Jogador ao vivo",
        PREVIEW_MULTIPLE = "Multiplos",
        PREVIEW_UNAVAILABLE = "Os frames compactos da Blizzard nao estao disponiveis. Recarregue a interface e tente novamente.",
    },
    deDE = {
        LOADED = "geladen. Benutze /bad config oder /bad help.",
        ENABLED = "aktiviert.",
        DISABLED = "deaktiviert.",
        HELP_HEADER = "BAD-Befehle:",
        HELP_CONFIG = "/bad config - Optionen oeffnen",
        HELP_TEST = "/bad test - Warnton abspielen",
        HELP_ON = "/bad on - Warnungen aktivieren",
        HELP_OFF = "/bad off - Warnungen deaktivieren",
        HELP_STATUS = "/bad status - aktuelle Einstellungen anzeigen",
        HELP_SOUND = "/bad sound [next|Sound-Schluessel] - Warnton festlegen",
        HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - Mindestzeit zwischen Toenen festlegen",
        HELP_CHAT = "/bad chat - Chatmeldungen umschalten",
        HELP_DEBUG = "/bad debug - Debugmeldungen umschalten",
        HELP_COMBAT = "/bad combat - nur-im-Kampf-Warnungen umschalten",
        HELP_PREVIEW = "/bad preview - Blizzard-Rahmenvorschau umschalten",
        STATUS = "Status",
        OPTIONS = "Optionen",
        CLOSE = "Schliessen",
        TEST_SOUND = "Ton testen",
        RESET_DEFAULTS = "Standardwerte",
        ENABLE_ADDON = "Warnungen aktivieren",
        IGNORE_PETS = "Begleiter ignorieren",
        IGNORE_DEAD = "Tote/offline Einheiten ignorieren",
        ONLY_COMBAT = "Nur im Kampf warnen",
        CHAT_MESSAGES = "Chatmeldung ausgeben",
        ADVANCED = "Erweitert",
        SOUND = "Ton",
        NORMAL_SOUND = "Normaler Ton",
        DANGEROUS_SOUND = "Gefahrenton",
        COOLDOWN = "Tonintervall",
        SOUND_CHANNEL = "Tonkanal",
        CHANNEL_MASTER = "Master",
        CHANNEL_SFX = "Soundeffekte",
        CHANNEL_AMBIENCE = "Umgebung",
        CHANNEL_MUSIC = "Musik",
        CHANNEL_DIALOG = "Dialog",
        SECONDS = "Sek.",
        PREVIOUS = "Zurueck",
        NEXT = "Weiter",
        DEBUG = "Debugmeldungen im Chat",
        TYPE_MAGIC = "Magie",
        TYPE_CURSE = "Fluch",
        TYPE_POISON = "Gift",
        TYPE_DISEASE = "Krankheit",
        SOUND_DECURSIVE = "Decursive-Gebrechen",
        SOUND_DEADLY = "Decursive-Gefahr",
        SOUND_BELL = "Glocke",
        SOUND_RAID = "Schlachtzugswarnung",
        SOUND_READY = "Bereitschaftscheck",
        UNKNOWN_SOUND = "Unbekannter Ton:",
        SOUND_SET = "Ton gesetzt auf:",
        COOLDOWN_SET = "Mindestzeit zwischen Toenen auf %d Sekunden gesetzt.",
        CHAT_ON = "Chatmeldungen aktiviert.",
        CHAT_OFF = "Chatmeldungen deaktiviert.",
        DEBUG_ON = "Debug aktiviert.",
        DEBUG_OFF = "Debug deaktiviert.",
        COMBAT_ON = "Nur-im-Kampf-Warnungen aktiviert.",
        COMBAT_OFF = "Nur-im-Kampf-Warnungen deaktiviert.",
        ALERT_FORMAT = "%s hat entfernbaren %s-Debuff: %s",
        DANGEROUS_FORMAT = "Warnung vor gefaehrlicher Bannung: %s hat %s.",
        NONE = "Keiner",
        CLASS_UNSUPPORTED = "Deine Klasse hat in BAD keine konfigurierte defensive Bannung.",
        NO_DISPEL = "Kein entfernbarer Debuff gefunden.",
        SPELL_LOCKED = "Kein bekannter Bannzauber fuer diesen Debuff-Typ.",
        VISUALS = "Blizzard-Rahmen",
        SHOW_BORDER = "Farbige Rahmenmarkierung",
        SHOW_ICONS = "Debuff-Typsymbole",
        BORDER_SIZE = "Rahmenstarke",
        ICON_SIZE = "Symbolgrosse",
        CUSTOMIZE_COLORS = "Farben...",
        COLOR_TITLE = "Debuff-Farben",
        RESTORE_COLORS = "Standardfarben",
        PREVIEW_FRAMES = "Rahmenvorschau",
        PREVIEW_TITLE = "BAD-Rahmenvorschau",
        PREVIEW_LIVE = "Live-Spieler",
        PREVIEW_MULTIPLE = "Mehrere",
        PREVIEW_UNAVAILABLE = "Blizzards kompakte Rahmen sind nicht verfugbar. Lade die Benutzeroberflache neu.",
    },
    esES = {
        LOADED = "cargado. Usa /bad config o /bad help.",
        ENABLED = "activado.",
        DISABLED = "desactivado.",
        HELP_HEADER = "Comandos de BAD:",
        HELP_CONFIG = "/bad config - abrir opciones",
        HELP_TEST = "/bad test - reproducir el sonido de alerta",
        HELP_ON = "/bad on - activar alertas",
        HELP_OFF = "/bad off - desactivar alertas",
        HELP_STATUS = "/bad status - mostrar ajustes actuales",
        HELP_SOUND = "/bad sound [next|clave de sonido] - definir sonido de alerta",
        HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - definir tiempo minimo entre sonidos",
        HELP_CHAT = "/bad chat - alternar mensajes de chat",
        HELP_DEBUG = "/bad debug - alternar mensajes de depuracion",
        HELP_COMBAT = "/bad combat - alternar alertas solo en combate",
        HELP_PREVIEW = "/bad preview - alternar la vista previa de marcos",
        STATUS = "Estado",
        OPTIONS = "Opciones",
        CLOSE = "Cerrar",
        TEST_SOUND = "Probar sonido",
        RESET_DEFAULTS = "Restablecer",
        ENABLE_ADDON = "Activar alertas",
        IGNORE_PETS = "Ignorar mascotas",
        IGNORE_DEAD = "Ignorar muertos/desconectados",
        ONLY_COMBAT = "Alertar solo en combate",
        CHAT_MESSAGES = "Mostrar mensaje de chat",
        ADVANCED = "Avanzado",
        SOUND = "Sonido",
        NORMAL_SOUND = "Sonido normal",
        DANGEROUS_SOUND = "Sonido de peligro",
        COOLDOWN = "Intervalo de sonido",
        SOUND_CHANNEL = "Canal de sonido",
        CHANNEL_MASTER = "Principal",
        CHANNEL_SFX = "Efectos",
        CHANNEL_AMBIENCE = "Ambiente",
        CHANNEL_MUSIC = "Musica",
        CHANNEL_DIALOG = "Dialogo",
        SECONDS = "s",
        PREVIOUS = "Anterior",
        NEXT = "Siguiente",
        DEBUG = "Mensajes de depuracion en chat",
        TYPE_MAGIC = "Magia",
        TYPE_CURSE = "Maldicion",
        TYPE_POISON = "Veneno",
        TYPE_DISEASE = "Enfermedad",
        SOUND_DECURSIVE = "Afliccion de Decursive",
        SOUND_DEADLY = "Peligro de Decursive",
        SOUND_BELL = "Campana",
        SOUND_RAID = "Aviso de banda",
        SOUND_READY = "Comprobacion de listos",
        UNKNOWN_SOUND = "Sonido desconocido:",
        SOUND_SET = "Sonido definido como:",
        COOLDOWN_SET = "Tiempo minimo entre sonidos definido en %d segundos.",
        CHAT_ON = "Mensajes de chat activados.",
        CHAT_OFF = "Mensajes de chat desactivados.",
        DEBUG_ON = "Depuracion activada.",
        DEBUG_OFF = "Depuracion desactivada.",
        COMBAT_ON = "Alertas solo en combate activadas.",
        COMBAT_OFF = "Alertas solo en combate desactivadas.",
        ALERT_FORMAT = "%s tiene %s disipable: %s",
        DANGEROUS_FORMAT = "Aviso de disipacion peligrosa: %s tiene %s.",
        NONE = "Ninguno",
        CLASS_UNSUPPORTED = "Tu clase no tiene una disipacion defensiva configurada en BAD.",
        NO_DISPEL = "No se encontro ningun perjuicio disipable.",
        SPELL_LOCKED = "No hay ningun hechizo de disipacion conocido para este tipo de perjuicio.",
        VISUALS = "Marcos de Blizzard",
        SHOW_BORDER = "Resaltado de marco por color",
        SHOW_ICONS = "Iconos de tipo de perjuicio",
        BORDER_SIZE = "Tamano del borde",
        ICON_SIZE = "Tamano del icono",
        CUSTOMIZE_COLORS = "Colores...",
        COLOR_TITLE = "Colores de perjuicios",
        RESTORE_COLORS = "Restaurar colores",
        PREVIEW_FRAMES = "Vista previa de marcos",
        PREVIEW_TITLE = "Vista previa de marcos de BAD",
        PREVIEW_LIVE = "Jugador en vivo",
        PREVIEW_MULTIPLE = "Varios",
        PREVIEW_UNAVAILABLE = "Los marcos compactos de Blizzard no estan disponibles. Recarga la interfaz.",
    },
    esMX = {
        LOADED = "cargado. Usa /bad config o /bad help.",
        ENABLED = "activado.",
        DISABLED = "desactivado.",
        HELP_HEADER = "Comandos de BAD:",
        HELP_CONFIG = "/bad config - abrir opciones",
        HELP_TEST = "/bad test - reproducir el sonido de alerta",
        HELP_ON = "/bad on - activar alertas",
        HELP_OFF = "/bad off - desactivar alertas",
        HELP_STATUS = "/bad status - mostrar configuracion actual",
        HELP_SOUND = "/bad sound [next|clave de sonido] - configurar sonido de alerta",
        HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - configurar tiempo minimo entre sonidos",
        HELP_CHAT = "/bad chat - alternar mensajes de chat",
        HELP_DEBUG = "/bad debug - alternar mensajes de depuracion",
        HELP_COMBAT = "/bad combat - alternar alertas solo en combate",
        HELP_PREVIEW = "/bad preview - alternar la vista previa de marcos",
        STATUS = "Estado",
        OPTIONS = "Opciones",
        CLOSE = "Cerrar",
        TEST_SOUND = "Probar sonido",
        RESET_DEFAULTS = "Restablecer",
        ENABLE_ADDON = "Activar alertas",
        IGNORE_PETS = "Ignorar mascotas",
        IGNORE_DEAD = "Ignorar muertos/desconectados",
        ONLY_COMBAT = "Alertar solo en combate",
        CHAT_MESSAGES = "Mostrar mensaje en chat",
        ADVANCED = "Avanzado",
        SOUND = "Sonido",
        NORMAL_SOUND = "Sonido normal",
        DANGEROUS_SOUND = "Sonido de peligro",
        COOLDOWN = "Intervalo de sonido",
        SOUND_CHANNEL = "Canal de sonido",
        CHANNEL_MASTER = "Principal",
        CHANNEL_SFX = "Efectos",
        CHANNEL_AMBIENCE = "Ambiente",
        CHANNEL_MUSIC = "Musica",
        CHANNEL_DIALOG = "Dialogo",
        SECONDS = "s",
        PREVIOUS = "Anterior",
        NEXT = "Siguiente",
        DEBUG = "Mensajes de depuracion en chat",
        TYPE_MAGIC = "Magia",
        TYPE_CURSE = "Maldicion",
        TYPE_POISON = "Veneno",
        TYPE_DISEASE = "Enfermedad",
        SOUND_DECURSIVE = "Afliccion de Decursive",
        SOUND_DEADLY = "Peligro de Decursive",
        SOUND_BELL = "Campana",
        SOUND_RAID = "Aviso de banda",
        SOUND_READY = "Comprobacion de listos",
        UNKNOWN_SOUND = "Sonido desconocido:",
        SOUND_SET = "Sonido configurado como:",
        COOLDOWN_SET = "Tiempo minimo entre sonidos configurado en %d segundos.",
        CHAT_ON = "Mensajes de chat activados.",
        CHAT_OFF = "Mensajes de chat desactivados.",
        DEBUG_ON = "Depuracion activada.",
        DEBUG_OFF = "Depuracion desactivada.",
        COMBAT_ON = "Alertas solo en combate activadas.",
        COMBAT_OFF = "Alertas solo en combate desactivadas.",
        ALERT_FORMAT = "%s tiene %s disipable: %s",
        DANGEROUS_FORMAT = "Aviso de disipacion peligrosa: %s tiene %s.",
        NONE = "Ninguno",
        CLASS_UNSUPPORTED = "Tu clase no tiene una disipacion defensiva configurada en BAD.",
        NO_DISPEL = "No se encontro ningun perjuicio disipable.",
        SPELL_LOCKED = "No hay ningun hechizo de disipacion conocido para este tipo de perjuicio.",
        VISUALS = "Marcos de Blizzard",
        SHOW_BORDER = "Resaltado de marco por color",
        SHOW_ICONS = "Iconos de tipo de perjuicio",
        BORDER_SIZE = "Tamano del borde",
        ICON_SIZE = "Tamano del icono",
        CUSTOMIZE_COLORS = "Colores...",
        COLOR_TITLE = "Colores de perjuicios",
        RESTORE_COLORS = "Restaurar colores",
        PREVIEW_FRAMES = "Vista previa de marcos",
        PREVIEW_TITLE = "Vista previa de marcos de BAD",
        PREVIEW_LIVE = "Jugador en vivo",
        PREVIEW_MULTIPLE = "Varios",
        PREVIEW_UNAVAILABLE = "Los marcos compactos de Blizzard no estan disponibles. Recarga la interfaz.",
    },
    frFR = {
        LOADED = "charge. Utilisez /bad config ou /bad help.",
        ENABLED = "active.",
        DISABLED = "desactive.",
        HELP_HEADER = "Commandes BAD :",
        HELP_CONFIG = "/bad config - ouvrir les options",
        HELP_TEST = "/bad test - jouer le son d'alerte",
        HELP_ON = "/bad on - activer les alertes",
        HELP_OFF = "/bad off - desactiver les alertes",
        HELP_STATUS = "/bad status - afficher les reglages actuels",
        HELP_SOUND = "/bad sound [next|cle du son] - definir le son d'alerte",
        HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - definir le delai minimum entre les sons",
        HELP_CHAT = "/bad chat - activer/desactiver les messages de discussion",
        HELP_DEBUG = "/bad debug - activer/desactiver les messages de debug",
        HELP_COMBAT = "/bad combat - activer/desactiver les alertes en combat uniquement",
        HELP_PREVIEW = "/bad preview - afficher/masquer l'apercu des cadres",
        STATUS = "Statut",
        OPTIONS = "Options",
        CLOSE = "Fermer",
        TEST_SOUND = "Tester le son",
        RESET_DEFAULTS = "Par defaut",
        ENABLE_ADDON = "Activer les alertes",
        IGNORE_PETS = "Ignorer les familiers",
        IGNORE_DEAD = "Ignorer morts/hors ligne",
        ONLY_COMBAT = "Alerter seulement en combat",
        CHAT_MESSAGES = "Afficher un message",
        ADVANCED = "Avance",
        SOUND = "Son",
        NORMAL_SOUND = "Son normal",
        DANGEROUS_SOUND = "Son de danger",
        COOLDOWN = "Intervalle sonore",
        SOUND_CHANNEL = "Canal audio",
        CHANNEL_MASTER = "Principal",
        CHANNEL_SFX = "Effets",
        CHANNEL_AMBIENCE = "Ambiance",
        CHANNEL_MUSIC = "Musique",
        CHANNEL_DIALOG = "Dialogue",
        SECONDS = "s",
        PREVIOUS = "Precedent",
        NEXT = "Suivant",
        DEBUG = "Messages de debug dans le chat",
        TYPE_MAGIC = "Magie",
        TYPE_CURSE = "Malediction",
        TYPE_POISON = "Poison",
        TYPE_DISEASE = "Maladie",
        SOUND_DECURSIVE = "Affliction Decursive",
        SOUND_DEADLY = "Danger Decursive",
        SOUND_BELL = "Cloche",
        SOUND_RAID = "Alerte de raid",
        SOUND_READY = "Appel pret",
        UNKNOWN_SOUND = "Son inconnu :",
        SOUND_SET = "Son defini sur :",
        COOLDOWN_SET = "Delai minimum entre les sons defini a %d secondes.",
        CHAT_ON = "Messages de discussion actives.",
        CHAT_OFF = "Messages de discussion desactives.",
        DEBUG_ON = "Debug active.",
        DEBUG_OFF = "Debug desactive.",
        COMBAT_ON = "Alertes seulement en combat activees.",
        COMBAT_OFF = "Alertes seulement en combat desactivees.",
        ALERT_FORMAT = "%s a un affaiblissement %s dissipable : %s",
        DANGEROUS_FORMAT = "Alerte de dissipation dangereuse : %s a %s.",
        NONE = "Aucun",
        CLASS_UNSUPPORTED = "Votre classe n'a aucune dissipation defensive configuree dans BAD.",
        NO_DISPEL = "Aucun affaiblissement dissipable trouve.",
        SPELL_LOCKED = "Aucun sort de dissipation connu pour ce type d'affaiblissement.",
        VISUALS = "Cadres Blizzard",
        SHOW_BORDER = "Surbrillance coloree du cadre",
        SHOW_ICONS = "Icones de type d'affaiblissement",
        BORDER_SIZE = "Taille de bordure",
        ICON_SIZE = "Taille de l'icone",
        CUSTOMIZE_COLORS = "Couleurs...",
        COLOR_TITLE = "Couleurs des affaiblissements",
        RESTORE_COLORS = "Couleurs par defaut",
        PREVIEW_FRAMES = "Apercu des cadres",
        PREVIEW_TITLE = "Apercu des cadres BAD",
        PREVIEW_LIVE = "Joueur en direct",
        PREVIEW_MULTIPLE = "Multiples",
        PREVIEW_UNAVAILABLE = "Les cadres compacts Blizzard sont indisponibles. Rechargez l'interface.",
    },
    itIT = {
        LOADED = "caricato. Usa /bad config o /bad help.",
        ENABLED = "abilitato.",
        DISABLED = "disabilitato.",
        HELP_HEADER = "Comandi BAD:",
        HELP_CONFIG = "/bad config - apri opzioni",
        HELP_TEST = "/bad test - riproduci il suono di avviso",
        HELP_ON = "/bad on - abilita avvisi",
        HELP_OFF = "/bad off - disabilita avvisi",
        HELP_STATUS = "/bad status - mostra impostazioni attuali",
        HELP_SOUND = "/bad sound [next|chiave suono] - imposta suono di avviso",
        HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - imposta il tempo minimo tra i suoni",
        HELP_CHAT = "/bad chat - attiva/disattiva messaggi in chat",
        HELP_DEBUG = "/bad debug - attiva/disattiva messaggi di debug",
        HELP_COMBAT = "/bad combat - attiva/disattiva avvisi solo in combattimento",
        HELP_PREVIEW = "/bad preview - mostra/nascondi anteprima riquadri",
        STATUS = "Stato",
        OPTIONS = "Opzioni",
        CLOSE = "Chiudi",
        TEST_SOUND = "Prova suono",
        RESET_DEFAULTS = "Ripristina",
        ENABLE_ADDON = "Abilita avvisi",
        IGNORE_PETS = "Ignora famigli",
        IGNORE_DEAD = "Ignora morti/offline",
        ONLY_COMBAT = "Avvisa solo in combattimento",
        CHAT_MESSAGES = "Stampa messaggio in chat",
        ADVANCED = "Avanzate",
        SOUND = "Suono",
        NORMAL_SOUND = "Suono normale",
        DANGEROUS_SOUND = "Suono di pericolo",
        COOLDOWN = "Intervallo suono",
        SOUND_CHANNEL = "Canale audio",
        CHANNEL_MASTER = "Principale",
        CHANNEL_SFX = "Effetti",
        CHANNEL_AMBIENCE = "Ambiente",
        CHANNEL_MUSIC = "Musica",
        CHANNEL_DIALOG = "Dialogo",
        SECONDS = "s",
        PREVIOUS = "Precedente",
        NEXT = "Successivo",
        DEBUG = "Messaggi di debug in chat",
        TYPE_MAGIC = "Magia",
        TYPE_CURSE = "Maledizione",
        TYPE_POISON = "Veleno",
        TYPE_DISEASE = "Malattia",
        SOUND_DECURSIVE = "Afflizione Decursive",
        SOUND_DEADLY = "Pericolo Decursive",
        SOUND_BELL = "Campana",
        SOUND_RAID = "Avviso incursione",
        SOUND_READY = "Controllo pronti",
        UNKNOWN_SOUND = "Suono sconosciuto:",
        SOUND_SET = "Suono impostato su:",
        COOLDOWN_SET = "Tempo minimo tra i suoni impostato a %d secondi.",
        CHAT_ON = "Messaggi in chat abilitati.",
        CHAT_OFF = "Messaggi in chat disabilitati.",
        DEBUG_ON = "Debug abilitato.",
        DEBUG_OFF = "Debug disabilitato.",
        COMBAT_ON = "Avvisi solo in combattimento abilitati.",
        COMBAT_OFF = "Avvisi solo in combattimento disabilitati.",
        ALERT_FORMAT = "%s ha un %s rimovibile: %s",
        DANGEROUS_FORMAT = "Avviso dispel pericoloso: %s ha %s.",
        NONE = "Nessuno",
        CLASS_UNSUPPORTED = "La tua classe non ha un dispel difensivo configurato in BAD.",
        NO_DISPEL = "Nessun debuff rimovibile trovato.",
        SPELL_LOCKED = "Nessun incantesimo di dispel conosciuto per questo tipo di debuff.",
        VISUALS = "Riquadri Blizzard",
        SHOW_BORDER = "Evidenziazione colorata del riquadro",
        SHOW_ICONS = "Icone del tipo di debuff",
        BORDER_SIZE = "Dimensione bordo",
        ICON_SIZE = "Dimensione icona",
        CUSTOMIZE_COLORS = "Colori...",
        COLOR_TITLE = "Colori debuff",
        RESTORE_COLORS = "Ripristina colori",
        PREVIEW_FRAMES = "Anteprima riquadri",
        PREVIEW_TITLE = "Anteprima riquadri BAD",
        PREVIEW_LIVE = "Giocatore reale",
        PREVIEW_MULTIPLE = "Multipli",
        PREVIEW_UNAVAILABLE = "I riquadri compatti Blizzard non sono disponibili. Ricarica l'interfaccia.",
    },
    koKR = {
        LOADED = "로드되었습니다. /bad config 또는 /bad help를 사용하세요.",
        ENABLED = "활성화됨.",
        DISABLED = "비활성화됨.",
        HELP_HEADER = "BAD 명령어:",
        HELP_CONFIG = "/bad config - 옵션 열기",
        HELP_TEST = "/bad test - 경고음 재생",
        HELP_ON = "/bad on - 경고 활성화",
        HELP_OFF = "/bad off - 경고 비활성화",
        HELP_STATUS = "/bad status - 현재 설정 표시",
        HELP_SOUND = "/bad sound [next|sound key] - 경고음 설정",
        HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - 소리 사이 최소 시간 설정",
        HELP_CHAT = "/bad chat - 대화창 메시지 전환",
        HELP_DEBUG = "/bad debug - 디버그 메시지 전환",
        HELP_COMBAT = "/bad combat - 전투 중 경고만 전환",
        HELP_PREVIEW = "/bad preview - 블리자드 프레임 미리보기 전환",
        STATUS = "상태",
        OPTIONS = "옵션",
        CLOSE = "닫기",
        TEST_SOUND = "소리 테스트",
        RESET_DEFAULTS = "기본값 복원",
        ENABLE_ADDON = "경고 활성화",
        IGNORE_PETS = "소환수 무시",
        IGNORE_DEAD = "죽음/오프라인 무시",
        ONLY_COMBAT = "전투 중에만 경고",
        CHAT_MESSAGES = "대화창 메시지 출력",
        ADVANCED = "고급",
        SOUND = "소리",
        NORMAL_SOUND = "일반 소리",
        DANGEROUS_SOUND = "위험 소리",
        COOLDOWN = "소리 간격",
        SOUND_CHANNEL = "소리 채널",
        CHANNEL_MASTER = "전체",
        CHANNEL_SFX = "효과음",
        CHANNEL_AMBIENCE = "환경음",
        CHANNEL_MUSIC = "음악",
        CHANNEL_DIALOG = "대화",
        SECONDS = "초",
        PREVIOUS = "이전",
        NEXT = "다음",
        DEBUG = "대화창 디버그 메시지",
        TYPE_MAGIC = "마법",
        TYPE_CURSE = "저주",
        TYPE_POISON = "독",
        TYPE_DISEASE = "질병",
        SOUND_DECURSIVE = "Decursive 고통",
        SOUND_DEADLY = "Decursive 위험",
        SOUND_BELL = "종",
        SOUND_RAID = "공격대 경보",
        SOUND_READY = "준비 확인",
        UNKNOWN_SOUND = "알 수 없는 소리:",
        SOUND_SET = "소리 설정:",
        COOLDOWN_SET = "소리 사이 최소 시간이 %d초로 설정되었습니다.",
        CHAT_ON = "대화창 메시지가 활성화되었습니다.",
        CHAT_OFF = "대화창 메시지가 비활성화되었습니다.",
        DEBUG_ON = "디버그가 활성화되었습니다.",
        DEBUG_OFF = "디버그가 비활성화되었습니다.",
        COMBAT_ON = "전투 중 경고만 활성화되었습니다.",
        COMBAT_OFF = "전투 중 경고만 비활성화되었습니다.",
        ALERT_FORMAT = "%s에게 해제 가능한 %s 효과가 있습니다: %s",
        DANGEROUS_FORMAT = "위험한 해제 경고: %s에게 %s 효과가 있습니다.",
        NONE = "없음",
        CLASS_UNSUPPORTED = "현재 직업에는 BAD에 설정된 방어 해제가 없습니다.",
        NO_DISPEL = "해제 가능한 약화 효과를 찾지 못했습니다.",
        SPELL_LOCKED = "이 약화 효과 유형을 해제할 수 있는 배운 주문이 없습니다.",
        VISUALS = "블리자드 프레임",
        SHOW_BORDER = "프레임 색상 강조",
        SHOW_ICONS = "약화 효과 유형 아이콘",
        BORDER_SIZE = "테두리 크기",
        ICON_SIZE = "아이콘 크기",
        CUSTOMIZE_COLORS = "색상...",
        COLOR_TITLE = "약화 효과 색상",
        RESTORE_COLORS = "기본 색상 복원",
        PREVIEW_FRAMES = "프레임 미리보기",
        PREVIEW_TITLE = "BAD 프레임 미리보기",
        PREVIEW_LIVE = "실시간 플레이어",
        PREVIEW_MULTIPLE = "여러 유형",
        PREVIEW_UNAVAILABLE = "블리자드 컴팩트 프레임을 사용할 수 없습니다. UI를 다시 불러오세요.",
    },
    ruRU = {
        LOADED = "загружен. Используйте /bad config или /bad help.",
        ENABLED = "включен.",
        DISABLED = "выключен.",
        HELP_HEADER = "Команды BAD:",
        HELP_CONFIG = "/bad config - открыть настройки",
        HELP_TEST = "/bad test - воспроизвести звук оповещения",
        HELP_ON = "/bad on - включить оповещения",
        HELP_OFF = "/bad off - выключить оповещения",
        HELP_STATUS = "/bad status - показать текущие настройки",
        HELP_SOUND = "/bad sound [next|ключ звука] - задать звук оповещения",
        HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - задать минимум времени между звуками",
        HELP_CHAT = "/bad chat - переключить сообщения в чат",
        HELP_DEBUG = "/bad debug - переключить отладочные сообщения",
        HELP_COMBAT = "/bad combat - переключить оповещения только в бою",
        HELP_PREVIEW = "/bad preview - переключить предпросмотр рамок Blizzard",
        STATUS = "Статус",
        OPTIONS = "Настройки",
        CLOSE = "Закрыть",
        TEST_SOUND = "Проверить звук",
        RESET_DEFAULTS = "Сбросить",
        ENABLE_ADDON = "Включить оповещения",
        IGNORE_PETS = "Игнорировать питомцев",
        IGNORE_DEAD = "Игнорировать мертвых/оффлайн",
        ONLY_COMBAT = "Оповещать только в бою",
        CHAT_MESSAGES = "Писать сообщение в чат",
        ADVANCED = "Дополнительно",
        SOUND = "Звук",
        NORMAL_SOUND = "Обычный звук",
        DANGEROUS_SOUND = "Опасный звук",
        COOLDOWN = "Интервал звука",
        SOUND_CHANNEL = "Канал звука",
        CHANNEL_MASTER = "Общий",
        CHANNEL_SFX = "Эффекты",
        CHANNEL_AMBIENCE = "Окружение",
        CHANNEL_MUSIC = "Музыка",
        CHANNEL_DIALOG = "Диалог",
        SECONDS = "с",
        PREVIOUS = "Назад",
        NEXT = "Далее",
        DEBUG = "Отладочные сообщения в чат",
        TYPE_MAGIC = "Магия",
        TYPE_CURSE = "Проклятие",
        TYPE_POISON = "Яд",
        TYPE_DISEASE = "Болезнь",
        SOUND_DECURSIVE = "Недуг Decursive",
        SOUND_DEADLY = "Опасность Decursive",
        SOUND_BELL = "Колокол",
        SOUND_RAID = "Рейдовое предупреждение",
        SOUND_READY = "Проверка готовности",
        UNKNOWN_SOUND = "Неизвестный звук:",
        SOUND_SET = "Звук установлен:",
        COOLDOWN_SET = "Минимальное время между звуками установлено на %d сек.",
        CHAT_ON = "Сообщения в чат включены.",
        CHAT_OFF = "Сообщения в чат выключены.",
        DEBUG_ON = "Отладка включена.",
        DEBUG_OFF = "Отладка выключена.",
        COMBAT_ON = "Оповещения только в бою включены.",
        COMBAT_OFF = "Оповещения только в бою выключены.",
        ALERT_FORMAT = "На %s есть рассеиваемый эффект %s: %s",
        DANGEROUS_FORMAT = "Предупреждение об опасном рассеивании: на %s есть %s.",
        NONE = "Нет",
        CLASS_UNSUPPORTED = "У вашего класса нет настроенного защитного рассеивания в BAD.",
        NO_DISPEL = "Рассеиваемые отрицательные эффекты не найдены.",
        SPELL_LOCKED = "Нет изученного заклинания рассеивания для этого типа эффекта.",
        VISUALS = "Рамки Blizzard",
        SHOW_BORDER = "Цветовое выделение рамки",
        SHOW_ICONS = "Значки типов эффектов",
        BORDER_SIZE = "Толщина рамки",
        ICON_SIZE = "Размер значка",
        CUSTOMIZE_COLORS = "Цвета...",
        COLOR_TITLE = "Цвета эффектов",
        RESTORE_COLORS = "Цвета по умолчанию",
        PREVIEW_FRAMES = "Предпросмотр рамок",
        PREVIEW_TITLE = "Предпросмотр рамок BAD",
        PREVIEW_LIVE = "Текущий игрок",
        PREVIEW_MULTIPLE = "Несколько",
        PREVIEW_UNAVAILABLE = "Компактные рамки Blizzard недоступны. Перезагрузите интерфейс.",
    },
    zhCN = {
        LOADED = "已加载。使用 /bad config 或 /bad help。",
        ENABLED = "已启用。",
        DISABLED = "已禁用。",
        HELP_HEADER = "BAD 命令：",
        HELP_CONFIG = "/bad config - 打开选项",
        HELP_TEST = "/bad test - 播放警报声音",
        HELP_ON = "/bad on - 启用警报",
        HELP_OFF = "/bad off - 禁用警报",
        HELP_STATUS = "/bad status - 显示当前设置",
        HELP_SOUND = "/bad sound [next|sound key] - 设置警报声音",
        HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - 设置声音之间的最短时间",
        HELP_CHAT = "/bad chat - 切换聊天消息",
        HELP_DEBUG = "/bad debug - 切换调试消息",
        HELP_COMBAT = "/bad combat - 切换仅战斗中警报",
        HELP_PREVIEW = "/bad preview - 切换暴雪框体预览",
        STATUS = "状态",
        OPTIONS = "选项",
        CLOSE = "关闭",
        TEST_SOUND = "测试声音",
        RESET_DEFAULTS = "恢复默认",
        ENABLE_ADDON = "启用警报",
        IGNORE_PETS = "忽略宠物",
        IGNORE_DEAD = "忽略死亡/离线单位",
        ONLY_COMBAT = "仅战斗中警报",
        CHAT_MESSAGES = "打印聊天消息",
        ADVANCED = "高级",
        SOUND = "声音",
        NORMAL_SOUND = "普通声音",
        DANGEROUS_SOUND = "危险声音",
        COOLDOWN = "声音间隔",
        SOUND_CHANNEL = "声音频道",
        CHANNEL_MASTER = "主声道",
        CHANNEL_SFX = "音效",
        CHANNEL_AMBIENCE = "环境",
        CHANNEL_MUSIC = "音乐",
        CHANNEL_DIALOG = "对话",
        SECONDS = "秒",
        PREVIOUS = "上一个",
        NEXT = "下一个",
        DEBUG = "聊天调试消息",
        TYPE_MAGIC = "魔法",
        TYPE_CURSE = "诅咒",
        TYPE_POISON = "中毒",
        TYPE_DISEASE = "疾病",
        SOUND_DECURSIVE = "Decursive 痛苦",
        SOUND_DEADLY = "Decursive 致命",
        SOUND_BELL = "铃声",
        SOUND_RAID = "团队警报",
        SOUND_READY = "就绪检查",
        UNKNOWN_SOUND = "未知声音：",
        SOUND_SET = "声音设置为：",
        COOLDOWN_SET = "声音之间的最短时间已设置为 %d 秒。",
        CHAT_ON = "聊天消息已启用。",
        CHAT_OFF = "聊天消息已禁用。",
        DEBUG_ON = "调试已启用。",
        DEBUG_OFF = "调试已禁用。",
        COMBAT_ON = "仅战斗中警报已启用。",
        COMBAT_OFF = "仅战斗中警报已禁用。",
        ALERT_FORMAT = "%s 有可驱散的 %s：%s",
        DANGEROUS_FORMAT = "危险驱散警告：%s 有 %s。",
        NONE = "无",
        CLASS_UNSUPPORTED = "你的职业在 BAD 中没有配置防御驱散。",
        NO_DISPEL = "未找到可驱散的减益效果。",
        SPELL_LOCKED = "没有学会可驱散此类减益的法术。",
        VISUALS = "暴雪框体",
        SHOW_BORDER = "框体彩色高亮",
        SHOW_ICONS = "减益类型图标",
        BORDER_SIZE = "边框大小",
        ICON_SIZE = "图标大小",
        CUSTOMIZE_COLORS = "颜色...",
        COLOR_TITLE = "减益颜色",
        RESTORE_COLORS = "恢复默认颜色",
        PREVIEW_FRAMES = "框体预览",
        PREVIEW_TITLE = "BAD 框体预览",
        PREVIEW_LIVE = "实时玩家",
        PREVIEW_MULTIPLE = "多种",
        PREVIEW_UNAVAILABLE = "暴雪紧凑框体不可用。请重新加载界面。",
    },
    zhTW = {
        LOADED = "已載入。使用 /bad config 或 /bad help。",
        ENABLED = "已啟用。",
        DISABLED = "已停用。",
        HELP_HEADER = "BAD 指令：",
        HELP_CONFIG = "/bad config - 開啟選項",
        HELP_TEST = "/bad test - 播放警報音效",
        HELP_ON = "/bad on - 啟用警報",
        HELP_OFF = "/bad off - 停用警報",
        HELP_STATUS = "/bad status - 顯示目前設定",
        HELP_SOUND = "/bad sound [next|sound key] - 設定警報音效",
        HELP_COOLDOWN = "/bad cooldown <1|3|5|10|15|30> - 設定音效之間的最短時間",
        HELP_CHAT = "/bad chat - 切換聊天訊息",
        HELP_DEBUG = "/bad debug - 切換除錯訊息",
        HELP_COMBAT = "/bad combat - 切換僅戰鬥中警報",
        HELP_PREVIEW = "/bad preview - 切換暴雪框架預覽",
        STATUS = "狀態",
        OPTIONS = "選項",
        CLOSE = "關閉",
        TEST_SOUND = "測試音效",
        RESET_DEFAULTS = "恢復預設",
        ENABLE_ADDON = "啟用警報",
        IGNORE_PETS = "忽略寵物",
        IGNORE_DEAD = "忽略死亡/離線單位",
        ONLY_COMBAT = "僅戰鬥中警報",
        CHAT_MESSAGES = "輸出聊天訊息",
        ADVANCED = "進階",
        SOUND = "音效",
        NORMAL_SOUND = "一般音效",
        DANGEROUS_SOUND = "危險音效",
        COOLDOWN = "音效間隔",
        SOUND_CHANNEL = "音效頻道",
        CHANNEL_MASTER = "主音量",
        CHANNEL_SFX = "音效",
        CHANNEL_AMBIENCE = "環境",
        CHANNEL_MUSIC = "音樂",
        CHANNEL_DIALOG = "對話",
        SECONDS = "秒",
        PREVIOUS = "上一個",
        NEXT = "下一個",
        DEBUG = "聊天除錯訊息",
        TYPE_MAGIC = "魔法",
        TYPE_CURSE = "詛咒",
        TYPE_POISON = "中毒",
        TYPE_DISEASE = "疾病",
        SOUND_DECURSIVE = "Decursive 痛苦",
        SOUND_DEADLY = "Decursive 致命",
        SOUND_BELL = "鈴聲",
        SOUND_RAID = "團隊警報",
        SOUND_READY = "準備確認",
        UNKNOWN_SOUND = "未知音效：",
        SOUND_SET = "音效設定為：",
        COOLDOWN_SET = "音效之間的最短時間已設定為 %d 秒。",
        CHAT_ON = "聊天訊息已啟用。",
        CHAT_OFF = "聊天訊息已停用。",
        DEBUG_ON = "除錯已啟用。",
        DEBUG_OFF = "除錯已停用。",
        COMBAT_ON = "僅戰鬥中警報已啟用。",
        COMBAT_OFF = "僅戰鬥中警報已停用。",
        ALERT_FORMAT = "%s 有可驅散的 %s：%s",
        DANGEROUS_FORMAT = "危險驅散警告：%s 有 %s。",
        NONE = "無",
        CLASS_UNSUPPORTED = "你的職業在 BAD 中沒有設定防禦驅散。",
        NO_DISPEL = "未找到可驅散的減益效果。",
        SPELL_LOCKED = "沒有學會可驅散此類減益的法術。",
        VISUALS = "暴雪框架",
        SHOW_BORDER = "框架彩色醒目提示",
        SHOW_ICONS = "減益類型圖示",
        BORDER_SIZE = "邊框大小",
        ICON_SIZE = "圖示大小",
        CUSTOMIZE_COLORS = "顏色...",
        COLOR_TITLE = "負面效果顏色",
        RESTORE_COLORS = "恢復預設顏色",
        PREVIEW_FRAMES = "框架預覽",
        PREVIEW_TITLE = "BAD 框架預覽",
        PREVIEW_LIVE = "即時玩家",
        PREVIEW_MULTIPLE = "多種類型",
        PREVIEW_UNAVAILABLE = "暴雪精簡框架無法使用。請重新載入介面。",
    },
}

LOCALES.enGB = LOCALES.enUS

local function GetLocalizedStrings(locale)
    local strings = LOCALES[locale] or LOCALES.enUS
    if strings ~= LOCALES.enUS then
        setmetatable(strings, { __index = LOCALES.enUS })
    end
    return strings
end

local L = GetLocalizedStrings(LOCALE)

local TYPE_LABELS = {
    Magic = L.TYPE_MAGIC,
    Curse = L.TYPE_CURSE,
    Poison = L.TYPE_POISON,
    Disease = L.TYPE_DISEASE,
}

local DISPEL_TYPE_ORDER = { "Magic", "Curse", "Disease", "Poison" }
local COLOR_OPTION_ORDER = { "Magic", "Curse", "Disease", "Poison", "Multiple" }
local VISUAL_GLOW_ALPHAS = { 0.30, 0.12 }
local VISUAL_ICON_FRAME_LEVEL = 300
local VISUAL_CURSE_FRAME_LEVEL = 400

local function GetInitialDispelColor(dispelType, fallback)
    local color = DebuffTypeColor and DebuffTypeColor[dispelType]
    if color then
        return {
            color.r or color[1] or fallback[1],
            color.g or color[2] or fallback[2],
            color.b or color[3] or fallback[3],
        }
    end
    return fallback
end

local DEFAULT_VISUAL_COLORS = {
    Magic = GetInitialDispelColor("Magic", { 0.20, 0.60, 1.00 }),
    Curse = GetInitialDispelColor("Curse", { 0.60, 0.20, 1.00 }),
    Disease = GetInitialDispelColor("Disease", { 0.90, 0.75, 0.10 }),
    Poison = GetInitialDispelColor("Poison", { 0.10, 0.90, 0.20 }),
    Multiple = { 1.00, 1.00, 1.00 },
}
local DISPEL_TYPE_TEXTURES = {
    Magic = "Interface\\RaidFrame\\Raid-Icon-DebuffMagic",
    Curse = "Interface\\RaidFrame\\Raid-Icon-DebuffCurse",
    Disease = "Interface\\RaidFrame\\Raid-Icon-DebuffDisease",
    Poison = "Interface\\RaidFrame\\Raid-Icon-DebuffPoison",
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
    cooldown = 5,
    requireKnownSpell = true,
    requireUsableSpell = false,
    checkSpellCooldown = false,
    warnDangerous = true,
    showVisualBorder = true,
    showVisualIcons = true,
    visualBorderSize = 4,
    visualIconSize = 16,
    visualColors = DEFAULT_VISUAL_COLORS,
}

local SOUND_ORDER = {
    "decursive",
    "bell",
    "raid",
    "ready",
    "deadly",
}
local COOLDOWN_OPTIONS = { 1, 3, 5, 10, 15, 30 }
local BORDER_SIZE_OPTIONS = { 2, 3, 4, 5, 6, 8 }
local ICON_SIZE_OPTIONS = { 12, 14, 16, 18, 20, 24 }
local CHANNEL_ORDER = { "Master", "SFX", "Ambience", "Music", "Dialog" }
local CHANNEL_LABELS = {
    Master = L.CHANNEL_MASTER,
    SFX = L.CHANNEL_SFX,
    Ambience = L.CHANNEL_AMBIENCE,
    Music = L.CHANNEL_MUSIC,
    Dialog = L.CHANNEL_DIALOG,
}

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
local visualUnitStates = {}
local lastSoundTime = 0
local scanQueued = false
local optionsFrame
local interfacePanel
local settingsCategory
local standaloneWindow
local previewWindow
local colorOptionsWindow
local compactFrameSetupHookInstalled = false
local compactFrameUnitHookInstalled = false
local visualFrames = setmetatable({}, { __mode = "k" })
local pendingVisualFrames = setmetatable({}, { __mode = "k" })

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

local function GetPixelLabel(value)
    return tostring(tonumber(value) or 0) .. " px"
end

local function NormalizeOptionValue(value, options, fallback)
    value = tonumber(value) or fallback
    local closest = options[1]
    local closestDistance = math.abs(value - closest)

    for _, option in ipairs(options) do
        local distance = math.abs(value - option)
        if distance < closestDistance then
            closest = option
            closestDistance = distance
        end
    end

    return closest
end

local function NormalizeColorComponent(value, fallback)
    value = tonumber(value)
    if value == nil then
        return fallback
    end
    return math.max(0, math.min(1, value))
end

local function NormalizeVisualColors(colors)
    if type(colors) ~= "table" then
        colors = {}
    end

    for colorKey, defaultColor in pairs(DEFAULT_VISUAL_COLORS) do
        local color = colors[colorKey]
        if type(color) ~= "table" then
            color = {}
            colors[colorKey] = color
        end
        color[1] = NormalizeColorComponent(color[1] or color.r, defaultColor[1])
        color[2] = NormalizeColorComponent(color[2] or color.g, defaultColor[2])
        color[3] = NormalizeColorComponent(color[3] or color.b, defaultColor[3])
        color.r = nil
        color.g = nil
        color.b = nil
    end

    return colors
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

local function GetChannelLabel(value)
    return CHANNEL_LABELS[value] or CHANNEL_LABELS[DEFAULT_DB.soundChannel]
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
    db.cooldown = NormalizeCooldown(db.cooldown)
    db.visualBorderSize = NormalizeOptionValue(db.visualBorderSize, BORDER_SIZE_OPTIONS, DEFAULT_DB.visualBorderSize)
    db.visualIconSize = NormalizeOptionValue(db.visualIconSize, ICON_SIZE_OPTIONS, DEFAULT_DB.visualIconSize)
    db.visualColors = NormalizeVisualColors(db.visualColors)
    db.soundVolume = nil
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
        local ok = pcall(PlaySound, kit, channel)
        return ok and true or false
    end
    return false
end

local function PlaySoundOption(soundKey)
    local option = SOUND_OPTIONS[soundKey] or SOUND_OPTIONS.decursive
    if option.file and PlaySoundFile then
        local channel = db.soundChannel or DEFAULT_DB.soundChannel
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

local function GetDispelTypeColor(dispelType)
    local fallback = DEFAULT_VISUAL_COLORS[dispelType] or DEFAULT_VISUAL_COLORS.Multiple
    local color = db and db.visualColors and db.visualColors[dispelType] or fallback
    return color[1] or fallback[1], color[2] or fallback[2], color[3] or fallback[3]
end

local function IsTrackedCompactUnit(unit)
    if type(unit) ~= "string" then
        return false
    end

    if unit == "player" or unit:match("^party%d+$") or unit:match("^raid%d+$") then
        return true
    end

    if not db.ignorePets and (unit == "pet" or unit:match("^partypet%d+$") or unit:match("^raidpet%d+$")) then
        return true
    end

    return false
end

local function GetGlowLayerSize(borderSize, layerIndex)
    if layerIndex == 1 then
        return math.max(2, math.floor((borderSize * 0.75) + 0.5))
    end
    return borderSize
end

local function SetEdgePoints(edge, parent, side, inset, thickness, cornerInset)
    edge:ClearAllPoints()
    if side == "TOP" then
        edge:SetPoint("TOPLEFT", parent, "TOPLEFT", cornerInset, -inset)
        edge:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -cornerInset, -inset)
        edge:SetHeight(thickness)
    elseif side == "RIGHT" then
        edge:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -inset, -cornerInset)
        edge:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -inset, cornerInset)
        edge:SetWidth(thickness)
    elseif side == "BOTTOM" then
        edge:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", cornerInset, inset)
        edge:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -cornerInset, inset)
        edge:SetHeight(thickness)
    else
        edge:SetPoint("TOPLEFT", parent, "TOPLEFT", inset, -cornerInset)
        edge:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", inset, cornerInset)
        edge:SetWidth(thickness)
    end
end

local function UpdateVisualOverlayLayout(frame, overlay)
    local borderSize = db.visualBorderSize or DEFAULT_DB.visualBorderSize
    local iconSize = db.visualIconSize or DEFAULT_DB.visualIconSize
    if overlay.borderSize == borderSize and overlay.iconSize == iconSize then
        return true
    end

    if InCombatLockdown and InCombatLockdown() then
        pendingVisualFrames[frame] = true
        return false
    end

    overlay:SetFrameLevel((frame.GetFrameLevel and frame:GetFrameLevel() or 0) + 20)
    for _, edge in ipairs(overlay.border) do
        SetEdgePoints(edge.texture, overlay, edge.side, 0, borderSize, 0)
    end

    for _, glow in ipairs(overlay.innerGlow) do
        local inset = borderSize
        for layerIndex = 1, glow.layerIndex - 1 do
            inset = inset + GetGlowLayerSize(borderSize, layerIndex)
        end
        SetEdgePoints(
            glow.texture,
            overlay,
            glow.side,
            inset,
            GetGlowLayerSize(borderSize, glow.layerIndex),
            borderSize
        )
    end

    for index, slot in ipairs(overlay.icons) do
        slot:SetFrameLevel(overlay:GetFrameLevel() + VISUAL_ICON_FRAME_LEVEL + index)
    end

    overlay.borderSize = borderSize
    overlay.iconSize = iconSize
    overlay.visibleIconCount = nil
    return true
end

local function UpdateVisibleIconLayout(frame, overlay, visibleCount)
    local configuredSize = db.visualIconSize or DEFAULT_DB.visualIconSize
    local frameWidth = math.floor((frame.GetWidth and frame:GetWidth() or configuredSize) + 0.5)
    local frameHeight = math.floor((frame.GetHeight and frame:GetHeight() or configuredSize) + 0.5)
    if overlay.visibleIconCount == visibleCount
        and overlay.visibleIconConfiguredSize == configuredSize
        and overlay.visibleIconFrameWidth == frameWidth
        and overlay.visibleIconFrameHeight == frameHeight then
        return
    end

    local gap = visibleCount > 1 and 2 or 0
    local horizontalPadding = 6
    local verticalPadding = 6
    local availableWidth = math.max(visibleCount, frameWidth - horizontalPadding - (gap * (visibleCount - 1)))
    local availableHeight = math.max(1, frameHeight - verticalPadding)
    local fittedSize = math.max(1, math.floor(availableWidth / visibleCount))
    local iconSize = math.min(configuredSize, fittedSize, availableHeight)

    for index, slot in ipairs(overlay.icons) do
        slot:ClearAllPoints()
        slot:SetSize(iconSize, iconSize)
        slot:SetPoint("BOTTOMRIGHT", overlay, "BOTTOMRIGHT", -3 - ((index - 1) * (iconSize + gap)), 3)
    end

    overlay.visibleIconCount = visibleCount
    overlay.visibleIconConfiguredSize = configuredSize
    overlay.visibleIconFrameWidth = frameWidth
    overlay.visibleIconFrameHeight = frameHeight
end

local function CreateVisualOverlay(frame)
    if frame.BADVisualOverlay then
        return frame.BADVisualOverlay
    end

    if InCombatLockdown and InCombatLockdown() then
        pendingVisualFrames[frame] = true
        return nil
    end

    local ok, overlay = pcall(CreateFrame, "Frame", nil, frame)
    if not ok or not overlay then
        return nil
    end

    overlay:SetAllPoints(frame)
    overlay:EnableMouse(false)

    overlay.border = {}
    local edgeDefinitions = {
        { side = "TOP" },
        { side = "RIGHT" },
        { side = "BOTTOM" },
        { side = "LEFT" },
    }
    for edgeIndex, definition in ipairs(edgeDefinitions) do
        local edge = overlay:CreateTexture(nil, "OVERLAY", nil, 7)
        edge:Hide()
        overlay.border[edgeIndex] = {
            texture = edge,
            side = definition.side,
        }
    end

    overlay.innerGlow = {}
    for layerIndex, alpha in ipairs(VISUAL_GLOW_ALPHAS) do
        for _, definition in ipairs(edgeDefinitions) do
            local edge = overlay:CreateTexture(nil, "OVERLAY", nil, 5)
            edge:Hide()
            overlay.innerGlow[#overlay.innerGlow + 1] = {
                texture = edge,
                alpha = alpha,
                layerIndex = layerIndex,
                side = definition.side,
            }
        end
    end

    overlay.icons = {}
    for index = 1, #DISPEL_TYPE_ORDER do
        local slot = CreateFrame("Frame", nil, overlay)
        slot:EnableMouse(false)
        slot:Hide()

        slot.background = slot:CreateTexture(nil, "BACKGROUND")
        slot.background:SetAllPoints(slot)
        slot.background:SetColorTexture(0, 0, 0, 1)

        slot.icon = slot:CreateTexture(nil, "OVERLAY", nil, 7)
        slot.icon:SetPoint("TOPLEFT", slot, "TOPLEFT", 1, -1)
        slot.icon:SetPoint("BOTTOMRIGHT", slot, "BOTTOMRIGHT", -1, 1)
        if slot.CreateMaskTexture and slot.icon.AddMaskTexture then
            local mask = slot:CreateMaskTexture()
            mask:SetPoint("TOPLEFT", slot, "TOPLEFT", 1, -1)
            mask:SetPoint("BOTTOMRIGHT", slot, "BOTTOMRIGHT", -1, 1)
            slot.icon:AddMaskTexture(mask)
            slot.iconMask = mask
        end
        overlay.icons[index] = slot
    end

    UpdateVisualOverlayLayout(frame, overlay)
    overlay:Hide()
    frame.BADVisualOverlay = overlay
    return overlay
end

local function RenderVisualState(frame, state)
    local overlay = CreateVisualOverlay(frame)
    if not overlay or not UpdateVisualOverlayLayout(frame, overlay) then
        return
    end

    local types = state and state.types
    local visibleTypes = {}
    for _, dispelType in ipairs(DISPEL_TYPE_ORDER) do
        if types and types[dispelType] then
            visibleTypes[#visibleTypes + 1] = dispelType
        end
    end

    if #visibleTypes == 0 or (not db.showVisualBorder and not db.showVisualIcons) then
        overlay:Hide()
        return
    end

    UpdateVisibleIconLayout(frame, overlay, #visibleTypes)

    local r, g, b
    if #visibleTypes > 1 then
        r, g, b = GetDispelTypeColor("Multiple")
    else
        r, g, b = GetDispelTypeColor(visibleTypes[1])
    end

    for _, edge in ipairs(overlay.border) do
        edge.texture:SetColorTexture(r, g, b, 1)
        if db.showVisualBorder then
            edge.texture:Show()
        else
            edge.texture:Hide()
        end
    end

    for _, glow in ipairs(overlay.innerGlow) do
        glow.texture:SetColorTexture(r, g, b, glow.alpha)
        if db.showVisualBorder then
            glow.texture:Show()
        else
            glow.texture:Hide()
        end
    end

    for index, slot in ipairs(overlay.icons) do
        local dispelType = visibleTypes[index]
        if db.showVisualIcons and dispelType then
            local iconR, iconG, iconB = GetDispelTypeColor(dispelType)
            if slot.iconMask then
                slot.iconMask:SetTexture(DISPEL_TYPE_TEXTURES[dispelType])
                slot.icon:SetColorTexture(iconR, iconG, iconB, 1)
                slot.icon:SetVertexColor(1, 1, 1, 1)
            else
                slot.icon:SetTexture(DISPEL_TYPE_TEXTURES[dispelType])
                if slot.icon.SetDesaturated then
                    slot.icon:SetDesaturated(true)
                end
                slot.icon:SetVertexColor(iconR, iconG, iconB, 1)
            end
            local priority = dispelType == "Curse" and VISUAL_CURSE_FRAME_LEVEL or VISUAL_ICON_FRAME_LEVEL + index
            slot:SetFrameLevel(overlay:GetFrameLevel() + priority)
            slot:Show()
        else
            slot:Hide()
        end
    end

    overlay:Show()
end

function Bad:RefreshVisualFrame(frame)
    if not frame or not frame.BADVisualOverlay then
        return
    end

    local unit = frame.displayedUnit or frame.unit
    if not db or not db.enabled or not IsTrackedCompactUnit(unit) then
        frame.BADVisualOverlay:Hide()
        return
    end

    local key = GetUnitKey(unit)
    RenderVisualState(frame, visualUnitStates[key])
end

function Bad:RefreshVisualFrames()
    for frame in pairs(visualFrames) do
        self:RefreshVisualFrame(frame)
    end
    if self.RefreshPreview then
        self:RefreshPreview()
    end
end

function Bad:RegisterCompactVisualFrame(frame)
    if not frame or frame.BADIsPreview or (visualFrames[frame] and frame.BADVisualOverlay) then
        return
    end

    if type(frame.IsForbidden) == "function" and frame:IsForbidden() then
        return
    end

    local name = frame.GetName and frame:GetName()
    if type(name) == "string" and name:match("^NamePlate") then
        return
    end

    visualFrames[frame] = true
    CreateVisualOverlay(frame)
    self:RefreshVisualFrame(frame)
end

local function WalkCompactFrames(frame, depth, seen)
    if not frame or depth > 5 or seen[frame] then
        return
    end
    seen[frame] = true

    if frame.unit or frame.displayedUnit then
        Bad:RegisterCompactVisualFrame(frame)
    end

    if frame.GetChildren then
        local children = { frame:GetChildren() }
        for _, child in ipairs(children) do
            WalkCompactFrames(child, depth + 1, seen)
        end
    end
end

function Bad:DiscoverCompactFrames()
    local seen = {}
    WalkCompactFrames(_G.CompactRaidFrameContainer, 0, seen)
    WalkCompactFrames(_G.CompactPartyFrame, 0, seen)

    for index = 1, 40 do
        self:RegisterCompactVisualFrame(_G["CompactRaidFrame" .. index])
    end
    for index = 1, 5 do
        self:RegisterCompactVisualFrame(_G["CompactPartyMemberFrame" .. index])
    end
end

function Bad:InstallCompactFrameHooks()
    if not hooksecurefunc then
        return
    end

    if not compactFrameSetupHookInstalled and type(CompactUnitFrame_SetUpFrame) == "function" then
        hooksecurefunc("CompactUnitFrame_SetUpFrame", function(frame)
            Bad:RegisterCompactVisualFrame(frame)
        end)
        compactFrameSetupHookInstalled = true
    end

    if not compactFrameUnitHookInstalled and type(CompactUnitFrame_SetUnit) == "function" then
        hooksecurefunc("CompactUnitFrame_SetUnit", function(frame)
            Bad:RegisterCompactVisualFrame(frame)
            Bad:RefreshVisualFrame(frame)
        end)
        compactFrameUnitHookInstalled = true
    end

    self:DiscoverCompactFrames()
end

function Bad:ProcessPendingVisualFrames()
    for frame in pairs(pendingVisualFrames) do
        pendingVisualFrames[frame] = nil
        self:RegisterCompactVisualFrame(frame)
    end
    self:DiscoverCompactFrames()
    self:RefreshVisualFrames()
end

function Bad:Scan()
    if not db or not db.enabled then
        activeDebuffs = {}
        visualUnitStates = {}
        self:RefreshVisualFrames()
        return
    end

    if db.onlyCombat and UnitAffectingCombat and not UnitAffectingCombat("player") then
        activeDebuffs = {}
        visualUnitStates = {}
        self:RefreshVisualFrames()
        return
    end

    local classSpells = playerClass and CLASS_DISPELS[playerClass]
    if not classSpells then
        visualUnitStates = {}
        self:RefreshVisualFrames()
        Debug(L.CLASS_UNSUPPORTED)
        return
    end

    local current = {}
    local currentVisualUnits = {}
    local firstNewAlert

    for _, unit in ipairs(BuildUnitList()) do
        if UnitShouldBeScanned(unit) then
            local alerts = FindRemovableDebuffs(unit)
            for _, alert in ipairs(alerts) do
                local key = GetAlertKey(alert)
                current[key] = true

                local visualState = currentVisualUnits[alert.unitKey]
                if not visualState then
                    visualState = { types = {} }
                    currentVisualUnits[alert.unitKey] = visualState
                end
                visualState.types[alert.type] = true

                if not activeDebuffs[key] and not firstNewAlert then
                    firstNewAlert = alert
                end
            end
        end
    end

    activeDebuffs = current
    visualUnitStates = currentVisualUnits
    self:RefreshVisualFrames()

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

local function SetColorWindowEscapeEnabled(enabled)
    if not UISpecialFrames then
        return
    end

    for index = #UISpecialFrames, 1, -1 do
        if UISpecialFrames[index] == "BADColorOptionsFrame" then
            table.remove(UISpecialFrames, index)
        end
    end

    if enabled then
        UISpecialFrames[#UISpecialFrames + 1] = "BADColorOptionsFrame"
    end
end

local function SetVisualColor(colorKey, r, g, b)
    db.visualColors[colorKey] = {
        NormalizeColorComponent(r, 1),
        NormalizeColorComponent(g, 1),
        NormalizeColorComponent(b, 1),
    }
    Bad:RefreshColorOptions()
    Bad:RefreshVisualFrames()
end

function Bad:OpenVisualColorPicker(colorKey)
    if not ColorPickerFrame then
        return
    end

    local r, g, b = GetDispelTypeColor(colorKey)
    local previous = { r, g, b }
    local function ApplyPickerColor()
        local newR, newG, newB = ColorPickerFrame:GetColorRGB()
        SetVisualColor(colorKey, newR, newG, newB)
    end
    local function CancelPickerColor()
        SetVisualColor(colorKey, previous[1], previous[2], previous[3])
    end

    ColorPickerFrame:Hide()
    ColorPickerFrame:SetFrameStrata("TOOLTIP")
    ColorPickerFrame:SetClampedToScreen(true)
    if ColorPickerFrame.SetupColorPickerAndShow then
        ColorPickerFrame:SetupColorPickerAndShow({
            swatchFunc = ApplyPickerColor,
            cancelFunc = CancelPickerColor,
            hasOpacity = false,
            r = r,
            g = g,
            b = b,
        })
    else
        ColorPickerFrame.func = ApplyPickerColor
        ColorPickerFrame.cancelFunc = CancelPickerColor
        ColorPickerFrame.hasOpacity = false
        ColorPickerFrame.opacityFunc = nil
        ColorPickerFrame.previousValues = previous
        ColorPickerFrame:SetColorRGB(r, g, b)
        ColorPickerFrame:Show()
    end
end

function Bad:RefreshColorOptions()
    if not colorOptionsWindow or not colorOptionsWindow.swatches then
        return
    end

    for colorKey, swatch in pairs(colorOptionsWindow.swatches) do
        local r, g, b = GetDispelTypeColor(colorKey)
        swatch.color:SetColorTexture(r, g, b, 1)
    end
end

function Bad:CreateColorOptionsWindow()
    if colorOptionsWindow then
        return colorOptionsWindow
    end

    local ok, window = pcall(CreateFrame, "Frame", "BADColorOptionsFrame", UIParent, "BasicFrameTemplateWithInset")
    if not ok or not window then
        window = CreateFrame("Frame", "BADColorOptionsFrame", UIParent)
    end
    window:SetSize(320, 270)
    window:SetPoint("CENTER", UIParent, "CENTER", -520, 0)
    window:SetFrameStrata("FULLSCREEN_DIALOG")
    window:SetToplevel(true)
    window:SetClampedToScreen(true)
    window:EnableMouse(true)
    window:SetMovable(true)
    window:RegisterForDrag("LeftButton")
    window:SetScript("OnDragStart", window.StartMoving)
    window:SetScript("OnDragStop", window.StopMovingOrSizing)
    window:SetScript("OnShow", function()
        SetColorWindowEscapeEnabled(true)
        Bad:RefreshColorOptions()
    end)
    window:SetScript("OnHide", function()
        SetColorWindowEscapeEnabled(false)
        if ColorPickerFrame and ColorPickerFrame:IsShown() then
            ColorPickerFrame:Hide()
        end
    end)
    window:Hide()

    local closeButton = window.CloseButton or _G.BADColorOptionsFrameCloseButton
    if closeButton then
        closeButton:SetScript("OnClick", function()
            window:Hide()
        end)
    end

    local title = CreateText(window, L.COLOR_TITLE, "GameFontHighlight")
    title:SetPoint("TOP", window, "TOP", 0, -6)

    window.swatches = {}
    for index, colorKey in ipairs(COLOR_OPTION_ORDER) do
        local swatchColorKey = colorKey
        local label = CreateText(window, swatchColorKey == "Multiple" and L.PREVIEW_MULTIPLE or TYPE_LABELS[swatchColorKey], "GameFontNormal")
        label:SetPoint("TOPLEFT", window, "TOPLEFT", 34, -44 - ((index - 1) * 34))

        local swatchOk, swatch = pcall(CreateFrame, "Button", nil, window, "BackdropTemplate")
        if not swatchOk or not swatch then
            swatch = CreateFrame("Button", nil, window)
        end
        swatch:SetSize(52, 24)
        swatch:SetPoint("TOPRIGHT", window, "TOPRIGHT", -34, -38 - ((index - 1) * 34))
        swatch:EnableMouse(true)
        if swatch.SetBackdrop then
            swatch:SetBackdrop({
                bgFile = "Interface\\Buttons\\WHITE8X8",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                edgeSize = 12,
                insets = { left = 2, right = 2, top = 2, bottom = 2 },
            })
            swatch:SetBackdropColor(0.05, 0.05, 0.05, 1)
            swatch:SetBackdropBorderColor(0.7, 0.7, 0.7, 1)
        end
        swatch.color = swatch:CreateTexture(nil, "ARTWORK")
        swatch.color:SetPoint("TOPLEFT", swatch, "TOPLEFT", 4, -4)
        swatch.color:SetPoint("BOTTOMRIGHT", swatch, "BOTTOMRIGHT", -4, 4)
        swatch:SetScript("OnClick", function()
            Bad:OpenVisualColorPicker(swatchColorKey)
        end)
        window.swatches[swatchColorKey] = swatch
    end

    local restoreButton = CreateButton(window, L.RESTORE_COLORS, 190, 24)
    restoreButton:SetPoint("BOTTOM", window, "BOTTOM", 0, 20)
    restoreButton:SetScript("OnClick", function()
        if ColorPickerFrame then
            ColorPickerFrame:Hide()
        end
        db.visualColors = CopyDefaults(DEFAULT_VISUAL_COLORS)
        Bad:RefreshColorOptions()
        Bad:RefreshVisualFrames()
    end)

    colorOptionsWindow = window
    self:RefreshColorOptions()
    return window
end

function Bad:ToggleColorOptions()
    local window = self:CreateColorOptionsWindow()
    if window:IsShown() then
        window:Hide()
    else
        window:Show()
        window:Raise()
    end
end

local function LoadBlizzardAddon(addonName)
    if C_AddOns and C_AddOns.LoadAddOn then
        return pcall(C_AddOns.LoadAddOn, addonName)
    end
    if LoadAddOn then
        return pcall(LoadAddOn, addonName)
    end
    return false
end

local function PrepareBlizzardPreviewFrames()
    LoadBlizzardAddon("Blizzard_UnitFrame")
    LoadBlizzardAddon("Blizzard_CompactRaidFrames")
    Bad:InstallCompactFrameHooks()

    return type(CompactUnitFrame_SetUpFrame) == "function"
        and type(CompactUnitFrame_SetUnit) == "function"
        and type(DefaultCompactUnitFrameSetup) == "function"
end

local function CreatePreviewUnit(parent, index)
    if not PrepareBlizzardPreviewFrames() then
        return nil
    end

    local frameName = "BADBlizzardPreviewUnit" .. tostring(index)
    local frame = _G[frameName]
    if not frame then
        local ok
        ok, frame = pcall(CreateFrame, "Button", frameName, parent, "CompactRaidGroupUnitFrameTemplate")
        if not ok or not frame then
            Debug("native preview frame creation failed: " .. tostring(frame))
            return nil
        end
    else
        frame:SetParent(parent)
    end

    frame.BADIsPreview = true
    if CompactRaidGroupTypeEnum and CompactRaidGroupTypeEnum.Raid then
        frame.groupType = CompactRaidGroupTypeEnum.Raid
    end

    local setupOk, setupError = pcall(CompactUnitFrame_SetUpFrame, frame, DefaultCompactUnitFrameSetup)
    local unitOk, unitError = false, nil
    if setupOk then
        unitOk, unitError = pcall(CompactUnitFrame_SetUnit, frame, "player")
    end
    if not setupOk or not unitOk then
        Debug("native preview frame setup failed: " .. tostring(setupOk and unitError or setupError))
        frame:Hide()
        return nil
    end

    frame:SetFrameStrata(parent:GetFrameStrata())
    frame:SetFrameLevel(parent:GetFrameLevel() + 10 + index)
    frame:EnableMouse(false)
    frame:Show()
    return frame
end

local function SetPreviewEscapeEnabled(enabled)
    if not UISpecialFrames then
        return
    end

    for index = #UISpecialFrames, 1, -1 do
        if UISpecialFrames[index] == "BADVisualPreviewFrame" then
            table.remove(UISpecialFrames, index)
        end
    end

    if enabled then
        UISpecialFrames[#UISpecialFrames + 1] = "BADVisualPreviewFrame"
    end
end

function Bad:RefreshPreview()
    if not previewWindow or not previewWindow.previewRows then
        return
    end

    for _, row in ipairs(previewWindow.previewRows) do
        local state = row.live and visualUnitStates[GetUnitKey("player")] or row.state
        RenderVisualState(row.frame, state)
    end
end

function Bad:CreatePreviewWindow()
    if previewWindow then
        return previewWindow
    end

    local ok, window = pcall(CreateFrame, "Frame", "BADVisualPreviewFrame", UIParent, "BasicFrameTemplateWithInset")
    if not ok or not window then
        window = CreateFrame("Frame", "BADVisualPreviewFrame", UIParent)
    end
    window:SetSize(390, 300)
    window:SetPoint("CENTER", UIParent, "CENTER", 360, 0)
    window:SetFrameStrata("FULLSCREEN_DIALOG")
    window:SetToplevel(true)
    window:SetClampedToScreen(true)
    window:EnableMouse(true)
    window:SetMovable(true)
    window:RegisterForDrag("LeftButton")
    window:SetScript("OnDragStart", function(self)
        if not InCombatLockdown or not InCombatLockdown() then
            self:StartMoving()
        end
    end)
    window:SetScript("OnDragStop", window.StopMovingOrSizing)
    window:SetScript("OnShow", function()
        Bad:RefreshPreview()
    end)
    window:Hide()

    SetPreviewEscapeEnabled(true)

    local closeButton = window.CloseButton or _G.BADVisualPreviewFrameCloseButton
    if closeButton then
        closeButton:SetScript("OnClick", function()
            if InCombatLockdown and InCombatLockdown() then
                if UIErrorsFrame and ERR_NOT_IN_COMBAT then
                    UIErrorsFrame:AddMessage(ERR_NOT_IN_COMBAT, 1, 0.1, 0.1)
                end
                return
            end
            window:Hide()
        end)
    end

    local title = CreateText(window, L.PREVIEW_TITLE, "GameFontHighlight")
    title:SetPoint("TOP", window, "TOP", 0, -6)

    local previews = {
        { label = L.PREVIEW_LIVE, live = true, types = {} },
        { label = TYPE_LABELS.Magic, types = { Magic = true } },
        { label = TYPE_LABELS.Curse, types = { Curse = true } },
        { label = TYPE_LABELS.Poison, types = { Poison = true } },
        { label = TYPE_LABELS.Disease, types = { Disease = true } },
        { label = L.PREVIEW_MULTIPLE, types = { Magic = true, Curse = true, Poison = true, Disease = true } },
    }

    window.previewRows = {}
    local maxFrameWidth = 0
    local maxFrameHeight = 0
    for index, preview in ipairs(previews) do
        local frame = CreatePreviewUnit(window, index)
        if not frame then
            break
        end

        maxFrameWidth = math.max(maxFrameWidth, frame:GetWidth() or 0)
        maxFrameHeight = math.max(maxFrameHeight, frame:GetHeight() or 0)
        window.previewRows[#window.previewRows + 1] = {
            frame = frame,
            label = preview.label,
            live = preview.live,
            state = { types = preview.types },
        }
    end

    if #window.previewRows == #previews then
        local rowHeight = math.max(38, maxFrameHeight + 8)
        window:SetSize(math.max(390, 190 + maxFrameWidth), 54 + (#previews * rowHeight))

        for index, row in ipairs(window.previewRows) do
            row.frame:ClearAllPoints()
            row.frame:SetPoint("TOPLEFT", window, "TOPLEFT", 160, -38 - ((index - 1) * rowHeight))

            local label = CreateText(window, row.label, "GameFontNormalSmall")
            label:SetPoint("RIGHT", row.frame, "LEFT", -12, 0)
            label:SetWidth(125)
            label:SetJustifyH("RIGHT")
            row.labelRegion = label
        end
    else
        for _, row in ipairs(window.previewRows) do
            row.frame:Hide()
        end
        window.previewRows = {}
        window:SetSize(430, 140)

        local unavailable = CreateText(window, L.PREVIEW_UNAVAILABLE, "GameFontHighlight")
        unavailable:SetPoint("TOPLEFT", window, "TOPLEFT", 28, -50)
        unavailable:SetPoint("TOPRIGHT", window, "TOPRIGHT", -28, -50)
        unavailable:SetJustifyH("CENTER")
        unavailable:SetWordWrap(true)
    end

    previewWindow = window
    self:RefreshPreview()
    return window
end

function Bad:TogglePreview()
    if InCombatLockdown and InCombatLockdown() then
        if UIErrorsFrame and ERR_NOT_IN_COMBAT then
            UIErrorsFrame:AddMessage(ERR_NOT_IN_COMBAT, 1, 0.1, 0.1)
        end
        return
    end

    local window = self:CreatePreviewWindow()
    if window:IsShown() then
        window:Hide()
    else
        self:RefreshPreview()
        window:Show()
        window:Raise()
    end
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
        Bad:RefreshPreview()
        Bad:RefreshVisualFrames()
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

local function CreateVisualSizeDropdown(parent, frameName, options, settingKey)
    local dropdown = CreateSimpleDropdown(parent, frameName, 72, options, GetPixelLabel, function(value)
        return db[settingKey] == value
    end, function(value)
        db[settingKey] = value
        Bad:RefreshVisualFrames()
    end)
    if dropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(dropdown, GetPixelLabel(db[settingKey]))
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
    frame:SetSize(640, 420)
    frame:SetScript("OnHide", function()
        if colorOptionsWindow then
            colorOptionsWindow:Hide()
        end
    end)
    frame:Hide()

    local title = CreateText(frame, L.ADDON_TITLE .. " - " .. L.ADDON_LONG, "GameFontHighlightLarge")
    title:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -16)

    local testButton = CreateButton(frame, L.TEST_SOUND, 110, 24)
    testButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -382)
    testButton:SetScript("OnClick", function()
        Bad:PlayAlertSound(true)
    end)

    local resetButton = CreateButton(frame, L.RESET_DEFAULTS, 130, 24)
    resetButton:SetPoint("LEFT", testButton, "RIGHT", 8, 0)
    resetButton:SetScript("OnClick", function()
        BADDB = CopyDefaults(DEFAULT_DB)
        db = BADDB
        activeDebuffs = {}
        visualUnitStates = {}
        Bad:RefreshOptions()
        Bad:RefreshPreview()
        Bad:RefreshVisualFrames()
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

    local visualTitle = CreateText(frame, L.VISUALS, "GameFontNormalLarge")
    visualTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 400, -56)

    AddCheckbox(L.SHOW_BORDER, 400, -84, function() return db.showVisualBorder end, function(value) db.showVisualBorder = value end)
    AddCheckbox(L.SHOW_ICONS, 400, -114, function() return db.showVisualIcons end, function(value) db.showVisualIcons = value end)

    local borderSizeTitle = CreateText(frame, L.BORDER_SIZE, "GameFontNormal")
    borderSizeTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 400, -148)
    frame.borderSizeDropdown = CreateVisualSizeDropdown(frame, "BADBorderSizeDropdown", BORDER_SIZE_OPTIONS, "visualBorderSize")
    if frame.borderSizeDropdown then
        frame.borderSizeDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 390, -166)
    else
        frame.borderSizeValue = CreateText(frame, "", "GameFontHighlight")
        frame.borderSizeValue:SetPoint("TOPLEFT", frame, "TOPLEFT", 400, -172)
    end

    local iconSizeTitle = CreateText(frame, L.ICON_SIZE, "GameFontNormal")
    iconSizeTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 520, -148)
    frame.iconSizeDropdown = CreateVisualSizeDropdown(frame, "BADIconSizeDropdown", ICON_SIZE_OPTIONS, "visualIconSize")
    if frame.iconSizeDropdown then
        frame.iconSizeDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 510, -166)
    else
        frame.iconSizeValue = CreateText(frame, "", "GameFontHighlight")
        frame.iconSizeValue:SetPoint("TOPLEFT", frame, "TOPLEFT", 520, -172)
    end

    local colorButton = CreateButton(frame, L.CUSTOMIZE_COLORS, 100, 24)
    colorButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 400, -210)
    colorButton:SetScript("OnClick", function()
        Bad:ToggleColorOptions()
    end)

    local previewButton = CreateButton(frame, L.PREVIEW_FRAMES, 120, 24)
    previewButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 508, -210)
    previewButton:SetScript("OnClick", function()
        Bad:TogglePreview()
    end)

    local soundTitle = CreateText(frame, L.NORMAL_SOUND, "GameFontNormalLarge")
    soundTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -254)

    frame.soundDropdown = CreateSoundDropdown(frame, "BADSoundDropdown", "sound")
    if frame.soundDropdown then
        frame.soundDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -276)
    else
        local prevSound = CreateButton(frame, L.PREVIOUS, 90, 24)
        prevSound:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -279)
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
    dangerousSoundTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 208, -254)

    frame.dangerousSoundDropdown = CreateSoundDropdown(frame, "BADDangerousSoundDropdown", "dangerousSound")
    if frame.dangerousSoundDropdown then
        frame.dangerousSoundDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 198, -276)
    else
        frame.dangerousSoundValue = CreateText(frame, "", "GameFontHighlight")
        frame.dangerousSoundValue:SetPoint("TOPLEFT", frame, "TOPLEFT", 208, -282)
    end

    local cooldownTitle = CreateText(frame, L.COOLDOWN, "GameFontNormalLarge")
    cooldownTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 420, -254)

    frame.cooldownDropdown = CreateCooldownDropdown(frame)
    if frame.cooldownDropdown then
        frame.cooldownDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 410, -276)
    else
        frame.cooldownValue = CreateText(frame, "", "GameFontHighlight")
        frame.cooldownValue:SetPoint("TOPLEFT", frame, "TOPLEFT", 420, -282)
    end

    local channelTitle = CreateText(frame, L.SOUND_CHANNEL, "GameFontNormalLarge")
    channelTitle:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -318)

    frame.channelDropdown = CreateChannelDropdown(frame)
    if frame.channelDropdown then
        frame.channelDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -340)
    else
        frame.channelValue = CreateText(frame, "", "GameFontHighlight")
        frame.channelValue:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -346)
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

    if optionsFrame.borderSizeDropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(optionsFrame.borderSizeDropdown, GetPixelLabel(db.visualBorderSize))
    end

    if optionsFrame.borderSizeValue then
        optionsFrame.borderSizeValue:SetText(GetPixelLabel(db.visualBorderSize))
    end

    if optionsFrame.iconSizeDropdown and UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(optionsFrame.iconSizeDropdown, GetPixelLabel(db.visualIconSize))
    end

    if optionsFrame.iconSizeValue then
        optionsFrame.iconSizeValue:SetText(GetPixelLabel(db.visualIconSize))
    end

    self:RefreshColorOptions()
end

function Bad:OpenOptions()
    self:CreateOptionsFrame()
    self:RefreshOptions()

    if not standaloneWindow then
        local ok, window = pcall(CreateFrame, "Frame", "BADStandaloneOptionsFrame", UIParent, "BasicFrameTemplateWithInset")
        if not ok then
            window = CreateFrame("Frame", "BADStandaloneOptionsFrame", UIParent)
        end
        window:SetSize(680, 500)
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
    optionsFrame:SetSize(640, 420)
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
    Print(L.SOUND_CHANNEL .. ": " .. GetChannelLabel(db.soundChannel))
    Print(L.CHAT_MESSAGES .. ": " .. BoolText(db.chat) .. " / " .. L.ONLY_COMBAT .. ": " .. BoolText(db.onlyCombat))
    Print(L.SHOW_BORDER .. ": " .. BoolText(db.showVisualBorder) .. " / " .. L.SHOW_ICONS .. ": " .. BoolText(db.showVisualIcons))
    Print(L.BORDER_SIZE .. ": " .. GetPixelLabel(db.visualBorderSize) .. " / " .. L.ICON_SIZE .. ": " .. GetPixelLabel(db.visualIconSize))
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
    Print(L.HELP_PREVIEW)
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
    elseif command == "preview" then
        Bad:TogglePreview()
    elseif command == "on" or command == "enable" then
        db.enabled = true
        Print(L.ENABLED)
        Bad:RefreshOptions()
        Bad:QueueScan()
    elseif command == "off" or command == "disable" then
        db.enabled = false
        activeDebuffs = {}
        visualUnitStates = {}
        Print(L.DISABLED)
        Bad:RefreshOptions()
        Bad:RefreshVisualFrames()
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
    self:InstallCompactFrameHooks()
    self:RefreshOptions()
    Print(L.LOADED)
    self:QueueScan()
end

function Bad:ADDON_LOADED(addonName)
    if addonName == "Blizzard_CompactRaidFrames" then
        self:InstallCompactFrameHooks()
        self:QueueScan()
    end
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
    visualUnitStates = {}
    self:RefreshVisualFrames()
    self:DiscoverCompactFrames()
    self:QueueScan()
end

function Bad:PLAYER_ENTERING_WORLD()
    activeDebuffs = {}
    visualUnitStates = {}
    self:RefreshVisualFrames()
    self:DiscoverCompactFrames()
    self:QueueScan()
end

function Bad:SPELLS_CHANGED()
    self:QueueScan()
end

function Bad:PLAYER_REGEN_DISABLED()
    if previewWindow then
        SetPreviewEscapeEnabled(false)
    end
    self:QueueScan()
end

function Bad:PLAYER_REGEN_ENABLED()
    if previewWindow then
        SetPreviewEscapeEnabled(true)
    end
    self:ProcessPendingVisualFrames()
    self:QueueScan()
end

Bad:SetScript("OnEvent", function(self, event, ...)
    if self[event] then
        self[event](self, ...)
    end
end)

Bad:RegisterEvent("PLAYER_LOGIN")
Bad:RegisterEvent("ADDON_LOADED")
Bad:RegisterEvent("UNIT_AURA")
Bad:RegisterEvent("GROUP_ROSTER_UPDATE")
Bad:RegisterEvent("PLAYER_ENTERING_WORLD")
Bad:RegisterEvent("SPELLS_CHANGED")
Bad:RegisterEvent("PLAYER_REGEN_DISABLED")
Bad:RegisterEvent("PLAYER_REGEN_ENABLED")
