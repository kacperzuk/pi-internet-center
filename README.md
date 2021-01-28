Create volumes in advance:
docker volume create -o o=bind -o device=/volume1/docker/letsencrypt-lib --name letsencrypt-lib
docker volume create -o o=bind -o device=/volume1/docker/letsencrypt-etc --name letsencrypt-etc
docker volume create -o o=bind -o device=/volume1/docker/postgres --name postgres
docker volume create -o o=bind -o device=/volume1/docker/nextcloud --name nextcloud

Options you may need in your Nextclouds config/config.php:
'overwrite.cli.url' => 'https://yourdomain',
'overwriteprotocol' => 'https',
