# numeroid

A new Flutter project.

## Start Work

### Установка Flutter 
https://docs.flutter.dev/get-started/install 

По ссылке выше все расписано но все же в первые разы это был дроч 
потому железные шаги ниже

Основные
1) Независимо от платформы качаем исходник
2) Распаковываем в папку 'flutter'
3) Переносим директорию из п.2 в папку юзера куда вашей душе угодно 
(я обычно переименовываю ее во '.flutter' - да скрытая и прямо в корень папки юзера рядом с другими аналогичными либами)
4) Прописываем пути
Если macOS 
зависит от оболочки cmd строки - но помоему последние лет 5 я добавляю в файл '.zshrc'
(если файла нет создаем в терминале командой 'touch .zshrc')
Добавляем туда след. строчку
export PATH=$PATH:/Users/matty/.flutter/bin

P.S. Строчки ниже опциональны по системам
// Если macos на семействе процессоров M - то после установки brew всеравно ее потребует
eval "$(/opt/homebrew/bin/brew shellenv)"--

// Иногда просит java_home тоже потребуется после установки Android Studio
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home

5) В терминале вызываем 'flutter doctor' (если после шага 4 не перезапускали терминал стоит сделать)
если доктор отработал - все шаги выше прошли гуд (если нет - сорян не повезло)
доктор выведет массу ошибок которые нужно будет исправлять по необходимости

---
Опциональные шаги

Разработка под Android
1) Скачиваем и устанавливаем Android Studio последнюю
2) В разделе SDK Manager - ставим command tools (latest)
3) Путь для Java_Home (если заранее не сделали в основное-п.4)
4) Установка плагинов Flutter - остальное пожеланию можно выбирать если хочется
5) Вызываем flutter doctor 
там будет ошибка лицензии и команда которую нужно ввести - чтоб принять соглашения
- смотрим на ошибки (должно быть все ок)

Разработка macOS и iOS
1) Ставим Xcode
2) Ставим brew
3) Ставим cocoapods через brew 'brew install cocoapods'
4) Вызываем flutter doctor - смотрим на ошибки (должно быть все ок)

P.S.: в ходе выполнения этих шагов могут возникнуть какие-то не описанные нюансы 

## Работа с проектом

### Остальные шаги
При первом открытии и перед запуском необходимо выполнить команды 'makefile' 
(лежит в корне проекта)
в терминале из рута папки проекта вызываем команды
'make clean'
'make gen'
'make gen:locale'

P.S.: возможно команд будет уже больше к моменту когда ты это читаешь 
потому лучше, открой файл и проверь по нему

### Events and Analytics 
Firebase
Чтобы дев сборки во время разработки тоже могли работать
дефолнто конфиг стоит dev 
(ибо при каждом запуске нужно вызывать скрипт)
для прод сборки идет подмена через скрипты


## Общее
На этом усе =) 
Проект должен запуститься на любой из платформ что были настроены выше

P.S. Если какие вопросы или моменты не описаны, плз дополняйте файл, 
чтоб следующие игроки не мучались