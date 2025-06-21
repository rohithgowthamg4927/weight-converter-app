# Weight Converter Web Application

A simple, responsive web application that converts weights between different units including kilograms, grams, pounds, and ounces. Built with Flask and designed for easy deployment using Docker and Kubernetes.

## Screenshot

![image](https://github.com/user-attachments/assets/d71a7109-f034-4d0c-8936-3a698323e94b)

## Features

- **Multi-unit Conversion**: Supports conversion between kilograms (kg), grams (g), pounds (lb), and ounces (oz)
- **Input Validation**: Prevents negative values and handles invalid inputs gracefully
- **Responsive Design**: Clean, modern UI that works across different screen sizes
- **Real-time Results**: Instant conversion results with precise decimal formatting
- **Error Handling**: User-friendly error messages for invalid inputs

## Technology Stack

- **Backend**: Python 3.12 with Flask web framework
- **Frontend**: HTML5 with custom CSS styling and Google Fonts
- **Containerization**: Docker with multi-stage builds for optimized image size
- **Orchestration**: Kubernetes deployment with health checks
- **Dependencies**: Minimal Flask ecosystem (Flask, Jinja2, Werkzeug)

## Application Architecture

The application follows a simple MVC pattern:
- **Model**: Weight conversion logic with precise mathematical calculations
- **View**: Single-page HTML template with embedded CSS
- **Controller**: Flask routes handling GET/POST requests and form processing

### Conversion Logic
The application uses kilograms as the base unit for all conversions:
- 1 kg = 1000 g
- 1 kg = 2.20462 lb  
- 1 kg = 35.274 oz

## Local Development

### Prerequisites
- Python 3.12+
- pip package manager

### Setup
```bash
# Clone the repository
git clone <repository-url>
cd weight-converter-app

# Install dependencies
pip install -r requirements.txt

# Run the application
python app.py
```

The application will be available at `http://localhost:80`

## Deployment Options

### Docker Deployment

The application uses a multi-stage Docker build for optimization:

```bash
# Build the Docker image
docker build -t weight-converter-app .

# Run the container
docker run -p 80:80 weight-converter-app
```

**Docker Features:**
- Multi-stage build reduces final image size
- Uses Python 3.12 Alpine for minimal footprint
- Exposes port 80 for web traffic
- Includes .dockerignore for clean builds

### Kubernetes Deployment

Production-ready Kubernetes configuration with health checks:

```bash
# Deploy to Kubernetes
kubectl apply -f k8s/deploy.yaml
kubectl apply -f k8s/service.yaml
```

**Kubernetes Features:**
- Deployment with configurable replicas
- NodePort service for external access
- Readiness and liveness probes for reliability
- Uses pre-built image: `rohith4927/weight-converter-app:v2`

## Production Considerations

- **Health Monitoring**: Configured readiness and liveness probes
- **Scalability**: Kubernetes deployment supports horizontal scaling
- **Security**: Input validation prevents malicious inputs
- **Performance**: Lightweight Flask application with minimal dependencies
- **Reliability**: Error handling for edge cases and invalid inputs

## Project Structure

```
weight-converter-app/
├── app.py              # Flask application and conversion logic
├── index.html          # Frontend template with styling
├── requirements.txt    # Python dependencies
├── Dockerfile         # Multi-stage Docker build
├── k8s/               # Kubernetes manifests
│   ├── deploy.yaml    # Deployment configuration
│   └── service.yaml   # Service configuration
├── .dockerignore      # Docker build exclusions
└── .gitignore        # Git exclusions
```

