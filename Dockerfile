FROM mysql:8

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mysql-client