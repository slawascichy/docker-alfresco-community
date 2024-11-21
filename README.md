# docker-alfresco-community


A docker compilation that allows you to run an Alfresco document repository 
with an external PostgreSQL database instance and an external Apache ActiveMQ instance.

Starting of docker compose:

```bash
docker compose -f community-compose.yaml --env-file external-conf.env up
```

Open your browser and check everything starts up correctly:

| Service | Endpoint |
| --- | ----------- |
| Administration and REST APIs |	http://localhost:8080/alfresco |
| Share |	http://localhost:8080/share |
| Digital Workspace |	http://localhost:8080/workspace |
| Search Services administration (see this [page](https://docs.alfresco.com/content-services/latest/install/containers/docker-compose/#search-services-administration) for info on how to login) |	http://localhost:8083/solr |
| Transform Router configuration  |	http://localhost:8095/transform/config |
