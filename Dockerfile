FROM python:3.6-alpine
ENV PYTHONUNBUFFERED 1

ADD ./tasklist /code/tasklist
ADD ./task /code/task
ADD ./manage.py /code
ADD ./requirements.txt /code

WORKDIR /code

RUN apk update && \
    pip --no-cache-dir install -U pip && \
    pip --no-cache-dir install -r requirements.txt && \
    python manage.py migrate

EXPOSE 8000