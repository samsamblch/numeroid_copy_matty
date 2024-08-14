#!/bin/bash

# Инициализация переменных
NAME=""
PLATFORM=""
ENV_VERSION=""

# Обработка аргументов с флагами
while getopts n:p:e: flag
do
    case "${flag}" in
        n) NAME=${OPTARG};;
        p) PLATFORM=${OPTARG};;
        e) ENV_VERSION=${OPTARG};;
    esac
done

# Проверка обязательных параметров
if [ -z "$NAME" ] || [ -z "$PLATFORM" ] || [ -z "$ENV_VERSION" ]; then
    echo "Usage: $0 -n NAME -p PLATFORM -e ENV_VERSION"
    exit 1
fi

# Извлечение версии и номера сборки из pubspec.yaml
VERSION_NAME=$(grep '^version: ' pubspec.yaml | cut -d ' ' -f 2)
# Заменяем + на -
VERSION_NAME=$(echo $VERSION_NAME | sed 's/+/-/')

# Формируем имя файла
FILENAME="${NAME}-${PLATFORM}-${VERSION_NAME}-${ENV_VERSION}"ф

# Вывод имени файла
echo $FILENAME