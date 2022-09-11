FROM python:3.6-alpine

RUN pip install flask

COPY app.py /

EXPOSE 8080
#EXPOSE 9090

CMD [ "python", "./app.py" ]
