FROM python:3.8.7

ENV DATABASE_URL=postgres://postgres:ghqCj0bJWrLjjFpn@database-1.cby89z006voo.us-east-1.rds.amazonaws.com/postgres
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN pip install pipenv -U && pipenv install

EXPOSE 5000
# CMD ["pipenv", "run", "python /app/app.py"]
# CMD [ "pipenv run python /app/app.py" ]
CMD [ "./run_app.sh" ]