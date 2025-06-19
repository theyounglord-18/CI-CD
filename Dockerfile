# Use Python 3.13 slim image
FROM python:3.13.5-slim as base

# Avoid .pyc files and enable logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all source files
COPY . .

# Create non-root user (optional)
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

USER appuser

# Expose port
EXPOSE 8000

# Run the Flask app via Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
