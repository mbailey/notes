# podman

- [Podman is gaining rootless overlay support  Enable Sysadmin (www.redhat.com)](https://www.redhat.com/sysadmin/podman-rootless-overlay)


## Usage

Tag an image:

```shell
podman tag 2064b9bc9da7 myimage:latest
```

## Install

```shell
sudo dnf install -y \
  podman \
  podman-docker \
  podman-compose
```

## Config

### Show
```
podman info
```

**Set $DOCKER_HOST for backwards compatibility with things that need it:**

```
export DOCKER_HOST="unix://$(podman info --format '{{.Host.RemoteSocket.Path}}')"
```
 
### Stop telling me it's Podman emulating Docker
```
sudo touch /etc/containers/nodocker
```

### Default to docker.io image registry
```
sudo vi /etc/containers/registries.conf
registries = ['docker.io']
```


## See also

- [Fedora 38  Podman  Install  Server World (www.server-world.info)](https://www.server-world.info/en/note?os=Fedora_38&p=podman&f=1)


