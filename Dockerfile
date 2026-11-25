FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --default-timeout=300 --retries 10 -r requirements.txt

COPY pyproject.toml /tmp/build/
COPY logiai/ /tmp/build/logiai/
RUN pip install --no-cache-dir --no-deps /tmp/build && rm -rf /tmp/build

COPY models/ ./models/

EXPOSE 8000

CMD ["python", "-m", "uvicorn", "logiai.api.main:app", "--host", "0.0.0.0", "--port", "8000"]