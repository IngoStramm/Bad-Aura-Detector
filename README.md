# BAD - Bad Aura Detector

![BAD logo](assets/bad-logo.png)

BAD provides independent sound alerts and Blizzard compact-frame highlights when you or someone in your current group, raid, or battleground has a debuff your character can remove.

It is intentionally small: it enhances Blizzard's compact group frames without replacing them and does not add click-casting, priority lists, or a full dispel UI. It watches only for debuffs your current character knows how to remove.

## Features

- Detects removable Magic, Curse, Poison, and Disease debuffs based on your class and known spells.
- Monitors your full available group automatically, including party, raid, and battleground units.
- Independent sound-alert and Blizzard-frame visual modules, so either feature can be used on its own.
- Optional pet monitoring.
- Optional colored borders, inner glows, and generic dispel-type icons on Blizzard compact group frames, with configurable border and icon sizes.
- Multi-type borders use a neutral white highlight by default while the colored icons identify every removable debuff type.
- Custom colors for Magic, Curse, Disease, Poison, and multiple-type highlights, applied consistently to borders, glows, and icons.
- Multiple dispel icons automatically shrink only as needed to fit side by side without overlap.
- Native Blizzard compact-frame preview with a live player row plus synthetic Magic, Curse, Poison, Disease, and multiple-debuff examples.
- Normal and danger sound selectors, including WeakAuras and PowerAurasMedia sound choices when WeakAuras is installed.
- Sound channel option.
- Minimum interval between sounds to avoid spam.
- Optional chat messages.
- Localized client text for all WoW-supported locales.

## Localization

BAD supports the following WoW client locales:

```text
enUS, enGB, ptBR, deDE, esES, esMX, frFR, itIT, koKR, ruRU, zhCN, zhTW
```

## Commands

- `/bad config` - open the BAD options.
- `/bad test` - play the selected normal alert sound.
- `/bad preview` - toggle the solo Blizzard-frame preview.
- `/bad on` and `/bad off` - enable or disable both modules.
- `/bad status` - print the current settings.
- `/bad sound next` - cycle the normal alert sound.
- `/bad cooldown 5` - set the minimum interval between sounds.
- `/bad chat` - toggle chat messages.
- `/bad debug` - toggle diagnostic messages.
- `/bad combat` - toggle combat-only sound alerts.

## Installation

Download `BAD.zip` from the latest GitHub Release and extract it into:

```text
World of Warcraft/_anniversary_/Interface/AddOns/
```

After extraction, the addon folder should be:

```text
World of Warcraft/_anniversary_/Interface/AddOns/BAD/
```

Restart the game or reload the UI.

Do not use GitHub's green **Code > Download ZIP** button for installation. That downloads the source repository snapshot, not the packaged addon.

## Compatibility

- World of Warcraft Classic Anniversary TBC
- Client: `2.5.6 (68502)`
- Interface: `20506`

## Roadmap

See [ROADMAP.md](ROADMAP.md) for planned visual compatibility with popular third-party party and raid-frame addons.

## Changelog

See [CHANGELOG.md](CHANGELOG.md).

## Release Packaging

GitHub Releases build an installable `BAD.zip` containing:

```text
BAD/
  BAD.toc
  BAD.lua
```

BAD does not redistribute Decursive or WeakAuras audio files. It references those addon sound paths when they are installed. The sound list only includes media shipped by WeakAuras itself, not sounds registered by other addons through LibSharedMedia.

The sound channel setting uses the game's audio channels. Alert volume is controlled by the selected channel in the game's audio settings.
