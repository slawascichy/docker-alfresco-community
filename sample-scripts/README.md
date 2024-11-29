# sample-scripts

## Start/stop services script

Sample script to start/stop docker containers with Alfresco Services is in file [bin/start-stop-service.sh](bin/start-stop-service.sh).
The script requires some refinement because it does not yet work well with the Linux service being created (see next section: *Docker container as a Linux system service*).

## Docker container as a Linux system service

Sample service definition is in file [bin/alfresco-services.service](bin/alfresco-services.service).

Copy the file bin/alfresco-services.service into folder `/etc/systemd/system/`.

Edit the file if it is required.

We now can start service by issuing the corresponding command:

```bash
systemctl start alfresco-services
```

We can also install the service to run at start up by running:

```bash
systemctl enable alfresco-services.service
```