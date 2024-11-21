# alfresco-content-repository-community

We need to work with external PostgreSQL in version 13.
We should replace new JDBC driver older version 42.3.2.

To download required version od JDBC driver:

 - [postgresql-42.3.2.jar](https://repo1.maven.org/maven2/org/postgresql/postgresql/42.3.2/postgresql-42.3.2.jar)

```xml
<!-- https://mvnrepository.com/artifact/org.postgresql/postgresql -->
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <version>42.3.2</version>
</dependency>
```

 - [postgresql-42.7.3.jar](https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.3/postgresql-42.7.3.jar)

```xml
<!-- https://mvnrepository.com/artifact/org.postgresql/postgresql -->
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <version>42.7.3</version>
</dependency>
```

## Build image command

```bash
export ALFRESCO_VERSION=23.3.0
docker build -f Dockerfile \
 --build-arg ALFRESCO_CONTAINER_VERSION=${ALFRESCO_VERSION} \
 -t scisoftware/alfresco-content-repository-community:${ALFRESCO_VERSION} .

```


