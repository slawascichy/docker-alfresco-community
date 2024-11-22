# alfresco-content-repository-community

We need to work with external PostgreSQL in version 13.
We should replace current (newer) JDBC driver with older version: 42.3.2.

The best repository with required libraries is Maven2 Repository. 
To download required version of JDBC driver you can use followed links:

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

## Additional volumes declared in image

In image was declared three volumes (see [Dockerfile](Dockerfile)):

| Localization | Description |
| ---- | -------------- |
| /usr/local/tomcat/alf_data | Data of document repository, document files stored in the repository. |
| /usr/local/tomcat/logs | Logged events files. |
| /usr/local/tomcat/lib | Folder with libraries, used globally by Apache Tomcat server. This is target folder where JDBC driver' is stored. |

## Build image command

```bash
export ALFRESCO_VERSION=23.3.0
docker build -f Dockerfile \
 --build-arg ALFRESCO_CONTAINER_VERSION=${ALFRESCO_VERSION} \
 -t scisoftware/alfresco-content-repository-community:${ALFRESCO_VERSION} .

```


