#!/usr/bin/env bash

set -e

echo "🔍 Checking prerequisites..."

# Check Docker
if ! command -v docker &> /dev/null; then
  echo "[ERROR] Docker is not installed."
  exit 1
fi

# Check Docker Compose
if ! command -v docker-compose &> /dev/null; then
  echo "[ERROR] Docker Compose is not installed."
  exit 1
fi

echo "✅ Prerequisites OK"

echo "🧹 Cleaning previous state..."
docker-compose down -v || true

echo "🏗️  Building and starting containers..."
docker-compose up --build -d

echo "⏳ Waiting for services to become healthy..."

# Wait loop (max 60 seconds)
for i in {1..30}; do
  if curl -s http://localhost/health > /dev/null; then
    echo "🎉 [SUCCESS] Application is live at http://localhost"
    exit 0
  fi
  sleep 2
done

echo "[ERROR] Application failed to start in time."
docker-compose logs
exit 1
