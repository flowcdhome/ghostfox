#!/usr/bin/env bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.local/bin" "$HOME/.local/share/applications"
chmod +x "$DIR/ghostfox"
ln -sf "$DIR/ghostfox" "$HOME/.local/bin/ghostfox"
for f in "$DIR"/desktop/*.desktop; do
  sed "s|^Exec=ghostfox|Exec=$HOME/.local/bin/ghostfox|" "$f" > "$HOME/.local/share/applications/$(basename "$f")"
done
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
echo "[ok] installed: ~/.local/bin/ghostfox"
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) echo "[!] add ~/.local/bin to PATH";; esac
command -v python3 >/dev/null || echo "[!] python3 missing"
{ command -v firefox || command -v librewolf || command -v firefox-esr; } >/dev/null || echo "[!] no Firefox: sudo pacman -S firefox"
command -v rofi >/dev/null || echo "[i] optional: sudo pacman -S rofi"
python3 -c "import tkinter" 2>/dev/null || echo "[i] optional (GUI): sudo pacman -S tk"
echo "Run: ghostfox   |   ghostfox gui   |   ghostfox rofi"
