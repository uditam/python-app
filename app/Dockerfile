FROM python:3.8.7

RUN mkdir /app
ADD . /app
WORKDIR /app
RUN pip install pipenv -U && pipenv install

EXPOSE 5000
# CMD ["pipenv", "run", "python /app/app.py"]
# CMD [ "pipenv run python /app/app.py" ]
CMD [ "./run_app.sh" ]
