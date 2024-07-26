# Use a minimal Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /usr/src/app

# Update package lists and install git
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Ensure permissions are set correctly
RUN chmod 777 /usr/src/app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set the command to run your application
CMD ["bash", "start.sh"]
