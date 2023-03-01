# Pull python image
FROM python:3.7.4

# Set work directory
WORKDIR /app

# Install dependencies
RUN ls -l
COPY requirements.txt requirements.txt
RUN pip install -r app/requirements.txt
RUN ls -l

# Copy project
COPY . .

# Start gunicor web server on port 5000
CMD ["gunicorn", "--log-level", "debug", "--bind", "0.0.0.0:5000", "api:app"]