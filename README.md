# fastapi-heroku

## Reproduction of [FastAPI deploy in heroku giving an error h10](https://stackoverflow.com/questions/68755702/fastapi-deploy-in-heroku-giving-an-error-h10)

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/sadikkuzu/fastapi-heroku/main.svg)](https://results.pre-commit.ci/latest/github/sadikkuzu/fastapi-heroku/main)

### Development

```
pip install -qUr requirements-dev.txt
pre-commit install
pre-commit run --all-files
```

```
uvicorn main:app --reload
```

### Local Run

``` docker-compose up --build -d ``` 

http://localhost:8000/docs

### Deployment

[Heroku](https://heroku.com)

#### Stable case

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/sadikkuzu/fastapi-heroku/tree/main)

<details>
    <summary>source codes</summary>

<table>
  <tr>
    <th>requirements.txt</th>
    <th>main.py</th>
    <th>Procfile</th>
  </tr>
  <tr valign="top">
    <td>

```
fastapi
uvicorn
```

</td>
<td>

```python
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def get_root():
    return {'message': 'this is the root message'}
```

</td>
<td>

```
web: uvicorn main:app --host=0.0.0.0 --port=${PORT:-5000}
```

</td>
  </tr>
</table>

</details>

---

#### Missing uvicorn case

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/sadikkuzu/fastapi-heroku/tree/without-uvicorn-in-requirements)

<details>
    <summary>source codes</summary>

<table>
  <tr>
    <th>requirements.txt</th>
    <th>main.py</th>
    <th>Procfile</th>
  </tr>
  <tr valign="top">
    <td>

```
fastapi
```

</td>
<td>

```python
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def get_root():
    return {'message': 'this is the root message'}
```

</td>
<td>

```
web: uvicorn main:app --host=0.0.0.0 --port=${PORT:-5000}
```

</td>
  </tr>
</table>

</details>

---

#### Requierements typo case

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/sadikkuzu/fastapi-heroku/tree/requierements-typo)

<details>
    <summary>source codes</summary>

<table>
  <tr>
    <th>requierements.txt</th>
    <th>main.py</th>
    <th>Procfile</th>
  </tr>
  <tr valign="top">
    <td>

```
fastapi
uvicorn
```

</td>
<td>

```python
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def get_root():
    return {'message': 'this is the root message'}
```

</td>
<td>

```
web: uvicorn main:app --host=0.0.0.0 --port=${PORT:-5000}
```

</td>
  </tr>
</table>

</details>
