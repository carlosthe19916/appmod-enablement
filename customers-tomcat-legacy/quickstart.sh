# Start docker
docker run -d -p 5432:5432 \
  -e POSTGRES_DB=customers \
  -e POSTGRES_USER=customers \
  -e POSTGRES_PASSWORD=customers \
  postgres:13.1

sleep 10s

# Deploy application using Cargo Plugin
mvn clean package cargo:run

# Ready
