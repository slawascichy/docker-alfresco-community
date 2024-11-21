#######################################
# Alfresco Image
#######################################
ARG ALFRESCO_CONTAINER_VERSION=23.3.0
FROM alfresco/alfresco-content-repository-community:${ALFRESCO_CONTAINER_VERSION}

# We need to work with external PostgreSQL in version 13
# Replace new JDBC driver older version 42.3.2
ARG POSTGRESQL_JDBC_VERSION=42.3.2
RUN rm -rf /usr/local/tomcat/lib/postgresql-*.jar
COPY jdbcdrivers/postgresql-${POSTGRESQL_JDBC_VERSION}.jar /usr/local/tomcat/lib/postgresql-${POSTGRESQL_JDBC_VERSION}.jar

VOLUME ["/usr/local/tomcat/alf_data","/usr/local/tomcat/lib","/usr/local/tomcat/logs"]

RUN $JAVA_HOME/bin/java -version