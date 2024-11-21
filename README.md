# docker-alfresco-community


A docker compilation that allows you to run an Alfresco document repository 
with an external PostgreSQL database instance and an external Apache ActiveMQ instance.

Starting of docker compose:

```bash
docker compose -f community-compose.yaml --env-file external-conf.env up
```