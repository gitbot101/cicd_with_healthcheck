#!/bin/bash

# Set env vars
APP_NAME="gitbot101-app"
IMAGE_NAME="gitbot101-app-image"
PORT=3000

echo "--- Building Docker Image ---"
docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]; then
    echo "Docker build failed. Exiting."
    exit 1
fi

echo "--- Running Docker Container ---"
docker run -e $FLASK_SECRET_KEY --rm -d -p $PORT:3000 --name $APP_NAME $IMAGE_NAME

if [ $? -eq 0 ]; then
    echo "App is running at http://localhost:$PORT"
    echo "To stop the app, run: docker stop $APP_NAME"
    echo "To delete the app image, run: docker rmi $IMAGE_NAME"
else
    echo "Failed to start the app."
fi
