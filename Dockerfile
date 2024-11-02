FROM python:3.12 AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt



FROM python:3.12-alpine

COPY --from=builder /app /app

WORKDIR /app

EXPOSE 80

CMD ["python3", "app.py"]