# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create and set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose the port the application runs on
EXPOSE 8000

# Collect the static files
RUN python manage.py collectstatic --noinput

# Start the Django application using gunicorn
CMD gunicorn your_project_name.wsgi:application --bind 0.0.0.0:8000
