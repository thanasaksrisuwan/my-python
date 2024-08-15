# Use the official Python base image
FROM python:3.11-slim

# Metadata
LABEL maintainer="thanasak_sri@outlook.com"

# Set the working directory
WORKDIR /app

# Copy the requirements file to the image
COPY dependencies.txt .

# Install the required packages
RUN pip3 install --no-cache-dir -r dependencies.txt

# Download the spaCy model
RUN python3 -m spacy download en_core_web_sm

# Copy the entire application to the image
COPY . .

# Set environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=development  
# Remove or set to 'production' in production

# Expose port 5000 (default Flask port)
EXPOSE 5000

# Default command
CMD [ "flask", "run" ]
