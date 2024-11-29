#!/bin/bash
############################################
# Script starting/stoping docker compose with alfresco services.
############################################

# Envinroments
export COMPOSE_NAME=docker-alfresco-community
export PROJECT_HOME=/cygdrive/d/workspace/git/${COMPOSE_NAME}
export COMPOSE_FILE=community-compose.yaml
export ENV_FILE=external-conf.env

echo "Alfresco Services - $1"
cd $PROJECT_HOME

start()
{
    docker compose -f ${COMPOSE_FILE} --env-file ${ENV_FILE} start
}

stop()
{
    docker compose -f ${COMPOSE_FILE} --env-file ${ENV_FILE} stop
}

status()
{
    docker container ls --format "table {{.Names}}\t{{.ID}}\t{{.Status}}" | grep "${COMPOSE_NAME}\|CONTAINER ID"
    echo -e "\n To connect the container use command:"
    echo " > docker exec -it <CONTAINER_ID> bash"
}

restart()
{
    docker compose -f ${COMPOSE_FILE} --env-file ${ENV_FILE} restart
}

export MYUID=`id -u`
if [ "$MYUID" -ne 0 ]; then echo "Please run this script as root or using sudo!"; exit 1; fi

case "$1" in
    start)
            start
            ;;
    stop)
            stop
            ;;
    status)
            status
            ;;
    restart)
            restart
            ;;
    *)
            echo "Usage: $0 {start|stop|restart|status}"
esac

exit 0
