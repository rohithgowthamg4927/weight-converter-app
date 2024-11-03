# Build stage 1

FROM python:3.12 AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt


#Stage 2
FROM python:3.12-alpine

COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages

WORKDIR /app

COPY app.py .

COPY index.html .

EXPOSE 80

CMD ["python3", "app.py"]