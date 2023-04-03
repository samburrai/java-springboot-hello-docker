# Java, Spring Boot, Hello, Dockerfile


```
mvn package

java -jar target/java-springboot-hello-docker-0.0.1-SNAPSHOT.jar

curl localhost:8080

Bonjour 1 4-03-2023 12:31:31 on unknown%
```

```
docker build -t java-springboot-hello-docker .

docker run -i --rm -p 8080:8080 java-springboot-hello-docker

curl localhost:8080

Bonjour 1 4-03-2023 04:31:59 on cafb6894e2e2%
```

```
docker ps
docker exec -it 8db2b59f4bc8 /bin/bash

cat /etc/os-release
NAME="Oracle Linux Server"
VERSION="8.5"
```