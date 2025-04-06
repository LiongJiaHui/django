# Use the official Python image from DockerHub 
FROM python:3.12-slim 

# Set environment variables 
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=django.conf.global_settings

# Set work directory 
WORKDIR /app

# Copy and install app dependencies (main Django requirements)
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Optionally install documentation dependencies (if needed for dev)
COPY docs/requirements.txt ./docs/requirements.txt
RUN pip install -r docs/requirements.txt

# Copy the rest of your project files
COPY . .

# Run the Django development server
CMD ["python", "manage.py", "runserver", "localhost:8000"]