# Use a minimal Python image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Install git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y bluez && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone the project
RUN git clone https://github.com/martingrayson/python-miramode .

# Install the package using setup.py
RUN pip install .

ENTRYPOINT ["miramodecli"]
