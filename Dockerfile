FROM  --platform=linux/amd64 python:3.8-slim-buster
COPY requirements.txt /app/requirements.txt
RUN apt update -y
RUN pip install -r /app/requirements.txt
COPY app.py /app/app.py
COPY info.txt /app/info.txt
WORKDIR /app
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
