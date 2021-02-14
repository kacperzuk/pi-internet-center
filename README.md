Create volumes in advance:
```
docker volume create -o o=bind -o device=/volume1/docker/letsencrypt-lib --name letsencrypt-lib
docker volume create -o o=bind -o device=/volume1/docker/letsencrypt-etc --name letsencrypt-etc
docker volume create -o o=bind -o device=/volume1/docker/postgres --name postgres
docker volume create -o o=bind -o device=/volume1/docker/nextcloud --name nextcloud
docker volume create -o o=bind -o device=/volume1/docker/pihole --name pihole
docker volume create -o o=bind -o device=/volume1/docker/dnsmasq --name dnsmasq
```
Additionally, options you may want to set for nextcloud:

```
docker exec --user www-data -it pi-internet-center_nextcloud_1 php occ config:system:set allow_local_remote_servers --value true --type bool
docker exec --user www-data -it pi-internet-center_nextcloud_1 php occ config:system:set overwrite.cli.url --value https://yourdomain --type string
docker exec --user www-data -it pi-internet-center_nextcloud_1 php occ config:system:set overwriteprotocol --value https --type string
```
