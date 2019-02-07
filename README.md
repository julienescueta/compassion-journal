# compassion-journal

## Notes

Update `vm.max_map_count` on host

```bash
$ grep vm.max_map_count /etc/sysctl.conf
vm.max_map_count=262144
```

[Install Elasticsearch with Docker](https://www.elastic.co/guide/en/elasticsearch/reference/6.5/docker.html)

Hacky way of provisioning ELK onto EC2. ECS is definitely a better way to do this.

This was merely an exercise of trying to get something I experimented with, using docker-compose, onto AWS. I thought it would be a trivial matter of installing `docker-compose` on the host machine, but, it ended up being a hacky and non-standard/non-portable/terraform-only way of accomplishing this, by transferring my local `docker-compose.yml` to the host, via ssh.

## Acknowledgements

- [Elasticsearch Cluster and Kibana using docker-compose](https://medium.com/@maxy_ermayank/elasticsearch-cluster-and-kibana-using-docker-compose-4f9c4d6c5470). Thanks! This was a great resource to help me get started.