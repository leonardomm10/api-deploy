# Pull python image
FROM python:3.7.4

# Set work directory
WORKDIR /app

# Copy project
COPY . .

# Install dependencies
RUN ls -l
RUN ls -l app/
RUN ls -l /app/
RUN pip install -r app/requirements.txt

# Start gunicor web server on port 5000
CMD ["gunicorn", "--log-level", "debug", "--bind", "0.0.0.0:5000", "api:app"]