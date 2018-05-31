# Conditional Forwarding DNS Bind Server

A BIND based conditional DNS forwarding server, packaged as a Docker image, with the option to deploy automatically using docker-compose and a simple script.

Based on [https://hub.docker.com/r/resystit/bind9/](https://hub.docker.com/r/resystit/bind9/), a Docker container that facilitates conditional forwarding to any number of domain-specific upstream DNS servers.


## Requirements
This requires a dockerized host (Linux VM running Docker Engine) and Docker Compose.

The `deploy.sh` script expects that `docker-compose` exists at `/usr/local/bin/docker-compose`.

## Simple Usage

Edit `forwarders.conf`, removing the examples and adding your own conditional forwarders, such as:
```
zone "mydomain.local" {
  type forward;
  forwarders { 192.168.5.20; 192.168.5.60; };
};
```

Edit `named.conf` to set the default (fallback) upstream DNS servers and the allowed clients (`acl trusted { ... }`).

To start the system applying changes, run:
```
docker-compose up -d --build
```

## Advanced Usage

The `deploy.sh` script checks for changes in `origin/master`, if changes are found, then it builds and runs a new container with the changes.

To use it this way, you'd need to fork this repository (and configure appropriate security and deploy keys), and then setup a cron job:
```
*/5 *  * * * cd /path/to/conditional-dns && ./deploy.sh 2>&1 >> ./deploy.log
```

### Author

jeffgreenca, 2018.
