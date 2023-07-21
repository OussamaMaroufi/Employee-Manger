# Employee-Manger

# Setup postgres database using docker compose:
```
version: '3.8'

services:
  postgresdb:
    container_name: postgresdb
    image: postgres:latest
    environment:
      - POSTGRES_USER=username
      - POSTGRES_PASSWORD=password
      - POSTGRES_DB=employee_db
    ports:
      - "5432:5432"
    volumes:
      - pg_data:/var/lib/postgresql/data

volumes:
  pg_data:
```

