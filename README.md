# ibmcloud-cli-docker
This is a Docker image wrapper around the IBM Cloud CLI (and dev tools). Basically, it pulls in zsh, fonts, and plugins in order to improve the experience around using the CLI, especially in conjunction with Kubernetes via IKS or OpenShift.

## Usage
All you need is Docker.

First, built the image:
```sh
$ make build
```

Now, run it:
```sh
$ docker run -it ibmcloud
```

That's it!
