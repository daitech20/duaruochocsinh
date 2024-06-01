# duaruochocsinh

## Getting started

Django-based web application that powers:

- Secret admin site: https://localhost:8001/admin

## 1. Code Style

We use [pre-commit](https://pre-commit.com/) to enforce our code style rules
locally before you commit them into Git. Once you install the pre-commit library,
just install the hooks:

```shell
pip install pre-commit
pre-commit install -f --install-hooks
```

## 2. Development setup
Prerequisites:

You must have **Python 3.10+** available on your path, as it is required for some pre-commit hooks.

- [Docker Engine and Docker Compose](https://docs.docker.com/engine/install/)

**Env file:**
- cd envs
- nano .env

**Database:**
- Mysql
- database name: duaruoc
- password in settings.py
- database dump: db_dump.sql

**Database:**

**Start services & run server:**\
- source .venv/bin/activate
- python manage.py runserver 8000

**Then visit:**
 - Home page: http://localhost:8000
