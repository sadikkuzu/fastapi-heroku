FROM python:3.9-slim-bullseye

WORKDIR fastapi-heroku

COPY  . .

RUN python3 -m pip install -qUr requirements.txt

EXPOSE 8000

ENTRYPOINT ["sh","/entrypoint.sh"]
