# minipie

* To build use `$ ./build.sh` You'll be prompted for a version tag. Alternately, use `$ docker build - < DOCKERFILE_HERE`
* `$ cp Dockerfile-<version> Dockerfile`
* If you're not using the build script, manually build and tag `$ docker build -t kongaaron/minipie:1.0.0 -t kongaaron/minipie:latest .` (assumes Dockerfile in current directory)
* Again, if you're not using the build script, after building and tagging, to upload `$ docker push kongaaron/minipie` and `$docker push kongaaron/minipie:1.0.0`

## Usage:
`docker run --rm kongaaron/minipie https://httpbin.org/anything`
or within a Kubernetes Cluster, as a Deployment:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpie
spec:
  replicas: 1
  selector:
    matchLabels:
      app: httpie
  template:
    metadata:
      labels:
        app: httpie
    spec:
      containers:
        - name: httpie
          image: kongaaron/minipie
          command: [ "sleep" ]
          args: [ "3600" ]
```


## Design
Because this container is expected to be run in a pod where you'll need to make HTTP requests, it's as small of a build of httpie as I could make (hence the name).
