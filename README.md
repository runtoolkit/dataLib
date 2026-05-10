# 🔧 dataLib
**Minecraft Java Edition 1.20.3–26.1+ | Multiplayer-Safe | Pure Datapack**

---

[![commits](https://img.shields.io/github/commit-activity/t/runtoolkit/DataLib?label=commits&logo=github)](https://github.com/runtoolkit/DataLib/commits)
[![issues](https://img.shields.io/github/issues/runtoolkit/DataLib?logo=github)](https://github.com/runtoolkit/DataLib/issues)
[![pull requests](https://img.shields.io/github/issues-pr/runtoolkit/DataLib?logo=github)](https://github.com/runtoolkit/DataLib/pulls)
[![license](https://img.shields.io/github/license/runtoolkit/DataLib)](https://github.com/runtoolkit/DataLib/blob/main/LICENSE)

---
> Current version: **v5.1.0**
---

---
> 🛡️ **This is a Minecraft Datapack — it contains no executables or scripts outside of `.mcfunction` files.**
> Some antivirus software may flag `.mcfunction` files as suspicious due to macro-like syntax. This is a **false positive**. The pack has been scanned on [VirusTotal](https://www.virustotal.com) and returned clean.
> **Only download from this official repository.** Do not trust redistributed or repackaged versions from third-party sources.

---

## 📚 Documentation

Full API reference, guides, and examples are available in the **[GitHub Wiki](../../wiki)**.

| Page | Description |
|------|-------------|
| [Installation](../../wiki/Installation) | How to install and load the datapack |
| [Storage Architecture](../../wiki/Storage-Architecture) | `datalib:engine`, `datalib:input`, `datalib:output` layout |
| [Overlay System](../../wiki/Overlay-System) | Multi-version overlay structure |
| [Admin Guide](../../wiki/Admin-Guide) | `macro.admin` tag, permissions, debug tools |
| [Changelog](../../wiki/Changelog) | Full version history |

---

## 📦 Installation

```
1. Place dataLib-v5.1.0 into <world>/datapacks/
2. /reload
3. /function dl_load:load/yes
4. /tag @s add macro.admin
```

---

## 🏗️ Storage Architecture

```
datalib:engine  (persistent data)
├── global
│   ├── version: "v5.1.0"
│   └── tick: <int>
├── players
│   └── Steve { coins:150, level:5, xp:2300, online:1b, ... }
├── queue
│   └── [{func:"mypack:event/end", delay:100}]
├── cooldowns
│   └── Steve { fireball: 2460, dash: 1870 }  ← expiry ticks
└── events
    └── on_join: [{func:"mypack:welcome"}, {func:"mypack:xp_bonus"}]

datalib:input   (sending data to a function)
datalib:output  (receiving results from a function)
```

---

## 🔍 Predicate Reference

Used with `execute if predicate <id>`.

| Predicate | Description |
|---|---|
| `macro:is_survival` | Player is in survival mode |
| `datalib:is_creative` | Player is in creative mode |
| `macro:has_empty_mainhand` | Main hand is empty |
| `macro:is_full_health` | Player is at full health (20 HP) |
| `datalib:is_sneaking` | Player is sneaking |
| `datalib:is_sprinting` | Player is sprinting |
| `datalib:is_burning` | Player is on fire |
| `datalib:is_on_ground` | Player is on the ground |
| `macro:is_daytime` | Daytime (0–12000 ticks) |
| `macro:is_raining` | It is raining |
| `macro:is_thundering` | There is a thunderstorm |
| `macro:in_overworld` | Player is in the Overworld |
| `macro:in_nether` | Player is in the Nether |
| `macro:in_end` | Player is in the End |

Full reference: [Predicate Reference](../../wiki/Predicate-Reference)

---

## 📦 Dependencies

### Lantern Load
**Repository:** https://github.com/LanternMC/load  
**License:** BSD 0-Clause (public domain)

Provides deterministic load order, version tracking, and pre/load/post-load hooks.

```mcfunction
# Check if dataLib is loaded
execute if score dataLib load.status matches 1.. run say dataLib is loaded

# Get version (major*10000 + minor*100 + patch → v5.1.0 = 50000)
scoreboard players get dataLib load.status
```

### StringLib
**Repository:** https://github.com/CMDred/StringLib  
**License:** MIT

Bundled under the `stringlib` namespace. Exposed via `datalib:core/lib/string/*`.

| Function | Description |
|---|---|
| `lib/string/concat` | Join a string array |
| `lib/string/find` | Find substring index |
| `lib/string/replace` | Replace substring |
| `lib/string/split` | Split by separator |
| `lib/string/insert` | Insert at index |
| `lib/string/to_lowercase` | Lowercase (A–Z, fast) |
| `lib/string/to_uppercase` | Uppercase (a–z, fast) |
| `lib/string/to_number` | String → numeric NBT |
| `lib/string/to_string` | Value → string |

All functions read from `datalib:input` and write to `datalib:output string.result`.

```mcfunction
data modify storage datalib:input string set value "Hello World"
data modify storage datalib:input find set value "World"
data modify storage datalib:input replace set value "Everyone"
function datalib:core/lib/string/replace
# datalib:output string.result → "Hello Everyone"
```

---

## 📡 API Modules

| Module | Wiki |
|--------|------|
| 🕐 Cooldown | [API-Cooldown](../../wiki/API-Cooldown) |
| 📡 Event | [API-Event](../../wiki/API-Event) |
| 🏳️ Flag & State | [API-Flag-State](../../wiki/API-Flag-State) |
| 🪝 Hook | [API-Hook](../../wiki/API-Hook) |
| 🖱️ Interaction | [API-Interaction](../../wiki/API-Interaction) |
| 🎒 Inventory | [API-Inventory](../../wiki/API-Inventory) |
| 📚 Library | [API-Library](../../wiki/API-Library) |
| 🔢 Math | [API-Math](../../wiki/API-Math) |
| 🔐 Permission | [API-Permission](../../wiki/API-Permission) |
| 👤 Player | [API-Player](../../wiki/API-Player) |
| 🔤 String | [API-String](../../wiki/API-String) |
| 🪄 Wand | [API-Wand](../../wiki/API-Wand) |
| 🌍 World & Geo | [API-World-Geo](../../wiki/API-World-Geo) |

---

## 💬 Support

[![Issues](https://img.shields.io/github/issues/runtoolkit/DataLib?style=for-the-badge)](https://github.com/runtoolkit/DataLib/issues)
[![Discussions](https://img.shields.io/github/discussions/runtoolkit/DataLib?style=for-the-badge&logo=github&color=blue)](https://github.com/runtoolkit/DataLib/discussions)

---

*dataLib v5.1.0 | MC Java 1.20.3–26.1+ | Pure Datapack*
