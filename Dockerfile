FROM python:3.9-slim-bullseye

WORKDIR fastapi-heroku

COPY  . .
 
RUN   chmod +x entrypoint.sh

RUN python3 -m pip install -qUr requirements.txt
              
EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]
