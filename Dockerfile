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

# Command to run your FastAPI app (accounting for your back_end folder!)
CMD ["uvicorn", "back_end.main:app", "--host", "0.0.0.0", "--port", "7860"]
