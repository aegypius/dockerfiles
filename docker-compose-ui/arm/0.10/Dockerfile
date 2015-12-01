FROM hypriot/rpi-python:2.7.3

WORKDIR /app
RUN virtualenv /env
RUN apt-get update -qy && apt-get install -qy git
RUN git clone https://github.com/francescou/docker-compose-ui /app
RUN git checkout v0.10
RUN /env/bin/pip install -r requirements.txt

VOLUME ["/data"]

EXPOSE 5000

CMD ["/env/bin/python", "/app/main.py"]

