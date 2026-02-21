#!/bin/bash
# ============================================================
#  WinWarp - Boot rapido verso Windows da Linux
#  Autore: Retroamestation
# ============================================================

LOGO="/userdata/themes/retrogamestation/_inc/assets/background.png"

WIN_ENTRY=$(efibootmgr -v 2>/dev/null | grep -i "bootmgfw.efi" | grep -oP 'Boot\K[0-9A-Fa-f]{4}' | head -1)

if [ -z "$WIN_ENTRY" ]; then
    WIN_ENTRY=$(efibootmgr -v 2>/dev/null | grep -i "Windows Boot Manager" | grep -oP 'Boot\K[0-9A-Fa-f]{4}' | head -1)
fi

if [ -z "$WIN_ENTRY" ]; then
    echo "ERRORE: Nessuna entry EFI di Windows trovata!"
    echo ""
    echo "Le entry disponibili sono:"
    efibootmgr -v
    sleep 8
    exit 1
fi

efibootmgr -n "$WIN_ENTRY" > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "ERRORE: impossibile impostare BootNext."
    sleep 5
    exit 1
fi

# Mostra il logo a schermo intero per 2 secondi
if [ -f "$LOGO" ]; then
    if command -v fbi &>/dev/null; then
        fbi -T 1 -d /dev/fb0 --noverbose -a "$LOGO" &>/dev/null &
    elif command -v fim &>/dev/null; then
        fim -q -a "$LOGO" &>/dev/null &
    fi
fi

sleep 2
reboot
