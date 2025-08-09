# backuper — архиватор по списку

Утилита собирает zip-архив из списка путей (файлы/папки) и печатает готовую команду для скачивания архива по `scp`.

## Что делает

* Читает пути из TXT-файла (по одному в строке).
* Создаёт zip c сохранением путей:
  `$(hostname)_backuper_DD.MM_HH-MM-SS.zip`
* Определяет внешний IP (`curl ifconfig.me`) и выводит команду:
  `scp root@<IP>:<абсолютный_путь_к_архиву> ./<имя_архива>`

## Требования

* Linux/macOS, bash
* `zip`, `curl`
* Доступ по SSH к серверу, с которого запускается скрипт

## Установка

```bash
curl -O https://raw.githubusercontent.com/DaaGER/backuper/refs/heads/main/backuper.sh 
chmod +x backuper.sh
```

## Формат списка (`list.txt`)
Либо путь до файла, либо до папки
```
/etc/hosts
/var/log
/home/user/file.txt
```

## Запуск

```bash
./backuper.sh list.txt
```

## Результат работы

* В текущей директории появится архив:

  ```
  <hostname>_backuper_09.08_21-15-42.zip
  ```
* Скрипт выведет команду для скачивания:

  ```
  Команда для скачивания файла:
  scp root@203.0.113.45:/root/<hostname>_backuper_09.08_21-15-42.zip ./<hostname>_backuper_09.08_21-15-42.zip
  ```

