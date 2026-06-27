# BAD - Bad Aura Detector

BAD plays a sound when you or someone in your current group, raid, or battleground has a debuff your character can remove.

It is intentionally small: no raid frames, click-casting, priority list, or full dispel UI. It only watches for removable debuffs and alerts you.

## Features

- Detects removable Magic, Curse, Poison, and Disease debuffs based on your class and known spells.
- Monitors your full available group automatically, including party, raid, and battleground units.
- Optional pet monitoring.
- Normal and danger sound selectors.
- Minimum interval between sounds to avoid spam.
- Optional chat messages.
- English and Brazilian Portuguese client text.

## Commands

```text
/bad config
/bad test
/bad on
/bad off
/bad status
/bad sound next
/bad cooldown 5
/bad chat
/bad debug
/bad combat
```

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
- Interface: `20505`

## Release Packaging

GitHub Releases build an installable `BAD.zip` containing:

```text
BAD/
  BAD.toc
  BAD.lua
```
