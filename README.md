<div align="center">

# 👻 GhostFox

**Privacy-first, fully customizable OSINT browser launcher built on Firefox.**

🇬🇧 English · [🇷🇺 Русский](README.ru.md)

[![Release](https://img.shields.io/github/v/release/flowcdhome/ghostfox?style=for-the-badge&color=2ea44f)](https://github.com/flowcdhome/ghostfox/releases)
[![License](https://img.shields.io/github/license/flowcdhome/ghostfox?style=for-the-badge)](LICENSE)
![Python](https://img.shields.io/badge/python-3.9%2B-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux-informational?style=for-the-badge&logo=linux&logoColor=white)

</div>

---

## ✨ Features

| | |
|---|---|
| 🗂️ **Isolated profiles** | `work`, `research`, `proxy-eu`... each with its own `config.json`, cookies and CSS |
| 🎭 **Data sites see** | User-Agent, platform, languages, timezone, WebRTC, WebGL, fingerprinting protection |
| 🧦 **Proxy & DNS** | Your own SOCKS5/HTTP proxy and your own DNS-over-HTTPS server |
| 🎨 **Full CSS control** | `userChrome.css` (browser UI) and `userContent.css` (web pages) per profile |
| 🔒 **Hardened by default** | Telemetry off, total cookie protection, HTTPS-only, data wiped on exit, uBlock Origin auto-installed |
| ⚙️ **Any pref** | `extra_prefs` lets you set any `about:config` value |
| 🚀 **Convenient** | `ghostfox` in the terminal, a settings window, a rofi menu and `.desktop` entries |

## 🚀 Install

```bash
sudo pacman -S --needed git python firefox rofi tk   # rofi and tk are optional
git clone https://github.com/flowcdhome/ghostfox.git
cd ghostfox && ./install.sh
ghostfox
```

Debian/Ubuntu: `sudo apt install git python3 firefox rofi python3-tk`. LibreWolf and Firefox ESR are detected automatically (or set `GHOSTFOX_BROWSER=/path/to/browser`).

## 📖 Usage

```bash
ghostfox                 # launch profile "default"
ghostfox run work        # launch (and create if needed) profile "work"
ghostfox new research    # create a profile
ghostfox list            # list profiles
ghostfox edit work       # edit config.json
ghostfox css work        # edit userChrome.css
ghostfox gui             # settings window
ghostfox rofi            # rofi menu (profiles, new, edit)
ghostfox preset windows   # spoof preset: windows | mac | rfp
ghostfox check           # page showing what websites see
ghostfox update          # git pull the latest version
```

**rofi / launcher:** after `./install.sh` the entries *GhostFox*, *GhostFox Menu* and *GhostFox Settings* appear in `rofi -show drun`. Bind the menu to a key, e.g. Hyprland: `bind = SUPER SHIFT, O, exec, ghostfox rofi`, i3/sway: `bindsym $mod+Shift+o exec ghostfox rofi`.

## ⚙️ Config (`~/.config/ghostfox/profiles/NAME/config.json`)

```json
{
  "user_agent": "",
  "platform": "",
  "language": "en-US,en",
  "timezone": "",
  "start_page": "about:blank",
  "resist_fingerprinting": true,
  "webrtc": false,
  "webgl": false,
  "clear_on_exit": true,
  "window": { "width": 1280, "height": 800 },
  "proxy": { "type": "socks5", "host": "127.0.0.1", "port": 9050 },
  "dns": { "doh": "https://dns.quad9.net/dns-query", "mode": 3 },
  "extra_prefs": { "network.http.referer.XOriginPolicy": 0 }
}
```

- `proxy.type`: `none`, `socks5` or `http`. With a proxy active, DNS is resolved by the proxy so nothing leaks around it.
- `dns.mode`: `0` system, `2` DoH with fallback, `3` DoH only, `5` off. Applies when no proxy is set.
- `timezone` works only with `resist_fingerprinting: false` (RFP forces UTC).
- Some sites break with strict settings. Override any pref in `extra_prefs`.

## 🛡️ Privacy notes

- Randomly spoofed values can make you **more** unique. The strongest mode is `resist_fingerprinting: true`, where you look like every other user of that mode.
- A browser alone does not make you anonymous. Combine it with a proxy, VPN or Tor.
- Custom UA/platform values may be ignored while RFP is on.

## ⚖️ Legal

Use only for lawful purposes and respect site terms and applicable laws. The author is not responsible for misuse.

## 📄 License

MIT, see [LICENSE](LICENSE).
