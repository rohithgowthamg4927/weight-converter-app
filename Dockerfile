FROM python:3.12 AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.12-alpine

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /app /app

COPY app.py .  # Make sure app.py is copied
COPY templates/ ./templates  # Copy templates directory

EXPOSE 80

CMD ["python3", "app.py"]
