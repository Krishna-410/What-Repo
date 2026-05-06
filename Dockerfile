# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the heavy ML libraries and your dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your project code into the container
COPY . .

# Expose port 7860 (Hugging Face strictly requires this port)
EXPOSE 7860

# Move into the back_end folder before starting the server
WORKDIR /app/back_end

# Run the app directly from inside that folder
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]
