FROM python:3.9-slim

WORKDIR /app

COPY ./connect_to_db.py /app

COPY ./requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["python", "connect_to_db.py"]