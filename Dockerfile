FROM python:3.9.12-alpine3.15

COPY requirements.txt .

RUN apk add --no-cache --virtual .pynacl_deps build-base python3-dev libffi-dev openjdk11 -qq > /dev/null && \
pip install -r requirements.txt && \
wget -q https://dlcdn.apache.org/spark/spark-3.0.3/spark-3.0.3-bin-hadoop2.7.tgz && \
tar xf spark-3.0.3-bin-hadoop2.7.tgz && \ 
apk del .pynacl_deps

ENTRYPOINT ["jupyter notebook"]
