# minipie

* To build use `$ docker build - < DOCKERFILE_HERE`
* `$ cp Dockerfile-<version> Dockerfile`
* To tag and build `$ docker build -t kongaaron/minipie:1.0.0 -t kongaaron/minipie:latest .` (assumes Dockerfile in current directory)
* Once you tag and build, to upload `$ docker push kongaaron/minipie`

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
