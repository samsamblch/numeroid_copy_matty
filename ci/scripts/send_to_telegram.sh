#!/bin/bash

# Инициализация переменных, задаваемых извне
BOT_TOKEN=""  # Токен Telegram бота
CHAT_ID=""  # ID чата или пользователя, куда будет отправлен файл
FILE_PATHS=()  # Массив путей к файлам, которые нужно отправить
CAPTION=""  # Подпись к файлам
THREAD_ID=""  # ID темы группы (форум)

# Обработка аргументов с флагами
while getopts t:c:f:m:d: flag
do
    case "${flag}" in
        t) BOT_TOKEN=${OPTARG};;  # Токен бота
        c) CHAT_ID=${OPTARG};;  # Chat ID
        f) IFS=',' read -r -a FILE_PATHS <<< "${OPTARG}";;  # Путь к файлам, разделённые запятой
        m) CAPTION=${OPTARG};;  # Подпись к файлам
        d) THREAD_ID=${OPTARG};;  # ID темы группы
    esac
done

# Проверка обязательных параметров
if [ -z "$BOT_TOKEN" ] || [ -z "$CHAT_ID" ] || [ ${#FILE_PATHS[@]} -eq 0 ]; then
    echo "Usage: $0 -t BOT_TOKEN -c CHAT_ID -f 'FILE_PATH1,FILE_PATH2' [-m CAPTION] [-d THREAD_ID]"
    exit 1
fi

# Отправка файлов в Telegram
for FILE_PATH in "${FILE_PATHS[@]}"; do
    if [ -n "$THREAD_ID" ]; then
        curl -F chat_id="$CHAT_ID" \
             -F message_thread_id="$THREAD_ID" \
             -F document=@"$FILE_PATH" \
             -F caption="$CAPTION" \
             https://api.telegram.org/bot$BOT_TOKEN/sendDocument
    else
        curl -F chat_id="$CHAT_ID" \
             -F document=@"$FILE_PATH" \
             -F caption="$CAPTION" \
             https://api.telegram.org/bot$BOT_TOKEN/sendDocument
    fi
    
    # Проверка на успешную отправку
    if [ $? -ne 0 ]; then
        echo "Failed to send file $FILE_PATH to Telegram"
        exit 1
    fi
done

echo "Files successfully sent to Telegram"