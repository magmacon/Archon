FROM python:3.12-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

# Expose ports (Ensure Streamlit and Backend are open)
EXPOSE 8501
EXPOSE 8101

# Set the entrypoint to run Streamlit directly
CMD ["streamlit", "run", "streamlit_ui.py", "--server.port=8501", "--server.address=0.0.0.0"]
