FROM python3.9-alpine3.13

LABEL maintainer="victoradeveloper"


ENV PYTHONUNBUFFERED 1 

RUN pip install poetry

COPY poetry.lock pyproject.toml ./

RUN poetry export -f requirements.txt --output requirements.txt

RUN pip install -r requirements.txt

COPY .app/app

WORKDIR /app

EXPOSE 8000


RUN  adduser --disabled-password user
RUN chown -R user:user /vol/
RUN chmod -R 755 /vol/web
USER user