# docker-alfresco-community

A docker composition that allows you to run an Alfresco document repository with external instances of PostgreSQL database and Apache ActiveMQ .

Starting of docker compose:

```bash
docker compose -f community-compose.yaml --env-file external-conf.env up
```

Open your browser and check everything starts up correctly:

| Service | Endpoint |
| --- | ----------- |
| Administration and REST APIs |	http://localhost:8080/alfresco |
| Share |	http://localhost:8080/share |
| User and Group management |	http://localhost:8080/admin |
| traefik proxy dashboard |	http://localhost:8888/dashboard/#/ |
| Search Services administration (see this [page](https://docs.alfresco.com/content-services/latest/install/containers/docker-compose/#search-services-administration) for info on how to login) |	http://localhost:8083/solr |
| Transform Router configuration  |	http://localhost:8090/transform/config |

## Environment variables

Below is a list of variables that should be defined in the *.env file.

### Volume localization

| Variable | Sample value | Description |
| --- | --- | ----------- |
| VOLUME_BASE_DIR | `/d/mercury/alfresco` |	This variable defines the mount point (root directory) of local directories that are mounted as container volumes. See the "volumes:" section in the [community-compose.yaml](community-compose.yaml) file defining the compose. |

### URL Generation Parameters

Content Services is pre-configured with a set of system configuration parameters. Many of the system configuration parameters are completely exposed as properties, which you can configure for your specific environment requirements.
See also [Configure->Overview->Using alfresco-global.properties](https://docs.alfresco.com/content-services/latest/config/#using-alfresco-globalproperties).

| Variable | Description |
| --- | ----------- |
| ALFRESCO_CONTEXT | The value represents the `alfresco.context` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server in the 'alfresco-content-repository-community' container. Default value is `alfresco`. |
| ALFRESCO_HOST | The value represents the `alfresco.host` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Default value is `localhost`. |
| ALFRESCO_PORT | The value represents the `alfresco.port` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Default value is `8080`. |
| ALFRESCO_PROTOCOL | The value represents the `alfresco.protocol` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Possible values are: `http` or `https`, default is `http`. |
| SHARE_CONTEXT | The value represents the `share.context` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server in the 'alfresco-content-repository-community' container. Default value is `share`. |
| SHARE_HOST | The value represents the `share.host` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Default value is `localhost`. |
| SHARE_PORT | The value represents the `share.port` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Default value is `8080`. |
| SHARE_PROTOCOL | The value represents the `share.protocol` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Possible values are: `http` or `https`, default is `http`.|

### CSRF filter overrides

See also [Configure->Overview->Using alfresco-global.properties](https://docs.alfresco.com/content-services/latest/config/#using-alfresco-globalproperties).

| Variable | Description |
| --- | ----------- |
| CSRF_FILTER_ENABLED | The value represents the `csrf.filter.enabled` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Default value is `false`. |
| CSRF_FILTER_REFERER | The value represents the `csrf.filter.referer` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Default value is `http://localhost:8080(/.*)?`. Value is used in 'alfresco-share' container as environment variable `CSRF_FILTER_REFERER`, too. |
| CSRF_FILTER_REFERER_ALWAYS | The value represents the `csrf.filter.referer.always` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Default value is `false`. |
| CSRF_FILTER_ORIGIN | The value represents the `csrf.filter.origin.always` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Default value is `http://localhost:8080(/.*)?`. Value is used in 'alfresco-share' container as environment variable `CSRF_FILTER_ORIGIN`, too. |
| CSRF_FILTER_ORIGIN_ALWAYS | The value represents the `csrf.filter.origin.always` parameter stored in the `alfresco-global. properties` file or as a JVM option when starting application server the 'alfresco-content-repository-community' container. Default value is `false`. |

### PostgreSQL database connection definition

Connection definition to external PostgreSQL database.

| Variable | Description |
| --- | ----------- |
| POSTGRESQL_USERNAME | Database user' name |
| POSTGRESQL_PASSWORD | Database user' password |
| POSTGRESQL_URL | Database connection' URL. Sample: `jdbc:postgresql://192.168.56.1:5432/alfresco` |

### Sorl Shared Secret

Between the 'content' and 'search' services, communication is performed to update data between both engines. A special token is used to authenticate the communication. See also [Search Services administration
](https://docs.alfresco.com/content-services/latest/install/containers/docker-compose/#search-services-administration).

| Variable | Description |
| --- | ----------- |
| SORL_SHARED_SECRET | Token value, default is `'secret`. |


### Apache ActiveMQ connection definition

Connection definition to external Apache ActiveMQ server.

| Variable | Description |
| --- | ----------- |
| ACTIVEMQ_URL | Connection' URL. Sample: `failover:(nio://192.168.56.1:51616)` |

