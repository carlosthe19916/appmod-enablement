# Start docker
docker stop customers-tomcat-legacy || true && docker rm customers-tomcat-legacy || true

docker run --name customers-tomcat-legacy -d -p 5432:5432 \
  -e POSTGRES_DB=customers \
  -e POSTGRES_USER=customers \
  -e POSTGRES_PASSWORD=customers \
  postgres:13.1

# Generate .war
mvn clean package

# Download Tomcat
rm -rf workspace/
wget https://repo1.maven.org/maven2/org/apache/tomcat/tomcat/10.1.0-M12/tomcat-10.1.0-M12.zip -P workspace/
unzip workspace/tomcat-10.1.0-M12.zip -d workspace/
chmod +x -R ./workspace/apache-tomcat-10.1.0-M12/bin

# Copy .war to Tomcat
cp target/customers-tomcat-0.0.1-SNAPSHOT.war workspace/apache-tomcat-10.1.0-M12/webapps/customers-tomcat.war

# Start Tomcat
./workspace/apache-tomcat-10.1.0-M12/bin/startup.sh

sleep 10s
