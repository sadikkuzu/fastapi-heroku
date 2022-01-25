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

**To Run application using Docker**

First of all we will create a image using this command , 
you choose any name, here i took myfast-api
```bash
docker build -t myfast-api .              
```
here myfast-api is image name you can type any other name too
so Your image is build now you have to run it using this command.
```bash
docker run -d -p 8000:8000  myfast-api 
```
Here also myfast-api is the name of image we build earlier.
 
Now you will be able to access it on localhost:8000
Also to view all the running processes in your system you can do.
```bash
docker ps -a
```

**Using docker-compose to run this**

If you want to directly run with Docker-compose
here you will be not asked to build and run the image , you have to simply write this command.
```zsh
docker-compose up  --> to run
docker-compose down --> to stop
```
to run this in background you can add & sign at the end of command.
Now after running this application with docker-compose up
you can visit localhost:8000 or your terminal and access this application on your browser.



