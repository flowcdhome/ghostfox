<div align="center">

# 👻 GhostFox

**Приватный, полностью настраиваемый OSINT-браузер (лаунчер поверх Firefox).**

[🇬🇧 English](README.md) · 🇷🇺 Русский

[![Release](https://img.shields.io/github/v/release/flowcdhome/ghostfox?style=for-the-badge&color=2ea44f)](https://github.com/flowcdhome/ghostfox/releases)
[![License](https://img.shields.io/github/license/flowcdhome/ghostfox?style=for-the-badge)](LICENSE)
![Python](https://img.shields.io/badge/python-3.9%2B-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux-informational?style=for-the-badge&logo=linux&logoColor=white)

</div>

---

## ✨ Возможности

| | |
|---|---|
| 🗂️ **Изолированные профили** | `work`, `research`, `proxy-eu`... у каждого свой `config.json`, куки и CSS |
| 🎭 **Данные для сайтов** | User-Agent, платформа, языки, часовой пояс, WebRTC, WebGL, защита от fingerprinting |
| 🧦 **Прокси и DNS** | Свой SOCKS5/HTTP-прокси и свой DNS-over-HTTPS сервер |
| 🎨 **Полный контроль CSS** | `userChrome.css` (интерфейс) и `userContent.css` (страницы) для каждого профиля |
| 🔒 **Жёсткие настройки по умолчанию** | Телеметрия выключена, полная защита куки, HTTPS-only, очистка данных при выходе, uBlock Origin ставится сам |
| ⚙️ **Любая настройка** | `extra_prefs` позволяет задать любое значение из `about:config` |
| 🚀 **Удобство** | `ghostfox` в терминале, окно настроек, меню rofi и `.desktop`-ярлыки |

## 🚀 Установка

```bash
sudo pacman -S --needed git python firefox rofi tk   # rofi и tk необязательны
git clone https://github.com/flowcdhome/ghostfox.git
cd ghostfox && ./install.sh
ghostfox
```

Debian/Ubuntu: `sudo apt install git python3 firefox rofi python3-tk`. LibreWolf и Firefox ESR находятся автоматически (или задай `GHOSTFOX_BROWSER=/путь/к/браузеру`).

## 📖 Использование

```bash
ghostfox                 # запустить профиль "default"
ghostfox run work        # запустить (и создать при необходимости) профиль "work"
ghostfox new research    # создать профиль
ghostfox list            # список профилей
ghostfox edit work       # править config.json
ghostfox css work        # править userChrome.css
ghostfox gui             # окно настроек
ghostfox rofi            # меню rofi (профили, создание, правка)
ghostfox update          # обновить (git pull)
```

**rofi и запуск:** после `./install.sh` пункты *GhostFox*, *GhostFox Menu* и *GhostFox Settings* появятся в `rofi -show drun`. Меню можно повесить на клавишу, например Hyprland: `bind = SUPER SHIFT, O, exec, ghostfox rofi`, i3/sway: `bindsym $mod+Shift+o exec ghostfox rofi`.

## ⚙️ Конфиг (`~/.config/ghostfox/profiles/ИМЯ/config.json`)

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

- `proxy.type`: `none`, `socks5` или `http`. При включённом прокси DNS резолвит сам прокси, поэтому утечек мимо него нет.
- `dns.mode`: `0` системный, `2` DoH с запасным вариантом, `3` только DoH, `5` выключено. Работает, когда прокси не задан.
- `timezone` работает только при `resist_fingerprinting: false` (RFP принудительно ставит UTC).
- Часть сайтов ломается от строгих настроек. Любое значение можно переопределить в `extra_prefs`.

## 🛡️ О приватности

- Случайная подмена данных может сделать тебя **более** уникальным. Самый стойкий режим это `resist_fingerprinting: true`: ты выглядишь как все остальные в этом режиме.
- Один браузер не даёт анонимности. Используй его вместе с прокси, VPN или Tor.
- Свои UA/платформа могут игнорироваться, пока включён RFP.

## ⚖️ Правовое уведомление

Используй только в законных целях, соблюдай правила сайтов и законы. Автор не отвечает за неправомерное использование.

## 📄 Лицензия

MIT, см. [LICENSE](LICENSE).
