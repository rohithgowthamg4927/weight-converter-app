# Use a builder image to install dependencies
FROM python:3.12 AS builder

# Set the working directory in the builder image
WORKDIR /app

# Copy the requirements file into the builder image
COPY requirements.txt .

# Install the dependencies in the builder image
RUN pip install --no-cache-dir -r requirements.txt

# Use a smaller base image for the final image
FROM python:3.12-alpine

# Set the working directory in the final image
WORKDIR /app

# Copy the installed packages from the builder image
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /app /app

# Copy the application files into the final image
COPY app.py .  # Make sure app.py is copied
COPY templates/ ./templates  # Copy templates directory

# Expose the port the app runs on
EXPOSE 80

# Command to run the application
CMD ["python3", "app.py"]
