#Dockerfile
FROM python:3.11-slim AS base

# Set env vars
# instruct python to not outut .pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1
# set following env to ensure python output streams (stdout and stderr are sent to terminal without buffering)
ENV PYTHONUNBUFFERED=1
ENV FLASK_SECRET_KEY='T3stK3y!'

# Install git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working dir
WORKDIR /app

# Copy the requirements file and install the dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the application code
COPY . .

# Ensure .git (hidden) directory is copied
COPY .git .git

# Expose the port the app will run on
EXPOSE 3000

# Build stage for testing
FROM base AS test

# Run unit tests
RUN python -m unittest discover -s tests

# Final stage
FROM base AS final

# Run the application
CMD ["python", "app.py"]