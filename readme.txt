Структура архива:
Dockerfile - файл со структурой образа
psql.sh - используется для запуска службы postgres (по умолчанию изменять не требуется)
requirements.txt - список библиотек для python3, может дополняться - одна библиотека на одну строку 
supervisord.conf - список запусков сервисов внутри контейнера (по умолчанию изменять не требуется)
file.sql (опционально) - содержит структуру базы данных
Сначала создается образ, на базе образа создаются контейнеры
Компиляция образа:
docker build -t <IMAGE-NAME> .
Запуск контейнера:
docker run -d -p 8881:22 -p 8882:5432 -p 8883:8000 --name <CONTAINER-NAME> <IMAGE-NAME>
ОС:контейнер
8881:22 - проброс порта на SSH
8882:5432 - проброс порта на postgres
8883:8000 проброс порта на fastapi
Остановить контейнер:
docker kill <CONTAINER-NAME>
Удалить конейтнер:
docker rm <CONTAINER-NAME>
Удалить образ:
docker rmi <IMAGE-NAME>
Посмотреть все образы:
docker images
Посмотреть все контейнеры:
docker ps -a
Если контейнер не запустился, то необходимо запустить контейнер второй раз но в интерактивном режиме и посмотреть ошибку:
docker run -it -p 8881:22 -p 8882:5432 -p 8883:8000 --name <CONTAINER-NAME> <IMAGE-NAME>

-it открывает терминал внутри самого контейнера, там будет показана ошибка запуска
-d запускает контейнер в режиме демона, рекомендуется использовать если контейнер 100% запустится

приложения с FastAPI нужно запускать с флагами --host 0.0.0.0 --port 8000






### postgresql 14
git clone https://github.com/scadapy/dockerdb.git
cd ./.git
chmod -x ./*.sh
docker build -t db_14 .
docker run -it -p 8881:22 -p 8882:5432 -p 8883:8000 db_14

### see process
docker ps -a
docker kill <id> not name
docker rm <id>
docker rmi db_14

#### work version
docker run -d -p 8881:22 -p 8882:5432 -p 8883:8000 --name docker_14_1 db_14
docker run -d -p 8871:22 -p 8872:5432 -p 8873:8000 --name docker_14_2 db_14
docker run -d -p 8861:22 -p 8862:5432 -p 8863:8000 --name docker_14_3 db_14
docker run -d -p 8851:22 -p 8852:5432 -p 8853:8000 --name docker_14_4 db_14

docker stop docker_14_1
docker start docker_14_1


