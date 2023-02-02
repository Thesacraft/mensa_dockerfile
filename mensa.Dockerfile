# syntax=docker/dockerfile:1
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3 python3-pip
RUN apt-get install -y git
RUN pip install flask
RUN git clone https://github.com/Thesacraft/mensa_package
RUN pip install /mensa_package/Mensa-1.0.0-py3-none-any.whl
RUN pip install waitress
RUN pip install wtforms
RUN flask --app Mensa:create_app init-db
RUN mkdir /usr/var/Mensa-instance/files
RUN mkdir /usr/var/Mensa-instance/files/upload
EXPOSE 8080
CMD waitress-serve --call Mensa:create_app