FROM python:3-alpine

WORKDIR /app

COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

ENTRYPOINT [ "flask" ]
CMD ["run", "--host=0.0.0.0"]