#!/bin/bash
set -e

LIST_FILE="$1"

# имя архива: backuper_DD.MM_HH:MM:SS.zip
ARCHIVE_NAME="$(hostname)_backuper_$(date +'%d.%m_%H-%M-%S').zip"

if [ ! -f "$LIST_FILE" ]; then
    echo "Файл со списком '$LIST_FILE' не найден!"
    exit 1
fi

zip -r "$ARCHIVE_NAME" -@ < "$LIST_FILE"

# определяем  IP сервака
IP=$(curl -s ifconfig.me)

# путь до архива
REMOTE_PATH="$(pwd)/$ARCHIVE_NAME"

# путь для сохранения на локалке
LOCAL_PATH="./$ARCHIVE_NAME"


echo "Команда для скачивания файла:"
echo "scp root@${IP}:${REMOTE_PATH} ${LOCAL_PATH}"
