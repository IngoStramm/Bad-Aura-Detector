# BAD Roadmap

This roadmap describes planned work and does not assign fixed release dates.

## Current Compatibility

- Sound alerts work independently of the raid-frame addon being used.
- Visual borders, glows, and dispel-type icons currently support Blizzard compact party and raid frames.

## Planned: Third-Party Raid-Frame Visuals

Extend BAD's visual module to popular third-party party and raid frames while preserving the same colors, border sizes, icon sizes, multiple-debuff behavior, and module controls already available for Blizzard frames.

### Initial Targets

1. Cell
2. Grid2
3. VuhDo
4. HealBot Continued
5. Shadowed Unit Frames
6. ElvUI party and raid frames, when a stable integration surface is available

The order may change based on API stability, Classic TBC support, and the amount of frame lifecycle handling required by each addon.

### Implementation Direction

- Introduce an internal adapter layer so each raid-frame addon is isolated from BAD's core debuff detection.
- Keep every integration optional, with no hard dependency on third-party addons.
- Prefer documented plugin or indicator APIs when an addon provides them.
- Use external overlays only when they can be attached without modifying secure frame behavior.
- Preserve each addon's layouts, click-casting, native indicators, and configuration.
- Detect addon and frame version changes defensively and disable only the affected adapter if it becomes incompatible.

### Acceptance Criteria

- Party, raid, and battleground frames are discovered reliably after login, reloads, roster changes, and layout changes.
- Colored borders, inner glows, and dispel-type icons match BAD's configured visual settings.
- Multiple removable debuffs remain readable on compact frames without icon overlap.
- BAD indicators do not obscure the raid-frame addon's own important indicators.
- No protected-frame taint, blocked actions, or Lua errors are introduced in or out of combat.
- The visual module can be enabled or disabled without affecting sound alerts or the raid-frame addon itself.
