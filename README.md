# Employee-Manger

# Prerequisites

In order to run this project you should have Docker and Docker Compose installed on your local machine. If you haven't yet installed docker. Please check the official documentation [documentation](https://www.docker.com/).

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

# Part1: Install  Jenkins and Sonarqube

```
version: '3.9' 


services:

  jenkins:
    image: jenkins/jenkins:lts
    container_name: jenkins
    volumes:
      - jenkins_data:/var/jenkins_home
    networks:
      - sonarnet
    ports:
      - '8080:8080'
      - '50000:50000'

  sonarqube:
    image: sonarqube:7.6-community
    container_name: sonarqube
    volumes:
      - sonarqube_conf:/opt/sonarqube/conf
      - sonarqube_data:/opt/sonarqube/data
      - sonarqube_extensions:/opt/sonarqube/extensions
      - sonarqube_bundled-plugins:/opt/sonarqube/lib/bundled-plugins
    networks:
      - sonarnet
    ports:
      - '9000:9000'
    environment:
      - sonar.jdbc.username=sonar
      - sonar.jdbc.password=sonar
      - sonar.jdbc.url=jdbc:postgresql://db:5432/sonar
    depends_on:
      - db

  db:
    image: postgres
    container_name: postgres
    networks:
      - sonarnet
    environment:
      - POSTGRES_USER=sonar
      - POSTGRES_PASSWORD=sonar
    volumes:
      - postgresql:/var/lib/postgresql
      - postgresql_data:/var/lib/postgresql/data

networks:
  sonarnet:
    driver: bridge

volumes:
  jenkins_data:
  sonarqube_conf:
  sonarqube_data:
  sonarqube_extensions:
  sonarqube_bundled-plugins:
  postgresql:
  postgresql_data:
```
![362237245_797202738610038_5540471531903592416_n](https://github.com/OussamaMaroufi/Employee-Manger/assets/93825558/19ed72e1-f9b3-49c6-95ba-f6ba367d5b72)

![362244933_1321072515193166_3564181584333705681_n](https://github.com/OussamaMaroufi/Employee-Manger/assets/93825558/b8602aea-533c-452b-af4a-cffbcfa06134)
