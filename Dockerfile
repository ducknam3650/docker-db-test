FROM python:3.13-slim-buster

WORKDIR /app
# 해당 작업을 할 디렉토리

# Install Poetry
RUN pip install poetry

# Copy pyproject.toml and poetry.lock to leverage Docker cache
COPY pyproject.toml poetry.lock ./

# Install dependencies
RUN poetry install --no-root --no-dev

# Copy the rest of the application code
COPY . .

# Expose the port FastAPI runs on
EXPOSE 8000

# Run the application
CMD ["poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
