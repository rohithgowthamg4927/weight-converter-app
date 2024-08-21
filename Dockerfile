FROM python:3.10

#set working dir
WORKDIR /app

# Copy requirements.txt to container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

#Copy appln code 
COPY . .

# Expose port 80(HTTP) for container to run on
EXPOSE 80

#command to run application
CMD ["python", "app.py"]
