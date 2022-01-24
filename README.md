# fastapi-heroku

## Reproduction of [FastAPI deploy in heroku giving an error h10](https://stackoverflow.com/questions/68755702/fastapi-deploy-in-heroku-giving-an-error-h10)

### Development

```
pip install -qUr requirements-dev.txt
pre-commit install
pre-commit run --all-files
```

```
uvicorn main:app --reload
```

### Deployment

[Heroku](https://heroku.com) <br/>
[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/sadikkuzu/fastapi-heroku/tree/main)
