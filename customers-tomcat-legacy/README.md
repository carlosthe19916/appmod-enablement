# Quickstart

Start the database:

```shell
docker run -p 5432:5432 \
-e POSTGRES_DB=customers \
-e POSTGRES_USER=customers \
-e POSTGRES_PASSWORD=customers \
postgres:13.1
```

## Deploy application to Tomcat using Cargo Plugin

Start Tomcat using:

```shell
mvn clean package cargo:run
```

## Deploy application downloading a server

Create a .war artifact:

```shell
mvn clean package
```

Download Tomcat:

```shell
wget https://repo1.maven.org/maven2/org/apache/tomcat/tomcat/9.0.46/tomcat-9.0.46.zip -P workspace/
unzip workspace/tomcat-9.0.46.zip -d workspace/
```

Copy .war to Tomcat:

```shell
cp target/customers-tomcat-0.0.1-SNAPSHOT.war workspace/apache-tomcat-9.0.46/webapps/customers-tomcat.war
```

Start Tomcat:

```shell
chmod +x -R ./workspace/apache-tomcat-9.0.46/bin
./workspace/apache-tomcat-9.0.46/bin/startup.sh
```

Stop Tomcat:

```shell
chmod +x -R ./workspace/apache-tomcat-9.0.46/bin
./workspace/apache-tomcat-9.0.46/bin/shutdown.sh
```

## Use the application

Verify the application is running:

```shell
curl http://localhost:8080/customers-tomcat/customers
``` 
